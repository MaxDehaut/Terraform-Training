# Exercise 5.01 - Azure Storage as backend

## Step 1 - Using Powershell to connect

- Login to Az using Powershell or az cli - Connect-AzAccount

## Step 2 - Create a script to create the backend

- **ONLY FOR THE BRAVES**: starting from only-the-brave.ps1:
  - Create a resource group
  - Create a storage account
  - Create a storage container
  - Collect the storage account key

- or Run a script: config-backend-state.ps1

## Step 3 - Configure Terraform backend state

- Create a main.tf file with the standard "terraform" and azurerm provider elements
- Declare a "backend" element within "terraform" element with the following attributes:
  - resource_group_name: the resource group
  - storage_account_name: The name of the Azure Storage account.
  - container_name: The name of the blob container.
  - key: The name of the state store file to be created.

- Set the values based on the output of the powershell script

## Step 4 - Execute the main.tf

- Add a resource group

## Step 5 - Execute the main.tf

- Once the plan has been generated, perform a "terraform state pull"
- Once "apply" has been done, go and check on Azure Portal the file has been created
- !!! Don't forget to destroy !!!

---

Note: Each of these values can be specified in the Terraform configuration file or on the command line. We recommend that you use an environment variable for the access_key value. Using an environment variable prevents the key from being written to disk.

---
