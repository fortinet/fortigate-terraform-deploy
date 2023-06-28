output "FGTPublicIP" {
  value = ibm_is_floating_ip.publicip.address
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = ibm_is_instance.fgt1.id
}
