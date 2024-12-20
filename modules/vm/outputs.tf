output "vm_public_ip" {
  description = "The Public IP address of the virtual machine"
  value = azurerm_public_ip.public_ip.ip_address
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value = azurerm_network_interface.nic.private_ip_address
}