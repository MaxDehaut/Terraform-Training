# Exercise 8.03 - Reuse Azure Keyvault Secrets

This exercise shows how to use secrets and prevent the use of Terraform state.

## Step 1 - Prepare the exercise

- Make sure that there is a secret created in your Azure KeyVault
- Collect the files from exercise 7.02
  - PLEASE NOTE THESE SCRIPTS USE EXTERNAL AZURERM MODULES: network & linux server
- Some tidy-up is required:
  - "random" resources are not required
  - "local_file" resource is not required
  - output values are not required

## Step 2 - Edit the script

- Declare a "azurerm_client_config" data element which will be used to collect the provider configuration

```terraform
data "azurerm_key_vault_secret" "training" {
  name         = "..."
  key_vault_id = "..."
}
```

- Set the administrator login with a hard-coded value
- Set the administrator password with the value stored in the azurerm_key_vault_secret.training

## Step 3 - Execute the script

- Execute the script
- You should be able to connect to the Virtual Machine with the login/password
