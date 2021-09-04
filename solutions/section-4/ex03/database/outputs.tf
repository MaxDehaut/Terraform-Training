output "db_config" {
  value= {
    usr_admin = azurerm_sql_server.training.administrator_login
    pwd_admin = azurerm_sql_server.training.administrator_login_password
    }
}