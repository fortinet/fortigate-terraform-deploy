output "azurerm_vpn_gateway_id" {
  value = data.azurerm_vpn_gateway.gatewayresult.id
}

output "azurerm_vpn_tunnel_public_ip" {
  value = data.azurerm_vpn_gateway.gatewayresult.bgp_settings[0].instance_0_bgp_peering_address[0].tunnel_ips[0]
}


output "azurerm_vpn_tunnel_private_ip" {
  value = data.azurerm_vpn_gateway.gatewayresult.bgp_settings[0].instance_0_bgp_peering_address[0].default_ips[0]
}

output "azurerm_vpn_tunnel2_public_ip" {
  value = data.azurerm_vpn_gateway.gatewayresult.bgp_settings[0].instance_1_bgp_peering_address[0].tunnel_ips[0]
}

output "azurerm_vpn_tunnel2_private_ip" {
  value = data.azurerm_vpn_gateway.gatewayresult.bgp_settings[0].instance_1_bgp_peering_address[0].default_ips[0]
}

