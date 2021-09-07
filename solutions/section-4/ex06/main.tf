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

  rg     = azurerm_resource_group.training
  suffix = var.suffix
}

# Module Application
module "application" {
  source = "./modules/application"

  nic_id = module.networking.nic_id
  rg     = azurerm_resource_group.training
  suffix = var.suffix
}
