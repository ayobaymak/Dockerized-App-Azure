resource "azurerm_lb" "app_lb" {
  name = "app-loadbalancer"
  location = var.location
  resource_group_name = var.resource_group_name
  sku = "Standard"

  frontend_ip_configuration {
    name = "app-frontend"
    public_ip_address_id = var.public_ip_id
  }
}

resource "azurerm_lb_backend_address_pool" "app_pool" {
  loadbalancer_id = azurerm_lb.app_lb.id
  name = "app-backend-pool"
}

resource "azurerm_lb_rule" "app_rule" {
  name = "app-rule"
  loadbalancer_id = azurerm_lb.app_lb.id
  frontend_ip_configuration_name = "app-frontend"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.app_pool.id]
}