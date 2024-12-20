provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "app_rg" {
  name = "app-resources"
  location = "East US"
}

module "network" {
  source = "./modules/network"
  location = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
}

module "vm" {
  source = "./modules/vm"
  location = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  subnet_id = module.network.subnet_id
  depends_on = [ module.network ]
}

module "loadbalancer" {
  source = "./modules/loadbalancer"
  location = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  public_ip_id = module.vm.public_ip_id
}

module "autoscaling" {
  source = "./modules/autoscaling"
  location = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  subnet_id = module.network.subnet_id
}
