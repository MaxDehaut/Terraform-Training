output "db_password" {
  value = module.database.db_config.pwd_admin
  # To reduce the risk of accidentally exporting sensitive data
  sensitive = true
}