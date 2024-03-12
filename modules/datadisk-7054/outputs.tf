output "datadisk_name" {
    value = azurerm_managed_disk.datadisk[*].name
}
