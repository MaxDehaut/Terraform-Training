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
}

# Resource Group
resource "azurerm_resource_group" "rgtf" {
  name     = "rgTerraform"
  location = "West Europe"

  tags = {
    "environment" = "Training"
  }
}
