# Exercise 4.05 - Application module

- This module is very similar to the "networking" module. The diagram on the slide is (hopefully) explanatory.

## Quick help

- Use the [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources) documentation
- The suggested configuration for App Service Plan's SKU is
  - Tier = "Basic"
  - Size = "B1"
- The suggested configuration for App Service's site config is
  - dotnet_framework_version = "v4.0"
  - remote_debugging_enabled = true
  - remote_debugging_version = "VS2019"

## Last step - Execute the deployment
