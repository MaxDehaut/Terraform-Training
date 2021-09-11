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
  default = "sec3"
}
variable "environment" {
  description ="The name of the environment"
  default = "training"
}
variable "countrycode" {
  description ="The country code"
  default = "LU"
}

locals {
  resource_name = "${var.appname}-${var.environment}-${var.countrycode}"
}

# Resource Group
resource "azurerm_resource_group" "rgtf" {
  name     = "rg-${local.resource_name}"
  location = "West Europe"

  tags = {
    "environment" = "Training"
  }
}
