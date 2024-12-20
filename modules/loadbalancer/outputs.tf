output "load_balancer_ip" {
  description = "The Public IP address of the load balancer"
  value = azurerm_public_ip.lb_public_ip.ip_address
}