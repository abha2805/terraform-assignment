
resource "azurerm_public_ip" "loadbalancer-pip" {
  name                = "${var.loadbalancer-name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"

  tags = var.common_tags
}

resource "azurerm_lb" "loadbalancer" {
  name                = var.loadbalancer-name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "${var.loadbalancer-name}-ipconfig"
    public_ip_address_id = azurerm_public_ip.loadbalancer-pip.id
  }

  tags = var.common_tags
}

resource "azurerm_lb_backend_address_pool" "loadbalancer-backend-address_pool" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "${var.loadbalancer-name}-address_pool"
 
}

resource "azurerm_lb_probe" "probe" {

  loadbalancer_id     = azurerm_lb.loadbalancer.id
  name                = "http-probe"
  protocol            = "Http"
  request_path        = "/"
  port                = 80

}

resource "azurerm_lb_rule" "loadbalancer-rules" {
  loadbalancer_id                = azurerm_lb.loadbalancer.id
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "${var.loadbalancer-name}-ipconfig"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.loadbalancer-backend-address_pool.id]
  probe_id                       = azurerm_lb_probe.probe.id

}

resource "azurerm_network_interface_backend_address_pool_association" "loadbalancer-nic-backend_pool_association" {
  count                   = length(var.linux_vm_nic_ids)
  network_interface_id    = element(var.linux_vm_nic_ids[*],count.index)
  backend_address_pool_id = azurerm_lb_backend_address_pool.loadbalancer-backend-address_pool.id
  ip_configuration_name   = "${substr(var.linux_vm_name[0], 0, length(var.linux_vm_name[0]) - 2)}-ipconfig-${count.index + 1}"
  
}
