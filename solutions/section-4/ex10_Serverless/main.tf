# Resource Group
resource "azurerm_resource_group" "training" {
  name     = "rg-${var.suffix}"
  location = var.location

  tags = {
    "environment" = "training"
    "costalloc"   = "${var.costalloc}"
  }
}
# Random String (name for storage account to avoid "already exists" message)
resource "random_string" "rand" {
  length  = 24
  special = false
  upper   = false
}
# Storage Account
resource "azurerm_storage_account" "training" {
  name                     = random_string.rand.result
  resource_group_name      = azurerm_resource_group.training.name
  location                 = azurerm_resource_group.training.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
# Storage Container
resource "azurerm_storage_container" "training" {
  name                  = "sc${var.suffix}"
  storage_account_name  = azurerm_storage_account.training.name
  container_access_type = "private"
}
# Module
module "tweetish" {
  source = "MaxDehaut/azure/tweetish"
  #  source  = "git::https://abc?ref=v1.0.0"

  version = "1.0.0"
}
# Storage Blob
resource "azurerm_storage_blob" "training" {
  name                   = "server.zip"
  storage_account_name   = azurerm_storage_account.training.name
  storage_container_name = azurerm_storage_container.training.name
  type                   = "Block"
  source                 = module.tweetish.output_path
}
# Shared Access Signature
data "azurerm_storage_account_sas" "training" {
  connection_string = azurerm_storage_account.training.primary_connection_string

  resource_types {
    service   = false
    container = false
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2016-06-19T00:00:00Z"
  expiry = "2048-06-19T00:00:00Z"

  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}
# Locals
locals {
  package_url = "https://${azurerm_storage_account.training.name}.blob.core.windows.net/${azurerm_storage_container.training.name}/${azurerm_storage_blob.training.name}${data.azurerm_storage_account_sas.training.sas}"
}
# Application Insights
resource "azurerm_application_insights" "training" {
  name                = "api-${var.suffix}"
  location            = azurerm_resource_group.training.location
  resource_group_name = azurerm_resource_group.training.name
  application_type    = "web"
}
# App Service Plan
resource "azurerm_app_service_plan" "training" {
  name                = "apl-${var.suffix}"
  location            = azurerm_resource_group.training.location
  resource_group_name = azurerm_resource_group.training.name
  kind                = "functionapp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}
# Function App
resource "azurerm_function_app" "training" {
  name                = "fun-${var.suffix}"
  location            = azurerm_resource_group.training.location
  resource_group_name = azurerm_resource_group.training.name
  app_service_plan_id = azurerm_app_service_plan.training.id
  https_only          = true

  storage_account_name       = azurerm_storage_account.training.name
  storage_account_access_key = azurerm_storage_account.training.primary_access_key
  version                    = "~2"

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = "node"
    WEBSITE_RUN_FROM_PACKAGE       = local.package_url
    WEBSITE_NODE_DEFAULT_VERSION   = "10.14.1"
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.training.instrumentation_key
    TABLES_CONNECTION_STRING       = data.azurerm_storage_account_sas.training.connection_string
    AzureWebJobsDisableHomepage    = true
  }
}
