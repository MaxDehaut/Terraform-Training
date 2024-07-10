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

  # In case you have multiple subscriptions, please specify which one you will be using:
  #    subscription_id = ""
  #    tenant_id = ""
}
