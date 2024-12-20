resource "azurerm_linux_virtual_machine_scale_set" "app_scale_set" {
  name = "app-scale-set"
  location = var.location
  resource_group_name = var.resource_group_name
  sku = "Standard_DS1_v2"
  instances = 2

  admin_username = "azureuser"
  custom_data = base64encode(<<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install -y docker.io
                sudo systemctl start docker
                sudo systemctl enable docker
                sudo docker run -d -p 80:80 yeasy/simple-web
                EOF
  )

  network_interface {
    name = "app-nic"
    primary = true

    ip_configuration {
      name = "app-ip"
      subnet_id = var.subnet_id
      primary = true
    }
  }
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb = 64
  }
}