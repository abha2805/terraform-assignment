resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  tags = var.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.recovery_services_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  tags = var.common_tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.common_tags
}

