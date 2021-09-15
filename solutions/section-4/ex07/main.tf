# Resource Group
resource "azurerm_resource_group" "training" {
  name     = "rg-${var.suffix}"
  location = var.location

  tags = {
    "environment" = "training"
    "costalloc"   = "${var.costalloc}"
  }
}

# Module Networking
module "networking" {
  source = "./modules/networking"

  rg       = azurerm_resource_group.training
  suffix   = var.suffix
  vm_names = var.vm_names
}

# Module Application
module "application" {
  source = "./modules/application"

  nic      = module.networking.nic
  rg       = azurerm_resource_group.training
  suffix   = var.suffix
  vm_names = var.vm_names
}
