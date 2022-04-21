output "ClusterPublicIP" {
  value = alicloud_eip_address.pipcluster.ip_address
}

output "ActiveMgmtPIP" {
  value = alicloud_eip_address.pipmgmtactive.ip_address
}

output "PassiveMgmtPIP" {
  value = alicloud_eip_address.pipmgmtpassive.ip_address
}


output "Username" {
  value = "admin"
}

output "Password" {
  value = alicloud_instance.Fortigate.id
}

