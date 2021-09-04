
resource "random_password" "password" {
    length= 16
    special          = true
    override_special = "_%@/'\""
}

# SQL Server
resource "azurerm_sql_server" "training" {
  name                         = "sql-${var.suffix}"
  resource_group_name          = "${var.rg.name}"
  location                     = "${var.rg.location}"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = random_password.password.result
}