output "resource_group_name" {
  value = azurerm_resource_group.humber_rg.name
  description = "The name of the created resource group"
}

output "location" {
  value = azurerm_resource_group.humber_rg.location
}
