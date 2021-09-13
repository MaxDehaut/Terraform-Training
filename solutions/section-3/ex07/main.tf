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

# Data element - Network Security Group
data "azurerm_resources" "training" {
  type                = "Microsoft.Storage/storageAccounts"
  resource_group_name = "rgTfTraining"
}

output "storage" {
  value = { for n in data.azurerm_resources.training.resources : n.name => n }
}
