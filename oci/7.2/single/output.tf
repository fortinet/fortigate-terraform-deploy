//  Output
output "Default_Username" {
  value = "admin"
}

output "Default_Password" {
  value = oci_core_instance.vm.*.id
}

output "PublicIP" {
  value = oci_core_instance.vm.*.public_ip
}


