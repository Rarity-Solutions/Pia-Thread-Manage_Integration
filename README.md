# Integrating Pia and Thread in ConnectWise Manage

**Pia-Thread-Manage Integration**  
This project demonstrates a seamless integration of Pia automations with Thread and ConnectWise Manage, leveraging advanced automation and note-parsing capabilities to streamline ticket management and automation workflows.

### Key Features:  
1. **Automated Workflow Triggers**:
   - Automatically initiates Pia automation when a ticket's subtype is set to "Start" by Thread's Magic Agent and Flow configuration.
   
2. **Dynamic Note Parsing**:
   - Parses ticket notes in ConnectWise Manage to extract actionable arguments using predefined patterns. These arguments are then utilized to populate variables for Pia automations.

3. **Universal Pia Action**:
   - Implements a universal Pia action (`Pia-Thread Get Note Details`) that:
     - Retrieves and parses ticket notes via the ConnectWise Manage API.
     - Updates ticket type and subtype to "Pia Completed" and "End," respectively, to stop further automation runs.
     - Appends detailed results of the automation to the ticket as an audit note.

4. **Timeout and Retry Logic**:
   - The automation process includes a retry mechanism for fetching ticket notes:
     - **Timeout**: Up to 10 minutes for retries (`$timeout = New-TimeSpan -Minutes 10`).
     - **Retry Interval**: Retries every 15 seconds (`$interval = New-TimeSpan -Seconds 15`).
   - This ensures reliable note parsing, even if the data is not immediately available.

5. **Scalable and Modular Design**:
   - Supports future enhancements such as adding subtypes for workflows like User Onboarding, Software Installations, and Datto RMM integrations.
   - Provides a foundation for using a single script to handle diverse automations by passing arguments dynamically.

6. **Real-Time Updates**:
   - Automatically synchronizes notes and updates in ConnectWise Manage, ensuring Thread Inbox reflects accurate and up-to-date information.

### How It Works:
- **Trigger**: Magic Agent sets the ticket subtype to "Start."
- **Pia Automation**:
  - Extracts arguments from ticket notes using the Manage API.
  - Executes predefined workflows based on the extracted data.
- **Completion**:
  - Updates ticket subtype to "End" to prevent re-execution.
  - Adds detailed audit notes to track automation results.

This project establishes a robust, reusable framework for integrating Pia automations with ConnectWise Manage and Thread, while incorporating reliable timeout and retry mechanisms for data processing.

### Integration Instructions

1\. Log into to ConnectWise Manage and click "System" at the bottom left of the screen.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/9c33aacd-f7f0-43e1-9849-1010baf9fa84/user_cropped_screenshot.jpeg?tl_px=0,595&br_px=189,945&force_format=jpeg&q=100&width=125&wat_scale=11&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=47,216)


2\. Click "Setup Tables"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/816362d7-9556-48b3-b595-3f09b791921f/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=189,363&force_format=jpeg&q=100&width=242&wat_scale=21&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=74,71)


3\. Click the "Table" field, type "\*board", hit Enter, and click "Service Board".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/018cc441-9353-452c-91db-ca47edfb64e6/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=303,198)


4\. Click the Service Board. In this example "Help Desk".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/076615ed-eb00-4c79-ba71-6c9ff5de1fa8/ascreenshot.jpeg?tl_px=0,2&br_px=982,551&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=196,243)


5\. Click the "Types" tab.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/450d3d8f-4b31-476e-99d4-ec2e975c169d/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=337,83)


6\. Click the "+" icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/d07c5fd9-6e12-45e3-863a-b497781e0da2/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=208,116)


7\. Click the "Type Description" field and type "Pia Running".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/1854675d-07c2-4d64-9bec-a622656f6433/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=974,544&force_format=jpeg&q=100&width=974&wat_scale=86&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=355,217)


8\. Click the "Save And Close" icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/a714a606-57b5-4b64-afb9-30d23d8d3e96/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=298,119)


9\. Click the "+" icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/75e3c452-c547-4cf2-83a0-a590167ea26b/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=207,115)


10\. Click the "Type Description" field and type "Pia Completed".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/f1219ab6-8063-4564-bf8f-f15a05e57a23/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=974,544&force_format=jpeg&q=100&width=974&wat_scale=86&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=337,217)


11\. Click the "Save And Close" icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/286eaea3-06c0-4921-9220-4daa5941603f/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=297,123)


12\. Click the "Subtypes" tab.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/98b1d8cb-5593-4f3c-8163-6098aa3995d7/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=1134,634&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=397,77)


13\. Click the "+" icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/010ae76f-a4c7-4c49-b852-d52b22d2aa55/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=209,116)


14\. Click the Subtype Description field and type "Start".

Note: This subtype will trigger the Pia automation. You will need to create new subtypes as you start building new automations.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/086795d8-e768-4039-97e1-3026db9a7adf/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=1541,945&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=252,144)


15\. Select "Pia Running" and click "&gt;".

Note: This ties the Subtype to the Type.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/c33669e0-b098-4d39-8fe5-4b15144484d3/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=1541,945&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=368,262)


16\. Click the "Save And Close" icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/419b9f08-5e19-4199-8b41-151a104ae6d8/ascreenshot.jpeg?tl_px=0,0&br_px=1376,769&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=234,86)


17\. Click the "+" icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/3ba0f66e-20e3-409a-bda2-56d44c5588d0/ascreenshot.jpeg?tl_px=0,0&br_px=1376,769&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=165,85)


18\. Click the Subtype Description field and type "End".

Note: This subtype will end the trigger in the Pia automation.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/168e4ad9-2ef2-4240-8d00-e766ac40ca72/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=1541,945&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=263,147)


19\. Select "Pia Completed" and click "&gt;".

Note: This ties the Subtype to the Type.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/7e334344-645e-4df6-9cde-b4867f6a684c/ascreenshot.jpeg?tl_px=0,26&br_px=1376,795&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=417,277)


20\. Click the "Save And Close" icon.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/ec2d929b-e02f-404d-b54f-ec61a9a892b0/ascreenshot.jpeg?tl_px=0,0&br_px=1376,769&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=233,87)


21\. Log into Pia and select the appropriate "Sandbox".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/78d944ba-b360-4554-be5b-f467141c20b7/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=339,70)


22\. Click "Activity Editor".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/38cf44c2-c80a-43b7-b00d-dd383da51e29/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=114,408)


23\. In the New Activity window, enter "Pia-Thread: Get Note Details" in the Name field and "get_note_details" in the Static Name field. Click "Create".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/5b25a5b6-80ee-44e2-98b2-319d2ac1eb36/ascreenshot.jpeg?tl_px=164,175&br_px=1541,945&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=705,347)


24\. Replace with the script from GitHub and click "Variables".

<https://github.com/Rarity-Solutions/Pia-Thread-Manage_Integration/blob/main/Activity_Pia-Thread_GetNoteDetails.ps1>

Note: This script loops though all the notes looking for "with the following arguments:". Once found, it scrapes the note for the arguments and presents to the Pia package to be used.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/b119311a-da2c-4358-90bb-a7b9910ba875/ascreenshot.jpeg?tl_px=76,0&br_px=1452,769&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=524,12)


25\. Click the "+" buttons to add 4 Input and 2 Output Fields.

Variable Name &gt; Default Value\
"CW_Api_Url" &gt; "$CW_Api_Url"\
"CW_Api_Token" &gt; "$CW_Api_Token"\
"CW_Api_Client_Id" &gt; "$CW_Api_Client_Id"\
"Ctx_Ticket_Id" &gt; "$Ctx_Ticket_Id"

Output:\
Variable Name\
"success"\
"details"

Note: These variables will be passed back and forth to the Pia Package.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/e6f37394-7410-4d3b-9757-b7a8732f55c4/user_cropped_screenshot.jpeg?tl_px=197,152&br_px=1343,792&force_format=jpeg&q=100&width=1120.0)


26\. Click "Save Details".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/dfe632a8-bc1f-4567-ab6b-5c72ca05f423/ascreenshot.jpeg?tl_px=209,164&br_px=1356,805&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=551,526)


27\. Click "Save".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/6e10f442-6644-4d1b-b9ac-880eab01567b/ascreenshot.jpeg?tl_px=0,0&br_px=860,480&force_format=jpeg&q=100&width=860&wat_scale=76&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=596,38)


28\. Click "Package Editor".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/3619ace6-b23c-462a-ae99-f11eec7ffd9d/ascreenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=128,362)


29\. Type "Pia-Thread: Get Note Details" and click "Create".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/2a9749f6-5238-446c-a801-2ab7daed2432/ascreenshot.jpeg?tl_px=558,258&br_px=1540,807&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=477,358)


30\. Replace with the script from GitHub and update the "type_id" and "subtype_id".

<https://github.com/Rarity-Solutions/Pia-Thread-Manage_Integration/blob/main/Package_Pia-Thread_GetNoteDetails.yaml>

Note: This Pia Package uses the Pia Action created above to pull the information from the ticket after Thread Magic Agent writes it to the ticket. Use this package as a template to build further packages.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/a74fd69e-7bf4-4e15-99c9-51f4a11a8953/ascreenshot.jpeg?tl_px=182,0&br_px=1541,759&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=436,256)


31\. Click the "Activities..." field, type "Pia-Thread", and select "Pia-Thread: Get Note Details".

Note: This can be used in further packages if you don't use the template above.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/0f83563b-b22e-4677-b7da-dff47e309f68/ascreenshot.jpeg?tl_px=164,11&br_px=1541,780&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=940,277)


32\. Click "Save".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/6db4e739-8a79-45f6-a29f-27403d656828/ascreenshot.jpeg?tl_px=115,0&br_px=1098,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=459,36)


33\. Click "Promote to Live".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/3e34b2a7-a450-4fb9-90de-a9a144e79a87/ascreenshot.jpeg?tl_px=558,0&br_px=1540,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=537,33)


34\. Click "Promote".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/69745a4d-1603-4745-9928-10a30784c821/ascreenshot.jpeg?tl_px=122,175&br_px=1499,945&force_format=jpeg&q=100&width=1120.0&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=524,463)


35\. Follow Steps 28-32 to create a Pia package you can use against a ticket to pull the Type, Subtype, and Status IDs from Manage to populate the "type_id" and "subtype_id" in Step 30.

<https://github.com/Rarity-Solutions/Pia-Thread-Manage_Integration/blob/main/Package_Pia-Thread_GetTypesSubtypesStatusIDs.yaml>


36\. Log into Thread Admin and click "Integrations".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/3db6b2c6-a8ca-4d58-a59f-3fec9162fc86/user_cropped_screenshot.jpeg?tl_px=0,48&br_px=180,457&force_format=jpeg&q=100&width=289&wat_scale=25&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=88,453)


37\. Click "PSA".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/b919b6e9-254a-420a-9aa6-458238298f34/ascreenshot.jpeg?tl_px=0,0&br_px=645,360&force_format=jpeg&q=100&width=645&wat_scale=57&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=294,187)


38\. Click "PSA Sync".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/1b18e100-c650-4754-8b4d-5071c7a2482e/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=645,360&force_format=jpeg&q=100&width=645&wat_scale=57&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=292,61)


39\. Click "Force sync" next to Boards & Categories (types/sub-types).

Note: This will sync the newly created Types/Subtypes from Manage.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/4647bc86-89df-49ba-ac13-38172d3c0770/ascreenshot.jpeg?tl_px=512,208&br_px=1224,606&force_format=jpeg&q=100&width=712&wat_scale=63&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=434,167)


40\. Click "Flows".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/8c09597b-7582-41ea-bbcb-ecdba78d4dd2/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=711,397&force_format=jpeg&q=100&width=712&wat_scale=63&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=23,107)


41\. Click "Create Flow".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/69bb24e0-007b-4a11-b37c-477f17ad9f72/user_cropped_screenshot.jpeg?tl_px=829,0&br_px=1541,397&force_format=jpeg&q=100&width=712&wat_scale=63&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=627,17)


42\. Type "Pia-Thread Automation" and click "Create Flow".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/5f950ed5-f56e-470a-9d4f-808e96f1d960/user_cropped_screenshot.jpeg?tl_px=452,0&br_px=1097,360&force_format=jpeg&q=100&width=645&wat_scale=57&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=297,168)


43\. Select "Board" and select the Service Board selected in Step 4. In this example "Help Desk".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/16019d9b-c625-438f-8bf4-55fffd470031/user_cropped_screenshot.jpeg?tl_px=465,102&br_px=1224,526&force_format=jpeg&q=100&width=759)


44\. Click "+Rule"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/21f79381-925e-4516-835a-07e68a986a3d/ascreenshot.jpeg?tl_px=487,166&br_px=1198,564&force_format=jpeg&q=100&width=712&wat_scale=63&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=149,155)


45\. Select "Type" and select "Pia Running".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/08181cdb-b732-4abc-ba3c-2065c3007f72/user_cropped_screenshot.jpeg?tl_px=460,129&br_px=1219,553&force_format=jpeg&q=100&width=759)


46\. Click "+Rule"

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/e09a88f6-6e6f-4108-b03a-a26c98391e62/ascreenshot.jpeg?tl_px=443,154&br_px=1237,598&force_format=jpeg&q=100&width=794&wat_scale=70&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=189,197)


47\. Select "Sub Type" and "Start".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/cdb0b21d-afc3-4fd3-9849-c320dd02cf72/user_cropped_screenshot.jpeg?tl_px=455,141&br_px=1249,585&force_format=jpeg&q=100&width=794)


48\. Select the "Inbox Channel", "Team", and "Channel" if desired.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/5465e40f-331c-498c-8aac-5763f7d5cce4/user_cropped_screenshot.jpeg?tl_px=472,64&br_px=1231,489&force_format=jpeg&q=100&width=759&wat_scale=67&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=333,187)


49\. Click "Assign" and select the account to assign the ticket to.

Note: This action will stop the Magic Agent from running in Thread.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/fe80ce3b-85da-4bc7-9d34-0ae51bfbebd8/user_cropped_screenshot.jpeg?tl_px=498,408&br_px=1210,806&force_format=jpeg&q=100&width=712&wat_scale=63&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=265,221)


50\. For Testing: Log into Thread Admin and click "Magic AI".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/99835ed9-56e6-4499-b450-cb1ace6339e8/user_cropped_screenshot.jpeg?tl_px=0,18&br_px=180,415&force_format=jpeg&q=100&width=277&wat_scale=24&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=108,297)


51\. Click "Agent".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/eeb14a08-ba5a-4674-bee8-7a1098384774/ascreenshot.jpeg?tl_px=0,0&br_px=589,329&force_format=jpeg&q=100&width=590&wat_scale=52&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=474,47)


52\. Click "Create Intent".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/e1bfb023-4ccf-4989-a42f-394223c1185f/ascreenshot.jpeg?tl_px=1202,119&br_px=1913,517&force_format=jpeg&q=100&width=712&wat_scale=63&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=299,154)


53\. Click the Intent name field and enter "Pia-Thread Automation".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/ac0540e4-d9e1-4d24-98ac-858ae7edbab2/user_cropped_screenshot.jpeg?tl_px=69,0&br_px=662,331&force_format=jpeg&q=100&width=594&wat_scale=53&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=277,13)


54\. Click in the "Describe the intent" field and update it to:\
\
"Example intent to start a Pia automation. Ask each question individually so it's easier for the user to answer."

Note: This should be customized in your future intents.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/3326b0a4-31ad-48e4-973e-6f5e19207ce6/user_cropped_screenshot.jpeg?tl_px=758,0&br_px=1409,363&force_format=jpeg&q=100&width=650&wat_scale=58&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=304,122)


55\. Select the client to target.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/c91fc4d7-6c48-43d3-a9df-1fdcf1184f7f/user_cropped_screenshot.jpeg?tl_px=757,193&br_px=1408,556&force_format=jpeg&q=100&width=650&wat_scale=58&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=304,160)


56\. Click "Save".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/ae51ac4b-1fbf-431c-b5d6-c0ee129bb0ba/ascreenshot.jpeg?tl_px=1208,0&br_px=1920,397&force_format=jpeg&q=100&width=712&wat_scale=63&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=605,14)


57\. Click "Add form field" and add a few questions to be captured in the automation.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/4ff82b4f-536b-4b3c-8c2b-37000fd23e02/ascreenshot.jpeg?tl_px=530,443&br_px=1428,945&force_format=jpeg&q=100&width=897&wat_scale=80&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=280,302)


58\. Type "The automation will start and the ticket will be escalated for verification." in the "External Reply" field.\
\
Type "Add everything collected from the user to the ticket." in the "Internal Reply" field.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/af1ba929-b7f1-41e6-aba9-f8e3dbc477ac/screenshot.jpeg?tl_px=518,124&br_px=1426,631&force_format=jpeg&q=100&width=907)


59\. Make sure it's turned "On" and click "Save".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/ec68a0e9-d1b9-4b93-b4d4-415860a4a53e/ascreenshot.jpeg?tl_px=1208,0&br_px=1920,397&force_format=jpeg&q=100&width=712&wat_scale=63&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=587,11)


60\. Click "New Request".

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/e2f4f704-cff3-4c25-8903-3138a0ff289f/user_cropped_screenshot.jpeg?tl_px=0,3&br_px=302,505&force_format=jpeg&q=100&width=537&wat_scale=47&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=212,785)


61\. Type "Start a Pia automation" and answer any questions entered from above.

Note: The Magic Agent AI Auto-Categorizing will automatically change the Type/Subtype based on the settings configured above.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/f4356643-2df4-4269-8e72-44581c76bb5e/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=301,484&force_format=jpeg&q=100&width=539&wat_scale=48&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=167,767)


62\. Log into Thread Inbox and look at verify the automation completed successfully. Sometimes you must click "Sync thread with PSA" to pull in the latest changes from Manage written by Pia.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/d2a4585e-81c9-479e-8489-6c78c9c9c4cc/screenshot.jpeg?tl_px=0,0&br_px=1103,2482&force_format=jpeg&q=100&width=498)


63\. Log into Manage and select the "Start a Pia automation" ticket.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/4abc7c3b-43c7-4243-9797-3077689fcdf5/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=982,549&force_format=jpeg&q=100&width=983&wat_scale=87&wat=1&wat_opacity=0.7&wat_gravity=northwest&wat_url=https://colony-recorder.s3.us-west-1.amazonaws.com/images/watermarks/FB923C_standard.png&wat_pad=684,315)


64\. Here you can see the internal note that Thread wrote with the captured arguments.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/59aff408-660a-4dab-8e3a-8ef0ce748aed/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=813,254&force_format=jpeg&q=100)


65\. Here you can see the Pia scraped the ticket for the arguments written by Thread Magic Agent and returned the results in a new note.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2025-01-20/de79afbb-1661-44d8-b562-f05b262dcbf5/user_cropped_screenshot.jpeg?tl_px=0,0&br_px=805,367&force_format=jpeg&q=100)