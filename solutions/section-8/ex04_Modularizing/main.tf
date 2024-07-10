terraform {

  required_version = ">= 0.15"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }

  }

}

provider "azurerm" {
  features {}
}

locals {
  user_data = {
    for path in fileset(path.module, "users/*.json") : basename(path) => jsondecode(file(path))
  }
}

output "users" {
  value = local.user_data
}

module "user" {
  source       = "./modules/user"
  for_each     = local.user_data
  display_name = each.value.display_name
  login        = each.value.login
  password     = each.value.password
}

resource "local_file" "users" {
  filename = "created-users.txt"
  content  = join("\n", [for m in module.user : m.users])
}
