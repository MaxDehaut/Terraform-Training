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

#    subscription_id = ""
#    tenant_id = ""
}

# Resource Group
resource "azurerm_resource_group" "rgtf" {
  name     = "rgTerraform"
  location = "West Europe"

  tags = {
    "environment" = "Training"
  }
}
