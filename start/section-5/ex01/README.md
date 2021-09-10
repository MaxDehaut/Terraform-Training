# Exercise 5.01 - Azure Storage as backend

## Step 1 - Using Powershell to connect

- Login to Az using Powershell command: Connect-AzAccount

## Step 2 - Configure Terraform backend state

- Define parameters / Set a value to parameters
  - storage_account_name: The name of the Azure Storage account.
  - container_name: The name of the blob container.
  - key: The name of the state store file to be created.

  - access_key: The storage access key.

- Note: Each of these values can be specified in the Terraform configuration file or on the command line. We recommend that you use an environment variable for the access_key value. Using an environment variable prevents the key from being written to disk.

- Run ps script: config-backend-state.ps1
- 

LINKS:
https://www.terraform.io/docs/language/settings/backends/configuration.html
https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=powershell