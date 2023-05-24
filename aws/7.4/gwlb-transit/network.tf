// Creating Internet Gateway
resource "aws_internet_gateway" "fgtvmigw" {
  vpc_id = aws_vpc.fgtvm-vpc.id
  tags = {
    Name = "fgtvm-igw"
  }
}

// CS1 IGW
resource "aws_internet_gateway" "csigw" {
  vpc_id = aws_vpc.customer-vpc.id
  tags = {
    Name = "cs-igw"
  }
}

// CS2 IGW
resource "aws_internet_gateway" "cs2igw" {
  vpc_id = aws_vpc.customer2-vpc.id
  tags = {
    Name = "cs2-igw"
  }
}

// FGT VPC Route Table
resource "aws_route_table" "fgtvmpublicrt" {
  vpc_id = aws_vpc.fgtvm-vpc.id

  tags = {
    Name = "fgtvm-public-rt"
  }
}

resource "aws_route_table" "fgtvmprivatert" {
  vpc_id = aws_vpc.fgtvm-vpc.id

  tags = {
    Name = "fgtvm-private-rt"
  }
}

resource "aws_route_table" "fgtvmtgwrt" {
  vpc_id = aws_vpc.fgtvm-vpc.id

  tags = {
    Name = "fgtvm-tgw-rt"
  }
}

resource "aws_route_table" "fgtvmgwlbrt" {
  vpc_id = aws_vpc.fgtvm-vpc.id

  tags = {
    Name = "fgtvm-gwlb-rt"
  }
}



# FGT VPC Route
resource "aws_route" "externalroute" {
  route_table_id         = aws_route_table.fgtvmpublicrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.fgtvmigw.id
}

resource "aws_route" "externalroutetovpc1" {
  depends_on             = [aws_vpc_endpoint.gwlbendpointfgt]
  route_table_id         = aws_route_table.fgtvmpublicrt.id
  destination_cidr_block = var.csvpccidr
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpointfgt.id
}

resource "aws_route" "externalroutetovpc2" {
  depends_on             = [aws_vpc_endpoint.gwlbendpointfgt]
  route_table_id         = aws_route_table.fgtvmpublicrt.id
  destination_cidr_block = var.cs2vpccidr
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpointfgt.id
}

// Comment this out for now
//resource "aws_route" "internalroute" {
//  depends_on             = [aws_instance.fgtvm]
//  route_table_id         = aws_route_table.fgtvmprivatert.id
//  destination_cidr_block = "0.0.0.0/0"
//  network_interface_id   = aws_network_interface.eth1.id
//}

resource "aws_route" "tgwyroute" {
  depends_on             = [aws_instance.fgtvm]
  route_table_id         = aws_route_table.fgtvmtgwrt.id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpointfgt.id
}

resource "aws_route" "gwlbroutecs" {
  depends_on             = [aws_instance.fgtvm]
  route_table_id         = aws_route_table.fgtvmgwlbrt.id
  destination_cidr_block = var.csvpccidr
  transit_gateway_id     = aws_ec2_transit_gateway.terraform-tgwy.id
}

resource "aws_route" "gwlbroutecs2" {
  depends_on             = [aws_instance.fgtvm]
  route_table_id         = aws_route_table.fgtvmgwlbrt.id
  destination_cidr_block = var.cs2vpccidr
  transit_gateway_id     = aws_ec2_transit_gateway.terraform-tgwy.id
}

// FGT Route Association
resource "aws_route_table_association" "fgttgwyassociateaz1" {
  subnet_id      = aws_subnet.transitsubnetaz1.id
  route_table_id = aws_route_table.fgtvmtgwrt.id
}

resource "aws_route_table_association" "fgttgwyassociateaz2" {
  subnet_id      = aws_subnet.transitsubnetaz2.id
  route_table_id = aws_route_table.fgtvmtgwrt.id
}

resource "aws_route_table_association" "fgtgwlbassociateaz1" {
  subnet_id      = aws_subnet.gwlbsubnetaz1.id
  route_table_id = aws_route_table.fgtvmgwlbrt.id
}

resource "aws_route_table_association" "fgtgwlbassociateaz2" {
  subnet_id      = aws_subnet.gwlbsubnetaz2.id
  route_table_id = aws_route_table.fgtvmgwlbrt.id
}

resource "aws_route_table_association" "fgtpublicassociateaz1" {
  subnet_id      = aws_subnet.publicsubnetaz1.id
  route_table_id = aws_route_table.fgtvmpublicrt.id
}

resource "aws_route_table_association" "fgtpublicassociateaz2" {
  subnet_id      = aws_subnet.publicsubnetaz2.id
  route_table_id = aws_route_table.fgtvmpublicrt.id
}

resource "aws_route_table_association" "fgtprivateassociateaz1" {
  subnet_id      = aws_subnet.privatesubnetaz1.id
  route_table_id = aws_route_table.fgtvmprivatert.id
}

resource "aws_route_table_association" "fgtprivateassociateaz2" {
  subnet_id      = aws_subnet.privatesubnetaz2.id
  route_table_id = aws_route_table.fgtvmprivatert.id
}



//CS 1 VPC Route Table
resource "aws_route_table" "cspublicrt" {
  vpc_id = aws_vpc.customer-vpc.id

  tags = {
    Name = "cs-public-edge-rt"
  }
}

resource "aws_route_table" "cspublicrt2" {
  vpc_id = aws_vpc.customer-vpc.id

  tags = {
    Name = "cs-public-egress-rt"
  }
}

resource "aws_route_table" "csprivatert" {
  depends_on = [aws_vpc_endpoint.gwlbendpoint]
  vpc_id     = aws_vpc.customer-vpc.id

  tags = {
    Name = "cs-private-rt"
  }
}

//CS 2 VPC Route Table
resource "aws_route_table" "cs2publicrt" {
  vpc_id = aws_vpc.customer2-vpc.id

  tags = {
    Name = "cs2-public-edge-rt"
  }
}

resource "aws_route_table" "cs2publicrt2" {
  vpc_id = aws_vpc.customer2-vpc.id

  tags = {
    Name = "cs2-public-egress-rt"
  }
}

resource "aws_route_table" "cs2privatert" {
  depends_on = [aws_vpc_endpoint.gwlbendpoint]
  vpc_id     = aws_vpc.customer2-vpc.id

  tags = {
    Name = "cs2-private-rt"
  }
}

# CS 1 VPC Route
resource "aws_route" "cspublicrouteaz1" {
  depends_on             = [aws_route_table.cspublicrt]
  route_table_id         = aws_route_table.cspublicrt.id
  destination_cidr_block = var.csprivatecidraz1
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpoint.id
}

resource "aws_route" "cspublicrouteaz2" {
  depends_on             = [aws_route_table.cspublicrt]
  route_table_id         = aws_route_table.cspublicrt.id
  destination_cidr_block = var.csprivatecidraz2
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpoint.id
}

resource "aws_route" "csinternalroute" {
  depends_on             = [aws_route_table.csprivatert]
  route_table_id         = aws_route_table.csprivatert.id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpoint.id
}

resource "aws_route" "csinternalroutetgwy" {
  depends_on             = [aws_route_table.csprivatert]
  route_table_id         = aws_route_table.csprivatert.id
  destination_cidr_block = var.cs2vpccidr
  transit_gateway_id     = aws_ec2_transit_gateway.terraform-tgwy.id
}

resource "aws_route" "csexternalroute" {
  depends_on             = [aws_route_table.cspublicrt2]
  route_table_id         = aws_route_table.cspublicrt2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.csigw.id
}

# CS 2 VPC Route
resource "aws_route" "cs2publicrouteaz1" {
  depends_on             = [aws_route_table.cs2publicrt]
  route_table_id         = aws_route_table.cs2publicrt.id
  destination_cidr_block = var.cs2privatecidraz1
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpoint2.id
}

resource "aws_route" "cs2publicrouteaz2" {
  depends_on             = [aws_route_table.cs2publicrt]
  route_table_id         = aws_route_table.cs2publicrt.id
  destination_cidr_block = var.cs2privatecidraz2
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpoint2.id
}

resource "aws_route" "cs2internalroute" {
  depends_on             = [aws_route_table.cs2privatert]
  route_table_id         = aws_route_table.cs2privatert.id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.gwlbendpoint2.id
}

resource "aws_route" "cs2internalroutetgwy" {
  depends_on             = [aws_route_table.cs2privatert]
  route_table_id         = aws_route_table.cs2privatert.id
  destination_cidr_block = var.csvpccidr
  transit_gateway_id     = aws_ec2_transit_gateway.terraform-tgwy.id
}

resource "aws_route" "cs2externalroute" {
  depends_on             = [aws_route_table.cs2publicrt2]
  route_table_id         = aws_route_table.cs2publicrt2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.cs2igw.id
}

# CS 1 Route association
resource "aws_route_table_association" "cspublicassociate" {
  route_table_id = aws_route_table.cspublicrt.id
  gateway_id     = aws_internet_gateway.csigw.id
}

resource "aws_route_table_association" "csinternalassociateaz1" {
  subnet_id      = aws_subnet.csprivatesubnetaz1.id
  route_table_id = aws_route_table.csprivatert.id
}

resource "aws_route_table_association" "csinternalassociateaz2" {
  subnet_id      = aws_subnet.csprivatesubnetaz2.id
  route_table_id = aws_route_table.csprivatert.id
}

resource "aws_route_table_association" "csexternalassociateaz1" {
  subnet_id      = aws_subnet.cspublicsubnetaz1.id
  route_table_id = aws_route_table.cspublicrt2.id
}

resource "aws_route_table_association" "csexternalassociateaz2" {
  subnet_id      = aws_subnet.cspublicsubnetaz2.id
  route_table_id = aws_route_table.cspublicrt2.id
}

# CS 2 Route association
resource "aws_route_table_association" "cs2publicassociate" {
  route_table_id = aws_route_table.cs2publicrt.id
  gateway_id     = aws_internet_gateway.cs2igw.id
}

resource "aws_route_table_association" "cs2internalassociateaz1" {
  subnet_id      = aws_subnet.cs2privatesubnetaz1.id
  route_table_id = aws_route_table.cs2privatert.id
}

resource "aws_route_table_association" "cs2internalassociateaz2" {
  subnet_id      = aws_subnet.cs2privatesubnetaz2.id
  route_table_id = aws_route_table.cs2privatert.id
}

resource "aws_route_table_association" "cs2externalassociateaz1" {
  subnet_id      = aws_subnet.cs2publicsubnetaz1.id
  route_table_id = aws_route_table.cs2publicrt2.id
}

resource "aws_route_table_association" "cs2externalassociateaz2" {
  subnet_id      = aws_subnet.cs2publicsubnetaz2.id
  route_table_id = aws_route_table.cs2publicrt2.id
}


resource "aws_eip" "FGTPublicIP" {
  depends_on        = [aws_instance.fgtvm]
  vpc               = true
  network_interface = aws_network_interface.eth0.id
}

resource "aws_eip" "FGT2PublicIP" {
  depends_on        = [aws_instance.fgtvm2]
  vpc               = true
  network_interface = aws_network_interface.fgt2eth0.id
}


# CS 2 Route association


// Security Group

resource "aws_security_group" "public_allow" {
  name        = "Public Allow"
  description = "Public Allow traffic"
  vpc_id      = aws_vpc.fgtvm-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Allow"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "Allow All"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.fgtvm-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Allow"
  }
}

//  Gateway Load Balancer on FGT VPC to single FGT
resource "aws_lb" "gateway_lb" {
  name                             = "gatewaylb"
  load_balancer_type               = "gateway"
  enable_cross_zone_load_balancing = true

  // AZ1
  subnet_mapping {
    subnet_id = aws_subnet.privatesubnetaz1.id
  }

  // AZ2
  subnet_mapping {
    subnet_id = aws_subnet.privatesubnetaz2.id
  }
}

resource "aws_lb_target_group" "fgt_target" {
  name        = "fgttarget"
  port        = 6081
  protocol    = "GENEVE"
  target_type = "ip"
  vpc_id      = aws_vpc.fgtvm-vpc.id

  health_check {
    port     = 8008
    protocol = "TCP"
  }
}

resource "aws_lb_listener" "fgt_listener" {
  load_balancer_arn = aws_lb.gateway_lb.id

  default_action {
    target_group_arn = aws_lb_target_group.fgt_target.id
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "fgtattach" {
  depends_on       = [aws_instance.fgtvm]
  target_group_arn = aws_lb_target_group.fgt_target.arn
  target_id        = data.aws_network_interface.eth1.private_ip
  port             = 6081
}

resource "aws_lb_target_group_attachment" "fgt2attach" {
  depends_on       = [aws_instance.fgtvm2]
  target_group_arn = aws_lb_target_group.fgt_target.arn
  target_id        = data.aws_network_interface.fgt2eth1.private_ip
  port             = 6081
}


resource "aws_vpc_endpoint_service" "fgtgwlbservice" {
  acceptance_required        = false
  gateway_load_balancer_arns = [aws_lb.gateway_lb.arn]
}

# FGT Endpoint
resource "aws_vpc_endpoint" "gwlbendpointfgt" {
  service_name      = aws_vpc_endpoint_service.fgtgwlbservice.service_name
  subnet_ids        = [aws_subnet.gwlbsubnetaz1.id]
  vpc_endpoint_type = aws_vpc_endpoint_service.fgtgwlbservice.service_type
  vpc_id            = aws_vpc.fgtvm-vpc.id
}

# CS 1 Endpoint
resource "aws_vpc_endpoint" "gwlbendpoint" {
  service_name      = aws_vpc_endpoint_service.fgtgwlbservice.service_name
  subnet_ids        = [aws_subnet.cspublicsubnetaz1.id]
  vpc_endpoint_type = aws_vpc_endpoint_service.fgtgwlbservice.service_type
  vpc_id            = aws_vpc.customer-vpc.id
}

# CS 2 Endpoint
resource "aws_vpc_endpoint" "gwlbendpoint2" {
  service_name      = aws_vpc_endpoint_service.fgtgwlbservice.service_name
  subnet_ids        = [aws_subnet.cs2publicsubnetaz1.id]
  vpc_endpoint_type = aws_vpc_endpoint_service.fgtgwlbservice.service_type
  vpc_id            = aws_vpc.customer2-vpc.id
}
