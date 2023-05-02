########################################################
# Transit Gateway
########################################################
resource "aws_ec2_transit_gateway" "terraform-tgwy" {
  description                     = "Transit Gateway with 3 VPCs"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  amazon_side_asn                 = "64512"
  transit_gateway_cidr_blocks     = ["1.0.0.0/24"]
  tags = {
    Name = "terraform-tgwy"
  }
}

# Route Table - Customer VPC
resource "aws_ec2_transit_gateway_route_table" "tgwy-vpc-route" {
  depends_on         = [aws_ec2_transit_gateway.terraform-tgwy]
  transit_gateway_id = aws_ec2_transit_gateway.terraform-tgwy.id
  tags = {
    Name = "tgwy-customer-vpc-route"
  }
}

# VPC attachment - FGT VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-vpc-fgt" {
  appliance_mode_support                          = "enable"
  subnet_ids                                      = [aws_subnet.transitsubnetaz1.id, aws_subnet.transitsubnetaz2.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.terraform-tgwy.id
  vpc_id                                          = aws_vpc.fgtvm-vpc.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name = "tgwy-fgt-attachment"
  }
  depends_on = [aws_ec2_transit_gateway.terraform-tgwy]
}

# VPC attachment - CS VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-vpc-vpc1" {
  appliance_mode_support                          = "enable"
  subnet_ids                                      = [aws_subnet.csprivatesubnetaz1.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.terraform-tgwy.id
  vpc_id                                          = aws_vpc.customer-vpc.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name = "tgwy-vpc1-attachment"
  }
  depends_on = [aws_ec2_transit_gateway.terraform-tgwy]
}

# VPC attachment - CS2 VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-vpc-vpc2" {
  appliance_mode_support                          = "enable"
  subnet_ids                                      = [aws_subnet.cs2privatesubnetaz1.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.terraform-tgwy.id
  vpc_id                                          = aws_vpc.customer2-vpc.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name = "tgwy-vpc2-attachment"
  }
  depends_on = [aws_ec2_transit_gateway.terraform-tgwy]
}

# Transit Gateway connect attachment
resource "aws_ec2_transit_gateway_connect" "attachment" {
  transport_attachment_id                         = aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc-fgt.id
  transit_gateway_id                              = aws_ec2_transit_gateway.terraform-tgwy.id
  transit_gateway_default_route_table_propagation = false
}

# transit gateway connect peer
resource "aws_ec2_transit_gateway_connect_peer" "example" {
  peer_address = var.fgtport2ip[0]
  #peer_address                  = "10.0.0.21"
  bgp_asn                       = "7115"
  transit_gateway_address       = "1.0.0.68"
  inside_cidr_blocks            = ["169.254.120.0/29"]
  transit_gateway_attachment_id = aws_ec2_transit_gateway_connect.attachment.id
}

# transit gateway connect peer to secondary
resource "aws_ec2_transit_gateway_connect_peer" "example2" {
  peer_address                  = var.fgt2port2ip[0]
  bgp_asn                       = "7116"
  transit_gateway_address       = "1.0.0.69"
  inside_cidr_blocks            = ["169.254.102.0/29"]
  transit_gateway_attachment_id = aws_ec2_transit_gateway_connect.attachment.id
}

# Route Tables Associations - Customer VPC
resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-vpc-customer-assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc-vpc1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwy-vpc-route.id
}

# Route Tables Associations - Customer 2 VPC
resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-vpc-customer2-assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc-vpc2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwy-vpc-route.id
}

# Route Tables Associations - Connect
resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-vpc-connect-assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc-fgt.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.terraform-tgwy.association_default_route_table_id
  #transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwy-fgt-route.id
}

# Route Tables Propagations - FGT VPC Route
# FGT VPC route propagation on default route table
resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-prop-fgt" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc-fgt.id
  #transit_gateway_route_table_id = aws_ec2_transit_gateway.terraform-tgwy.association_default_route_table_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwy-vpc-route.id
}

# Route Tables Propagations - Connect Route
# Connect route propagation on default route table
resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-prop-connect" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_connect.attachment.id
  #transit_gateway_route_table_id = aws_ec2_transit_gateway.terraform-tgwy.association_default_route_table_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwy-vpc-route.id
}

# Route Tables Propagations - Customer VPC Route
resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-prop-fgt-w-cs" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc-vpc1.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.terraform-tgwy.association_default_route_table_id
  #transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwy-fgt-route.id
}

# Route Tables Propagations -Customer VPC2 Route
resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-prop-fgt-w-cs2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc-vpc2.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.terraform-tgwy.association_default_route_table_id
  #transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwy-fgt-route.id
}
