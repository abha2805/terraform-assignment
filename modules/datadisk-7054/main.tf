resource "azurerm_managed_disk" "datadisk" {
  count                = length(var.all_vm_ids)
  name                 = "datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10

   tags = var.common_tags
}

/*resource "azurerm_virtual_machine_data_disk_attachment" "linux_datadisk_attach" {
  count              = length(var.linux_vm_ids)
  managed_disk_id    = azurerm_managed_disk.datadisk[count.index].id
  virtual_machine_id = var.linux_vm_ids[count.index]
  lun                = count.index
  caching            = "ReadWrite"
}

resource "azurerm_virtual_machine_data_disk_attachment" "windows_datadisk_attach" {
  count              = length(var.windows_vm_ids)
  managed_disk_id    = azurerm_managed_disk.datadisk[length(var.linux_vm_ids) + count.index].id
  virtual_machine_id = var.windows_vm_ids[count.index]
  lun                = count.index
  caching            = "ReadWrite"
}
*/

resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attach" {
  count              = length(var.all_vm_ids)
  managed_disk_id    = element(azurerm_managed_disk.datadisk[*].id, count.index + 1)
  virtual_machine_id = var.all_vm_ids[count.index]
  lun                = count.index
  caching            = "ReadWrite"
}
