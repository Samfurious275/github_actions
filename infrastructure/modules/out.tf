 
# Output the URL of the deployed app
output "app_url" {
  value = azurerm_app_service.app.default_site_hostname
}
