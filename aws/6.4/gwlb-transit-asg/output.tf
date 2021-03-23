output "Username" {
  value = "admin"
}

output "LoadBalancerPrivateIP" {
  value = data.aws_network_interface.vpcendpointip.private_ip
}

output "CustomerVPC" {
  value = aws_vpc.customer-vpc.id
}

output "Customer2VPC" {
  value = aws_vpc.customer2-vpc.id
}

output "FGTVPC" {
  value = aws_vpc.fgtvm-vpc.id
}
