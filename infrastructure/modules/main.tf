data "azurerm_resource_group" "rg" {
  name     = "learn-8144f05b-7787-44e7-ac22-265ae1fc7a05"
}

resource "azurerm_app_service_plan" "asp" {
  name                = var.appname
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}


# Create an App Service (Web App)
resource "azurerm_app_service" "app" {
  name                = "my-sample-app"
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  location            = data.azurerm_resource_group.rg.location
  site_config {
    always_on = true
  }

  app_settings = {
    WEBSITE_NODE_DEFAULT_VERSION = "16.x"
  }
}

# Optional: Create a Storage Account for logging or backups
resource "azurerm_storage_account" "storage" {
  name                     = "stor_afe"
  resource_group_name      = data.azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS" 
  location            = data.azurerm_resource_group.rg.location
}

