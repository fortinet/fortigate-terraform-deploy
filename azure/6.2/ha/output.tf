output "ResourceGroup" {
  value = azurerm_resource_group.myterraformgroup.name
}

output "ClusterPublicIP" {
  value = azurerm_public_ip.ClusterPublicIP.ip_address
}

output "ActiveMGMTPublicIP" {
  value = azurerm_public_ip.ActiveMGMTIP.ip_address
}


output "PassiveMGMTPublicIP" {
  value = azurerm_public_ip.PassiveMGMTIP.ip_address
}

output "Username" {
  value = var.adminusername
}

output "Password" {
  value = var.adminpassword
}

