resource "azurerm_resource_group" "rahul-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "rahul-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.rahul-rg1.name
  location                 = azurerm_resource_group.rahul-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "rahul-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.rahul-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "rahulblob" {
  name                   = "rahulblob"
  storage_account_name   = azurerm_storage_account.rahul-sa.name
  storage_container_name = azurerm_storage_container.rahul-sc.name
  type                   = "Block"
  source                 = "C:/Users/rahul.babaji.tambe/Downloads/Demo5Modules/Demo5Modules/modules/storageaccount/Demo.zip"
}