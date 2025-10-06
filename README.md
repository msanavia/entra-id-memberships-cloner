# EntraID Memberships Cloner
## Description
This Bash script will clone groups memberships from one user to another, or clone all members from one group to another.
## Requirements
 - [AzureCLI](https://learn.microsoft.com/en-us/cli/azure/)
 - Relevant Entra ID role assigned/active
## How to use it
Before running the script, make sure you've authenticated the CLI against the correct EntraID tenant.
The script will take 2 objects IDs as argument when executed. If both the GUIDs are 
 - Users, it will copy group memberships across
 - Groups, it will copy all the members across
If there is a mismatch of object type (eg. one GUID is a user and the other is a group), the script will error out and communicate the mistake.
### Example of use
	./entra-id-memberships-cloner.sh 9797faf5-dc92-52de-b269-18ab26606825 84b3a322-7b6c-5d66-bf2e-853bb800ef02

## Disclaimer
You are free to download, use and edit this script. I do not however take any responsibility for any problem that may arise from its use, in any case.