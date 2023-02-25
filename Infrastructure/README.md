Infrastructure

Mostly uses Terraform for resource provisioning.
Pre-requisites:
 - Create terraform state file store in AWS using backend configuration. state file is stored in S3. Check code for details.
 - Add dynamodb table to store terraform lock file. Use backend configuration for reference. Check code for details.

 Resources created :
