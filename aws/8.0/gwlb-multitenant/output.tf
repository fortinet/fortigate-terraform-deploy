output "FGTPublicIP" {
  value = aws_eip.FGTPublicIP.public_ip
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = aws_instance.fgtvm.id
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

output "VPCEndpoint1" {
  value = aws_vpc_endpoint.gwlbendpoint.id
}

output "VPCEndpoint2" {
  value = aws_vpc_endpoint.gwlbendpoint2.id
}

output "FGTVPC" {
  value = aws_vpc.fgtvm-vpc.id
}
