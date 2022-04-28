
output "FGT1PublicIP" {
  value = aws_eip.FGTPublicIP.public_ip
}


output "FGT2PublicIP" {
  value = aws_eip.FGTPublicIP2.public_ip
}


output "Username" {
  value = "admin"
}

output "Password_for_FGT1" {
  value = aws_instance.fgtvm.id
}

output "Password_for_FGT2" {
  value = aws_instance.fgtvm2.id
}

output "LoadBalancerPrivateIP" {
  value = data.aws_network_interface.vpcendpointip.private_ip
}

output "CustomerVPC" {
  value = aws_vpc.customer-vpc.id
}

output "FGTVPC" {
  value = aws_vpc.fgtvm-vpc.id
}
