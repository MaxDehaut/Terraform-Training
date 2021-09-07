
resource "random_pet" "login" {
  length = 8
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@/'\""
}

resource "azurerm_storage_account" "training" {
  name                     = "trainingsa"
  resource_group_name      = var.rg.name
  location                 = var.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    "environment" = "training"
    "costalloc"   = "${var.costalloc}"
  }
}

# SQL Server
resource "azurerm_mssql_server" "training" {
  name                         = "sql-${var.suffix}"
  resource_group_name          = var.rg.name
  location                     = var.rg.location
  version                      = "12.0"
  administrator_login          = random_pet.login.id
  administrator_login_password = random_password.password.result

  tags = {
    "environment" = "training"
    "costalloc"   = "${var.costalloc}"
  }
}

resource "azurerm_mssql_database" "training" {
  name           = "training-db"
  server_id      = azurerm_mssql_server.training.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = true

  tags = {
    "environment" = "training"
    "costalloc" = "${var.costalloc}"
  }

}
