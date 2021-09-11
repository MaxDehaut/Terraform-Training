terraform {

  required_version = ">= 0.15"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }

  }

  # Service Principal
  backend "azurerm" {
    resource_group_name  = "rgTfTraining"
    storage_account_name = "satftraining1699639755"
    container_name       = "sctftraining"
    key                  = "terraform.tfstate"
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
