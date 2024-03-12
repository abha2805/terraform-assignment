output "vmlinux" {
  value = {
    ids       = values(azurerm_linux_virtual_machine.linux-VM)[*].id
    hostnames = tolist(values(azurerm_linux_virtual_machine.linux-VM)[*].name)
    nic-ids   = values(azurerm_linux_virtual_machine.linux-VM)[*].network_interface_ids[0]
  }
}

output "vmlinux-fqdn" {
  value = values(azurerm_public_ip.linux-pip)[*].fqdn
}

output "vmlinux-private-ip" {
  value = values(azurerm_linux_virtual_machine.linux-VM)[*].private_ip_address
}

output "vmlinux-public-ip" {
  value = values(azurerm_linux_virtual_machine.linux-VM)[*].public_ip_address
}

output "vmlinux-nic-ids" {
  value = tolist(values(azurerm_network_interface.linux-nic)[*].id)
}
