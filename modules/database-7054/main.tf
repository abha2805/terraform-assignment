resource "azurerm_postgresql_server" "database_instance" {
  name                         = "database-7054"
  location                     = var.location
  resource_group_name          = var.resource_group_name
 
  sku_name                     = var.sku_name
  version                      = var.postgresql_version
  
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  ssl_enforcement_enabled      = true

  tags = var.common_tags
}