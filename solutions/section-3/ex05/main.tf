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
  description = "The name of the application"
  default     = "sec3"
}
variable "environment" {
  description = "The name of the environment"
  default     = "training"
}

# Resource Group
resource "azurerm_resource_group" "training" {
  name     = var.environment == "Production" ? upper(format("rg-%s", var.appname)) : upper(format("rg-%s-%s", var.appname, var.environment))
  location = "West Europe"

  tags = {
    "environment" = "Training"
  }
}
