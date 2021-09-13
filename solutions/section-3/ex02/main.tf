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
}

variable "appname" {
  description = "The name of the application"
  default     = "tfTraining"
}
variable "environment" {
  description = "The name of the environment"
  default     = "dev"
}
variable "location" {
  description = "The name of the Azure location"
  default     = "westeurope"
  validation {
    condition     = can(index(["westeurope", "westus"], var.location) >= 0)
    error_message = "The location must be westeurope or westus."
  }
}

locals {
  resource_name = "${var.appname}-${var.environment}"
}

# Resource Group
resource "azurerm_resource_group" "rgtf" {
  name     = "rg-${local.resource_name}"
  location = "${var.location}"
}
