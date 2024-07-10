output "db_password" {
  value = module.database.db_config.pwd_admin
  # To reduce the risk of accidentally exporting sensitive data
  sensitive = true
}

output "app_url" {
  value = module.application.app_service_default_hostname
}