terraform {

  required_version = ">= 0.15"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }

  }

  backend "azurerm" {
    resource_group_name  = "rgTfTraining"
    storage_account_name = "satftraining1941223475"
    container_name       = "sctftraining"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}