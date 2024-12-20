variable "subnet_id" {
  description = "The ID of the subnet where the VM will be deployed"
  type = string
}

variable "location" {
  description = "The location of the VM"
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}