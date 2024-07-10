# Resource Group
resource "azurerm_resource_group" "training" {
  name     = "rg-${var.suffix}"
  location = var.location
}

# Module Networking
module "networking" {
  source = "./modules/networking"

  rg     = azurerm_resource_group.training
  suffix = var.suffix
}
