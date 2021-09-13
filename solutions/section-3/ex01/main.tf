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

  subscription_id = "3a4e6b0d-b00a-4d29-80ef-b39739928325"
}

variable "appname" {
  description ="The name of the application"
  default = "tfTraining"
}
variable "environment" {
  description ="The name of the environment"
  default = "dev"
}
variable "location" {
  description = "The name of the Azure location"
  default     = "West Europe"
}

locals {
  resource_name = "${var.appname}-${var.environment}"
}

# Resource Group
resource "azurerm_resource_group" "rgtf" {
  name     = "rg-${local.resource_name}"
  location = "West Europe"
}
