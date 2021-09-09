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

    subscription_id = "3a4e6b0d-b00a-4d29-80ef-b39739928325" # Optional if only one
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
