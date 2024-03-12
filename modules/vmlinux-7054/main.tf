locals {
  instances = { for i in range(1, var.instance_count + 1) : i => "vmlinux-${i}" }
}

resource "azurerm_availability_set" "linux_avs" {
  name                         = "${var.prefix}-avs"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  
  tags = var.common_tags
}

resource "azurerm_network_interface" "linux-nic" {
  for_each = local.instances

  name                = "${var.prefix}-nic-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.prefix}-ipconfig-${each.key}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux-pip[each.key].id
   }

  tags = var.common_tags
}

resource "azurerm_public_ip" "linux-pip" {
  for_each = local.instances

  name                = "${var.prefix}-pip-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.prefix}${each.key}"

  tags = var.common_tags
}

resource "azurerm_linux_virtual_machine" "linux-VM" {
  for_each = local.instances  

  name                = "${var.prefix}-${each.key}"
  computer_name       = "${var.prefix}-${each.key}"

  location            = var.location
  resource_group_name = var.resource_group_name

  availability_set_id = azurerm_availability_set.linux_avs.id
  network_interface_ids = [azurerm_network_interface.linux-nic[each.key].id]
 
  size                  = var.linux_size
  admin_username        = var.admin_username
  
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  os_disk {
    name                 = "${var.prefix}-osdisk-${each.key}"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = var.ubuntu_publisher
    offer     = var.ubuntu_offer
    sku       = var.ubuntu_sku
    version   = var.ubuntu_version
  }
  
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = var.common_tags

}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each = local.instances  

  name                 = "${var.prefix}-network_watcher-${each.key}"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux-VM[each.key].id

  publisher            = var.publisher_network_watcher
  type                 = var.agent_type_network_watcher
  type_handler_version = "1.4"
  auto_upgrade_minor_version = true

  tags = var.common_tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each = local.instances

  name                 = "${var.prefix}-azuremonitor-${each.key}"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux-VM[each.key].id

  publisher            = var.publisher_azure_monitor
  type                 = var.agent_type_azure_monitor
  type_handler_version = "1.0"
  auto_upgrade_minor_version = true

  tags = var.common_tags
}

