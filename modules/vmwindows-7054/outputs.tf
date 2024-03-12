output "windows" {
  value =  {
    ids       = azurerm_windows_virtual_machine.windows-VM[*].id
    hostnames = azurerm_windows_virtual_machine.windows-VM[*].name
    nic-ids   = azurerm_windows_virtual_machine.windows-VM[*].network_interface_ids[0]
  }
}
output "windows_vm_hostname" {
  value = azurerm_windows_virtual_machine.windows-VM[*].computer_name
}
output "windows_vm_fqdn" {
  value = azurerm_public_ip.windows-pip[*].fqdn
}
output "windows_private_ip_address" {
  value = azurerm_windows_virtual_machine.windows-VM[*].private_ip_address
}
output "windows_public_ip_address" {
  value = azurerm_windows_virtual_machine.windows-VM[*].public_ip_address
}
output "windows_avs_name" {
  value = azurerm_availability_set.windows_avs.name
}
output "windows_nic_id" {
  value = tolist(azurerm_network_interface.windows-nic[*].id)
}
