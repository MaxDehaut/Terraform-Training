# Resource Group
resource "azurerm_resource_group" "training" {
  name     = "rg-${var.suffix}"
  location = var.location

  tags = {
    "environment" = "training"
    "costalloc"   = "${var.costalloc}"
  }
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.training.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]

  subnet_service_endpoints = {
    subnet2 = ["Microsoft.Sql"]
  }

  tags = {
    environment = "training"
    costcenter  = "${var.costalloc}"
  }

  depends_on = [azurerm_resource_group.training]
}