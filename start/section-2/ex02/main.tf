terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
    features {}

#    subscription_id = "___________" # Optional if only one
#    tenant_id = ""
}

# Resource Group
resource "azurerm_resource_group" "___________" {
  name     = "___________"
  location = "___________"

  tags = {
    "___________" = "___________"
  }
}
