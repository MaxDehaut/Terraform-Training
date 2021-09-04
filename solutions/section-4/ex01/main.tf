module "application" {
  source = "./modules/application"
}

module "database" {
  source = "./modules/database"
}

module "networking" {
  source   = "./modules/networking"
  location = var.location
  suffix = var.suffix
}