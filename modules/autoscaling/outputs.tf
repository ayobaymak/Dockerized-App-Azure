output "scale_set_instance_count" {
  description = "The number of instances in the scale set"
  value = azurerm_linux_virtual_machine_scale_set.app_scale_set.instances
}

output "vm_scale_set_id" {
  description = "The ID of the virtual machine scale set"
  value = azurerm_linux_virtual_machine_scale_set.app_scale_set.id
}