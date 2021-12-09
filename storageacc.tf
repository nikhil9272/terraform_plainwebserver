################ Storage Account ################

resource "azurerm_storage_account" "storage_name" {
  name                     = var.storageaccount_name
  resource_group_name      = azurerm_resource_group.appservice-rg.name
  location                 = azurerm_resource_group.appservice-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Billing    = var.billing
    IT_Service = var.it_service
    Env        = var.tags_env
  }
}

resource "azurerm_storage_container" "website_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_name.name
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "sas_key" {
  connection_string = azurerm_storage_account.storage_name.primary_connection_string
  https_only        = true
  resource_types {
    service   = false
    container = false
    object    = true
  }
  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }
  start  = "2021-03-21"
  expiry = "2027-03-21"
  permissions {
    read    = true
    write   = true
    delete  = false
    list    = true
    add     = false
    create  = false
    update  = false
    process = false
  }
}