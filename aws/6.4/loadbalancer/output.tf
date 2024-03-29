output "FGTActivePublicIP" {
  value = aws_eip.ActivePublicIP.public_ip
}

output "FGTLBPublicFQDN" {
  value = join("", list("https://", "${aws_eip.LBPublicIP.public_dns}", ":", "${var.adminsport}"))
}

output "FGTLBPublicIP" {
  value = aws_eip.LBPublicIP.public_ip
}

output "FGTPassivePublicIP" {
  value = aws_eip.PassivePublicIP.public_ip
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = aws_instance.fgtactive.id
}




