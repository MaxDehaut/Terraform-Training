# Exercise 8.01 - Rotate access keys

The purpose of this exercise is to create a keyvault to store keys, certificates, ...

## Step 1 - Prepare the exercise

- Create a main.tf file

## Step 2 - Declare the resources

- Declare a "azurerm_resource_group" resource
- Declare a "random_string" resource

```terraform
resource "random_string" "rand" {
  length  = 16
  special = false
  upper   = false
}
```

- Declare a "azurerm_client_config" data element which will be used to collect the provider configuration

```terraform
data "azurerm_client_config" "current" {}
```

- Declare a "azurerm_key_vault" with the following configuration

  Attribute                  | Value     | Comment
  -------------------------- | --------- | -------------------
  name                       | ?         | from random_string
  location                   | ?         | from resource group resource
  resource_group_name        | ?         | use resource group resource
  sku_name                   | "premium" |
  tenant_id                  | ?         | from azurerm_client_config resource
  soft_delete_retention_days | 7         |  

  - Within the key vault declaration, the access policy (access_policy) configuration should be:

    ```terraform
    access_policy {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = data.azurerm_client_config.current.object_id
    
      key_permissions = [ "backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", 
                    "recover", "restore", "sign", "unwrapKey","update", "verify", "wrapKey" ]
    
      secret_permissions = [ "backup", "delete", "get", "list", "purge", "recover", "restore", "set" ]
    
      storage_permissions = [ "backup", "delete", "deletesas", "get", "getsas", "list", "listsas", 
                      "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update" ]
      }    
    ```

## Step 3 - Declare the outputs

- 2 output values are expected returning:
  - the identifier of the key vault
  - the uri (vault_uri) of the key vault

## Step 4 - Execute the script
