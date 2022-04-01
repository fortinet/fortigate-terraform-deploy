//  Cluster Public IP
//output "ClusterPublicIP" {
//  value = "${oci_core_public_ip.public_public_ip.ip_address}"
//}
//  Default Username and Password
output "Default_Username" {
  value = "admin"
}

output "Default_Password" {
  value = oci_core_instance.activevm.id
}

// Active Unit Mgmt IP
output "FGTActiveMGMTPublicIP" {
  value = oci_core_instance.activevm.*.public_ip
}

// Passive Unit Mgmt IP

output "FGTPassiveMGMTPublicIP" {
  value = oci_core_instance.passivevm.*.public_ip
}
