
# Create a Resource Group
resource "azurerm_resource_group" "appservice-rg" {
  name     = "plain"
  location = var.location

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }
}

# Create the App Service Plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "plain-service-plan"
  location            = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }
}

# Create the App Service
resource "azurerm_app_service" "app-service" {
  name                = "plain-app-service"
  location            = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

  site_config {
    always_on        = true
    min_tls_version  = 1.2
  }

  backup {
    name                 = var.backupname
    storage_account_url  = "https://${azurerm_storage_account.storage_name.name}.blob.core.windows.net/${var.container_name}${data.azurerm_storage_account_sas.sas_key.sas}&sr=b"
    schedule {
      frequency_interval = 1
      frequency_unit     = "Day"
    }
  }

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner  
  }
}
