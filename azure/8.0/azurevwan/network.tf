resource "azurerm_virtual_network" "vnet" {
  name                = var.networkname
  location            = azurerm_resource_group.vwan-rg.location
  resource_group_name = azurerm_resource_group.vwan-rg.name
  address_space       = [var.networkprefix]
}

resource "azurerm_subnet" "gatewaysub" {
  name                 = var.subnet1name
  resource_group_name  = azurerm_resource_group.vwan-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet1prefix]
}

resource "azurerm_subnet" "applicationsub" {
  name                 = var.subnet2name
  resource_group_name  = azurerm_resource_group.vwan-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet2prefix]
}

