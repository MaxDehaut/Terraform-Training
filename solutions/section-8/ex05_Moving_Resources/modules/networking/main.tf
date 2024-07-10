resource "azurerm_virtual_network" "training" {
  name                = "vnt-${var.suffix}"
  address_space       = ["10.0.0.0/16"]
  location            = var.rg.location
  resource_group_name = var.rg.name
}
