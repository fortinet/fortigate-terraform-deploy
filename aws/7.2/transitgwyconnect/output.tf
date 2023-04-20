
output "FGTPublicIP" {
  value = aws_eip.FGTPublicIP.public_ip
}

output "Username" {
  value = "admin"
}

output "FGT-Password" {
  value = aws_instance.fgtvm.id
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

output "TransitGwy" {
  value = aws_ec2_transit_gateway.terraform-tgwy.id
}
