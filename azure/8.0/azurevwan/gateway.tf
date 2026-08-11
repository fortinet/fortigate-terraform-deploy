resource "azurerm_vpn_gateway" "gateway" {
  name                = var.gatewayname
  location            = azurerm_resource_group.vwan-rg.location
  resource_group_name = azurerm_resource_group.vwan-rg.name
  virtual_hub_id      = azurerm_virtual_hub.hub.id

  bgp_settings {
    asn         = var.bgpremoteasn
    peer_weight = 0
  }
}

data "azurerm_vpn_gateway" "gatewayresult" {
  depends_on          = [azurerm_vpn_gateway_connection.connection]
  name                = var.gatewayname
  resource_group_name = azurerm_resource_group.vwan-rg.name
}


