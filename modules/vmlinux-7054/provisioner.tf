resource "null_resource" "vmlinux-provisioner-linux" {
  for_each = local.instances

  provisioner "remote-exec" {
    inline = ["echo Hostname: $(hostname)"]
  }

  connection {
    type = "ssh"
    user = var.admin_username
    host = azurerm_linux_virtual_machine.linux-VM[each.key].public_ip_address
    private_key = file(var.private_key_path)
  }

  depends_on = [azurerm_linux_virtual_machine.linux-VM]
}
