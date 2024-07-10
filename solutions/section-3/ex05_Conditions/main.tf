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
  default     = "TfTraining"
}
variable "environment" {
  description = "The name of the environment"
  default     = "dev"
}
variable "location" {
  description = "The name of the Azure location"
  default     = "westeurope"

  validation {
    condition     = contains(["West Europe", "westeurope"], var.location)
    error_message = "The location must be West Europe or westeurope."
  }
}

locals {
  resource_name = "${var.appname}-${var.environment}"
}

# Resource Group
resource "azurerm_resource_group" "training" {
  name     = var.environment == "Production" ? upper(format("rg-%s", var.appname)) : lower(format("rg-%s-%s", var.appname, var.environment))
  location = var.location
}
