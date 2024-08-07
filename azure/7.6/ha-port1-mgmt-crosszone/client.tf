
// Setup for Test Client
resource "azurerm_network_interface" "clientinternal" {
  name                = "internal"
  location            = var.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.privatesubnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "Terraform HA AP SDN FortiGates - Crosszone"
  }
}


resource "azurerm_linux_virtual_machine" "client" {
  name                            = "client1"
  resource_group_name             = azurerm_resource_group.myterraformgroup.name
  location                        = var.location
  size                            = var.size
  admin_username                  = var.adminusername
  admin_password                  = var.adminpassword
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.clientinternal.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
