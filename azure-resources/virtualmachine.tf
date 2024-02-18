resource "random_string" "virtual_vm_random" {
  length           = 4
  special          = false
}
resource "azurerm_network_interface" "mynic" {
  name = var.mynic_name
  ip_configuration {
    name = "${var.mynic_name}-internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation ="Dynamic"
  }
  
}
# resource "azurerm_network_interface" "example" {
#   name                = "example-nic"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.example.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

resource "azurerm_linux_virtual_machine" "example" {
  name                = "${var.vm_name}"-random_string.virtual_vm_random
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.mynic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("ssh-keys/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}