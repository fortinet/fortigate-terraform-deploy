resource "azurerm_resource_group" "vwan-rg" {
  name     = var.resourcename
  location = var.location
}

resource "azurerm_virtual_wan" "vwan" {
  name                = var.vwanname
  resource_group_name = azurerm_resource_group.vwan-rg.name
  location            = azurerm_resource_group.vwan-rg.location
}

