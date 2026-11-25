output "resource_group_name" {
  description = "Application resource group name"
  value       = azurerm_resource_group.main.name
}

output "container_registry_name" {
  description = "Application container registry name"
  value       = azurerm_container_registry.main.name
}


output "container_registry_login_server" {
  description = "Application container registry login server"
  value       = azurerm_container_registry.main.login_server
}


output "web_app_name" {
  description = "Azure linux web Application name"
  value       = azurerm_linux_web_app.main.name
}


output "web_app_url" {
  description = "HTTPS URL of the dashboard"
  value       = "https://${azurerm_linux_web_app.main.default_hostname}"
}