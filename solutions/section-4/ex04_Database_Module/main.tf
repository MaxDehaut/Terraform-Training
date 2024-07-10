
# Module Networking
module "networking" {
  source    = "./modules/networking"
  location  = var.location
  suffix    = var.suffix
  costalloc = "it-hq"
}

# Module Database
module "database" {
  source    = "./modules/database"
  rg        = module.networking.rg
  suffix    = var.suffix
  costalloc = "it-dba"
}
