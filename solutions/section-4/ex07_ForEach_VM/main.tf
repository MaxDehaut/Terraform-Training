# Resource Group
resource "azurerm_resource_group" "training" {
  name     = "rg-${var.suffix}"
  location = var.location
}

# You might want to consider this alternative in case the resource group exists
# data "azurerm_resource_group" "training" {
#   name = "rgMax"
# }

# Module Networking
module "networking" {
  source = "./modules/networking"

  rg       = data.azurerm_resource_group.training
  suffix   = var.suffix
  vm_names = var.vm_names
}

# Module Application
module "application" {
  source = "./modules/application"

  nics     = module.networking.nics
  rg       = azurerm_resource_group.training
  suffix   = var.suffix
  vm_names = var.vm_names
}
