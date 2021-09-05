
# Resource Group
resource "azurerm_resource_group" "training" {
  name     = "rg-${var.suffix}"
  location = var.location

  tags = {
    "environment" = "training"
    "costalloc"   = "${var.costalloc}"
  }
}

# Virtual Network
resource "azurerm_virtual_network" "training" {
  name                = "nt-${var.suffix}"
  resource_group_name = azurerm_resource_group.training.name
  location            = azurerm_resource_group.training.location
  address_space       = ["10.0.0.0/16"]

  tags = {
    "environment" = "training"
    "costalloc"   = "${var.costalloc}"
  }
}

# Subnet
resource "azurerm_subnet" "training" {
  name                 = "internal"
  virtual_network_name = azurerm_virtual_network.training.name
  resource_group_name  = azurerm_resource_group.training.name
  address_prefixes     = ["10.0.1.0/24"]
}