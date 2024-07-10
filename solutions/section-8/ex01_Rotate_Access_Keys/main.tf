terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Used to access the "azurerm" provider configuration
data "azurerm_client_config" "current" {}

# Resource Group
resource "azurerm_resource_group" "training" {
  name     = lower(format("rg%s", "TfSecretVault"))
  location = "westeurope"
}
# Random String (name for storage account to avoid "already exists" message)
resource "random_string" "rand" {
  length  = 16
  special = false
  upper   = false
}
resource "azurerm_key_vault" "training" {
  name                = "kv${random_string.rand.result}"
  location            = azurerm_resource_group.training.location
  resource_group_name = azurerm_resource_group.training.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                   = "premium"
  soft_delete_retention_days = 7

  # Create a Default Azure Key Vault access policy
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge",
    "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]

    secret_permissions = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]

    storage_permissions = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas",
    "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
  }
}

output "key-vault-id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.training.id
}

output "key-vault-url" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.training.vault_uri
}
