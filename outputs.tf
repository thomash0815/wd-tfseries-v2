output "web_app_id" {
  value = azurerm_linux_web_app.web_app.id
}

output "host_id" {
  value = azurerm_service_plan.host.id
}

output "hostname" {
  value = azurerm_linux_web_app.web_app.default_hostname
}