resource "azurerm_virtual_hub" "hub" {
  name                = "${var.hubname}-${var.location}"
  resource_group_name = azurerm_virtual_wan.vwan.resource_group_name
  location            = var.location
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
  address_prefix      = var.hubprefix
}

resource "azurerm_virtual_hub_connection" "example" {
  depends_on                = [azurerm_virtual_hub.hub]
  name                      = "vnet-hub-connection"
  virtual_hub_id            = azurerm_virtual_hub.hub.id
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
}
