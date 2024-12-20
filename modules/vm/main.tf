resource "azurerm_linux_virtual_machine" "vm" {
  name = "app-vm"
  resource_group_name = var.resource_group_name
  location = var.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"

  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  custom_data = base64encode(
    <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo docker run -d -p 80:80 yeasy/simple-web
    EOF
  )

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb = 64
    name = "app-os-disk"
  }
  tags = {
    application = "simple-web"
  }

  depends_on = [ 
    azurerm_network_interface.nic,
    azurerm_public_ip.public_ip
   ]
}

resource "azurerm_network_interface" "nic" {
  name = "app-nic"
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "internal"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_public_ip" "public_ip" {
  name = "app-public-ip"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Dynamic"
}