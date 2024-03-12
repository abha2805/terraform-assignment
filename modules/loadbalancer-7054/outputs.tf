output "loadbalancer-public-ip" {
  value = azurerm_public_ip.loadbalancer-pip.ip_address
}

// Output the load balancer name
output "loadbalancer-name" {
    value = azurerm_lb.loadbalancer.name
}
