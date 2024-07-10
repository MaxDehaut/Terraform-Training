terraform {

  backend "azurerm" {
    resource_group_name  = "rgDevOps"
    storage_account_name = "sadevops1697890517"
    container_name       = "scdevops"
    key                  = "terraform.tfstate"
    #    access_key           = "$(StorageAccountAccessKey)"
  }

}

resource "random_string" "random" {
  length  = 8
  special = true
}

output "str" {
  value = random_string.random.result
}