
# Module Networking
module "networking" {
  source   = "./modules/networking"
  location = var.location
  suffix   = var.suffix
}
