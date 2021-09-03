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

variable "rgname" {
    type = string
    description = "Name of resource group"
    default = "rgTerraform"
}

# Resource Group
resource "azurerm_resource_group" "rgtf" {
  name     = var.rgname
  location = "West Europe"

  tags = {
    "environment" = "Training"
  }
}
