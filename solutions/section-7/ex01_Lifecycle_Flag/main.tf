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
    condition     = can(index(["westeurope", "westus"], var.location) >= 0)
    error_message = "The location must be westeurope or westus."
  }
}
variable "nbrApp" {
  description = "The number of applications to be includeds"
  type        = number
  default     = 2

}

# Resource Group
resource "azurerm_resource_group" "training" {
  name     = upper(format("rg-%s-%s", var.appname, var.environment))
  location = var.location
}

# App Service Plan
resource "azurerm_app_service_plan" "training" {
  name                = "asp-${var.appname}-${var.environment}"
  location            = azurerm_resource_group.training.location
  resource_group_name = azurerm_resource_group.training.name

  sku {
    tier = "Standard"
    size = "S1"
  }
  lifecycle {
    prevent_destroy = true
  }
}

# App Service
resource "azurerm_app_service" "training" {
  name                = "aps-${var.appname}-${var.environment}-max"
  location            = azurerm_resource_group.training.location
  resource_group_name = "rgSectionSix"
  app_service_plan_id = azurerm_app_service_plan.training.id

  lifecycle {
    create_before_destroy = true
  }
}