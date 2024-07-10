output "app_service_name" {
  value = azurerm_app_service.training.name
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.training.default_site_hostname}"
}