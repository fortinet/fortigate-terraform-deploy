resource "azurerm_vpn_site" "site" {
  name                = var.vpnname
  resource_group_name = azurerm_resource_group.vwan-rg.name
  location            = azurerm_resource_group.vwan-rg.location
  virtual_wan_id      = azurerm_virtual_wan.vwan.id

  address_cidrs = [var.vpncidr]
  device_model  = "FGTVM"
  device_vendor = "Fortinet"

  link {
    name       = "link1"
    ip_address = var.publicip
    bgp {
      asn             = var.bgpasn
      peering_address = var.bgppeerip
    }
    provider_name = "Fortinet"
    speed_in_mbps = "10"
  }
}

resource "azurerm_vpn_gateway_connection" "connection" {
  name               = var.connectionname
  vpn_gateway_id     = azurerm_vpn_gateway.gateway.id
  remote_vpn_site_id = azurerm_vpn_site.site.id

  vpn_link {
    name             = var.linkname
    vpn_site_link_id = azurerm_vpn_site.site.link[0].id
    bgp_enabled      = true
    shared_key       = var.presharekey
  }
}
