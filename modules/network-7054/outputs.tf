output "vnet_name" {
  value = azurerm_virtual_network.humber_vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.humber_subnet.name
}

output "subnet_id" {
  value = azurerm_subnet.humber_subnet.id
}
