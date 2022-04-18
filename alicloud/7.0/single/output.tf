output "FGTPublicIP" {
  value = alicloud_instance.Fortigate.public_ip
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = alicloud_instance.Fortigate.id
}

