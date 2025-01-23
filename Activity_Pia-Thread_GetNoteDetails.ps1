# Verifies required API credentials and ticket ID are present
Function VerifyActivity() {
    if ([string]::IsNullOrEmpty($CW_Api_Url) -or 
        [string]::IsNullOrEmpty($CW_Api_Token) -or 
        [string]::IsNullOrEmpty($CW_Api_Client_Id) -or 
        [string]::IsNullOrEmpty($Ctx_Ticket_Id)) {
        return $false
    }
    return $true
}

# Retrieves and processes ticket notes to find specific action requests
Function GetNoteDetails() {
    $ErrorActionPreference = "Stop"
    
    try {
        # Initialize timeout parameters
        $startTime = Get-Date
        $timeout = New-TimeSpan -Minutes 10
        $interval = New-TimeSpan -Seconds 15
        $noteFound = $false

        # Poll for notes until timeout
        while ((Get-Date) - $startTime -lt $timeout) {
            # Configure API request
            $url = "$CW_Api_Url/apis/3.0/service/tickets/$Ctx_Ticket_Id/notes"
            
            $request = [System.Net.HttpWebRequest]::Create($url)
            $request.Method = "GET"
            $request.ContentType = "application/json"
            $request.Accept = "application/vnd.connectwise.com+json; version=2024.13"
            
            # Set authentication headers
            $authBytes = [System.Text.Encoding]::UTF8.GetBytes($CW_Api_Token)
            $request.Headers["Authorization"] = "Basic " + [Convert]::ToBase64String($authBytes)
            $request.Headers["clientId"] = $CW_Api_Client_Id
            
            # Process API response
            $response = $request.GetResponse()
            $reader = New-Object System.IO.StreamReader($response.GetResponseStream())
            $notes = ConvertFrom-Json $reader.ReadToEnd()
            $response.Dispose()
            
            # Search for action request in notes
            foreach ($note in $notes) {
                if ($note.text -match 'The contact has requested to perform the following action:\s*(.*?)\s*\r?\n\s*with the following arguments:') {
                    $argsMatch = $note.text -match 'with the following arguments:([\s\S]*?)$'
                    if ($argsMatch) {
                        # Extract and return arguments if found
                        $arguments = $matches[1].Trim()
                        $activityOutput.out.success = $true
                        $activityOutput.out.details = $arguments
                        $activityOutput.success = $true
                        return
                    }
                    $noteFound = $true
                    break
                }
            }
            
            # Break if matching note found
            if ($noteFound) {
                break
            }

            # Calculate remaining time and sleep if appropriate
            $elapsedTime = (Get-Date) - $startTime
            $remainingTime = $timeout - $elapsedTime
            
            if ($remainingTime -gt $interval) {
                Start-Sleep -Seconds 15
            } else {
                break
            }
        }
        
        # Handle case when no matching note is found
        $activityOutput.out.success = $false
        $activityOutput.out.details = "No matching note found after 3 minutes of attempts"
        $activityOutput.success = $true
    }
    catch {
        # Handle errors
        $activityOutput.out.success = $false
        $activityOutput.out.details = "Error: $_"
        $activityOutput.success = $false
    }
}

# Main execution function
Function ExecuteActivity() {
    $exec = GetNoteDetails
    return $activityOutput
}