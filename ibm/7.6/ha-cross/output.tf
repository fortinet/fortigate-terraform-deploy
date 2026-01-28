output "FGTPublicIP" {
  value = split("/", ibm_is_public_address_range.par-fgtha.cidr)[0]
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = ibm_is_instance.fgt1.id
}
