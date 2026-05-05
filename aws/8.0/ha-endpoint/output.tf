
output "FGTClusterPublicFQDN" {
  value = join("", tolist(["https://", "${aws_eip.ClusterPublicIP.public_dns}", ":", "${var.adminsport}"]))
}

output "FGTClusterPublicIP" {
  value = aws_eip.ClusterPublicIP.public_ip
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = aws_instance.fgtactive.id
}

