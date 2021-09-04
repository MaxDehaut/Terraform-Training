
# Module Networking
module "networking" {
  source   = "./modules/networking"
  location = var.location
  suffix   = var.suffix
}

# module "database" {
#   source = "./modules/networking"
#   rg     = module.networking.rg
# }
