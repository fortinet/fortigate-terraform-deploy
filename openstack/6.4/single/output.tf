//  Default Username and Password
output "Default_Username" {
  value = "admin"
}

output "Default_Password" {
  value = ""
}

// Instance access IPv4 address
output "IP_Address" {
  value = {
    for instance in openstack_compute_instance_v2.fgt :
    instance.name => instance.access_ip_v4
  }
}
