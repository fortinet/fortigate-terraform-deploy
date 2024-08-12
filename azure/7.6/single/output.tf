output "ResourceGroup" {
  value = azurerm_resource_group.myterraformgroup.name
}

output "FGTPublicIP" {
  value = format("https://%s", azurerm_public_ip.FGTPublicIp.ip_address)
}

output "Username" {
  value = var.adminusername
}

output "Password" {
  value = var.adminpassword
}

