# App Service Plan
resource "azurerm_app_service_plan" "training" {
  name                = "asp-${var.suffix}"
  location            = var.rg.location
  resource_group_name = var.rg.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

# App Service Plan
resource "azurerm_app_service" "training" {
  name                = "app-${var.suffix}"
  location            = var.rg.location
  resource_group_name = var.rg.name
  app_service_plan_id = azurerm_app_service_plan.training.id

  site_config {
    dotnet_framework_version = "v4.0"
    remote_debugging_enabled = true
    remote_debugging_version = "VS2019"
  }
}