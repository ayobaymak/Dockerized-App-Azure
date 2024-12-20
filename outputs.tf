output "resource_group_name" {
  description = "The name of the resource group wher all the resources are deployed"
  value = azurerm_resource_group.app_rg.name
}

output "location" {
  description = "The Azure region where all the resources are deployed"
  value = azurerm_resource_group.app_rg.location
}

output "vnet_id" {
  description = "The ID of the Virtual Network"
  value = module.network.vnet_id
}

output "subnet_id" {
  description = "The ID of the subnet used for the virtual machine"
  value = module.network.subnet_id
}

output "public_ip_vm" {
  description = "The public IP address of the virtual machine"
  value = module.vm.vm_public_ip
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value = module.vm.vm_private_ip
}

output "load_balancer_public_ip" {
  description = "The public IP of the load balancer"
  value = module.loadbalancer.load_balancer_ip
}

output "vm_scale_set_id" {
  description = "The ID of the virtual machine scale set"
  value = module.autoscaling.vm_scale_set_id
}

output "vm_scale_set_instances" {
  description = "The number of instances in the virtual machine scale set"
  value = module.autoscaling.scale_set_instance_count
}