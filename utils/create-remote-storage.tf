terraform {

  required_version = ">= 0.15"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

  }

}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "training" {
  name     = "rg-${var.suffix}"
  location = var.location
}

# Random String (name for storage account to avoid "already exists" message)
resource "random_string" "rand" {
  length  = 16
  special = false
  upper   = false
}

# Storage Account
resource "azurerm_storage_account" "training" {
  name                     = random_string.rand.result
  resource_group_name      = azurerm_resource_group.training.name
  location                 = azurerm_resource_group.training.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
}

# Storage Container
resource "azurerm_storage_container" "training" {
  name                  = "sc${var.suffix}"
  storage_account_name  = azurerm_storage_account.training.name
  container_access_type = "blob"
}
