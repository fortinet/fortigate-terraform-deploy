resource "azurerm_virtual_machine" "custompassivefgtvm" {
  depends_on                   = [azurerm_virtual_machine.customactivefgtvm]
  count                        = var.custom ? 1 : 0
  name                         = "custompassivefgt"
  location                     = var.location
  resource_group_name          = azurerm_resource_group.myterraformgroup.name
  network_interface_ids        = [azurerm_network_interface.passiveport1.id, azurerm_network_interface.passiveport2.id, azurerm_network_interface.passiveport3.id]
  primary_network_interface_id = azurerm_network_interface.passiveport1.id
  vm_size                      = var.size
  zones                        = [var.zone2]

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = var.custom ? element(azurerm_image.custom.*.id, 0) : null
  }

  storage_os_disk {
    name              = "passiveosDisk"
    caching           = "ReadWrite"
    managed_disk_type = "Standard_LRS"
    create_option     = "FromImage"
  }

  # Log data disks
  storage_data_disk {
    name              = "passivedatadisk"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "30"
  }

  os_profile {
    computer_name  = "custompassivefgt"
    admin_username = var.adminusername
    admin_password = var.adminpassword
    custom_data = templatefile("${var.bootstrap-passive}", {
      type            = var.license_type
      license_file    = var.license2
      port1_ip        = var.passiveport1
      port1_mask      = var.passiveport1mask
      port2_ip        = var.passiveport2
      port2_mask      = var.passiveport2mask
      port3_ip        = var.passiveport3
      port3_mask      = var.passiveport3mask
      active_peerip   = var.activeport1
      mgmt_gateway_ip = var.port1gateway
      defaultgwy      = var.port2gateway
      tenant          = var.tenant_id
      subscription    = var.subscription_id
      clientid        = var.client_id
      clientsecret    = var.client_secret
      adminsport      = var.adminsport
      rsg             = azurerm_resource_group.myterraformgroup.name
      clusterip       = azurerm_public_ip.ClusterPublicIP.name
      routename       = azurerm_route_table.internal.name
    })
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = azurerm_storage_account.fgtstorageaccount.primary_blob_endpoint
  }

  tags = {
    environment = "Terraform HA AP SDN FortiGates - Crosszone 3 Ports"
  }
}


resource "azurerm_virtual_machine" "passivefgtvm" {
  depends_on                   = [azurerm_virtual_machine.activefgtvm]
  count                        = var.custom ? 0 : 1
  name                         = "passivefgt"
  location                     = var.location
  resource_group_name          = azurerm_resource_group.myterraformgroup.name
  network_interface_ids        = [azurerm_network_interface.passiveport1.id, azurerm_network_interface.passiveport2.id, azurerm_network_interface.passiveport3.id]
  primary_network_interface_id = azurerm_network_interface.passiveport1.id
  vm_size                      = var.size
  zones                        = [var.zone2]

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.custom ? null : var.publisher
    offer     = var.custom ? null : var.fgtoffer
    sku       = var.license_type == "byol" ? var.fgtsku["byol"] : var.fgtsku["payg"]
    version   = var.custom ? null : var.fgtversion
    id        = var.custom ? element(azurerm_image.custom.*.id, 0) : null
  }

  plan {
    name      = var.license_type == "byol" ? var.fgtsku["byol"] : var.fgtsku["payg"]
    publisher = var.publisher
    product   = var.fgtoffer
  }

  storage_os_disk {
    name              = "passiveosDisk"
    caching           = "ReadWrite"
    managed_disk_type = "Standard_LRS"
    create_option     = "FromImage"
  }

  # Log data disks
  storage_data_disk {
    name              = "passivedatadisk"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "30"
  }

  os_profile {
    computer_name  = "passivefgt"
    admin_username = var.adminusername
    admin_password = var.adminpassword
    custom_data = templatefile("${var.bootstrap-passive}", {
      type            = var.license_type
      license_file    = var.license2
      port1_ip        = var.passiveport1
      port1_mask      = var.passiveport1mask
      port2_ip        = var.passiveport2
      port2_mask      = var.passiveport2mask
      port3_ip        = var.passiveport3
      port3_mask      = var.passiveport3mask
      active_peerip   = var.activeport1
      mgmt_gateway_ip = var.port1gateway
      defaultgwy      = var.port2gateway
      tenant          = var.tenant_id
      subscription    = var.subscription_id
      clientid        = var.client_id
      clientsecret    = var.client_secret
      adminsport      = var.adminsport
      rsg             = azurerm_resource_group.myterraformgroup.name
      clusterip       = azurerm_public_ip.ClusterPublicIP.name
      routename       = azurerm_route_table.internal.name
    })
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = azurerm_storage_account.fgtstorageaccount.primary_blob_endpoint
  }

  tags = {
    environment = "Terraform HA AP SDN FortiGates - Crosszone 3 Ports"
  }
}
