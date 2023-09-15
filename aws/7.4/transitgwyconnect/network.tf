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

# FGT VPC Route
resource "aws_route" "externalroute" {
  route_table_id         = aws_route_table.fgtvmpublicrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.fgtvmigw.id
}

resource "aws_route" "internalroutegre" {
  depends_on             = [aws_instance.fgtvm]
  route_table_id         = aws_route_table.fgtvmprivatert.id
  destination_cidr_block = "1.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.terraform-tgwy.id
}

// FGT Route Association
resource "aws_route_table_association" "fgttgwyassociateaz1" {
  subnet_id      = aws_subnet.transitsubnetaz1.id
  route_table_id = aws_route_table.fgtvmtgwrt.id
}

resource "aws_route_table_association" "fgtpublicassociateaz1" {
  subnet_id      = aws_subnet.publicsubnetaz1.id
  route_table_id = aws_route_table.fgtvmpublicrt.id
}

resource "aws_route_table_association" "fgtpublicassociateaz2" {
  subnet_id      = aws_subnet.publicsubnetaz2.id
  route_table_id = aws_route_table.fgtvmpublicrt.id
}

resource "aws_route_table_association" "fgthasyncassociateaz1" {
  subnet_id      = aws_subnet.hasyncsubnetaz1.id
  route_table_id = aws_route_table.fgtvmpublicrt.id
}

resource "aws_route_table_association" "fgthasyncassociateaz2" {
  subnet_id      = aws_subnet.hasyncsubnetaz2.id
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
resource "aws_route_table" "csprivatert2" {
  vpc_id = aws_vpc.customer-vpc.id

  tags = {
    Name = "cs-egress-rt"
  }
}

//CS 2 VPC Route Table
resource "aws_route_table" "cs2privatert2" {
  vpc_id = aws_vpc.customer2-vpc.id

  tags = {
    Name = "cs2-egress-rt"
  }
}

# CS 1 VPC Route
resource "aws_route" "csexternalroute" {
  depends_on             = [aws_route_table.csprivatert2]
  route_table_id         = aws_route_table.csprivatert2.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = aws_ec2_transit_gateway.terraform-tgwy.id
}

# CS 2 VPC Route
resource "aws_route" "cs2externalroute" {
  depends_on             = [aws_route_table.cs2privatert2]
  route_table_id         = aws_route_table.cs2privatert2.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = aws_ec2_transit_gateway.terraform-tgwy.id
}

resource "aws_route_table_association" "csexternalassociateaz1" {
  subnet_id      = aws_subnet.csprivatesubnetaz1.id
  route_table_id = aws_route_table.csprivatert2.id
}

resource "aws_route_table_association" "cs2externalassociateaz1" {
  subnet_id      = aws_subnet.cs2privatesubnetaz1.id
  route_table_id = aws_route_table.cs2privatert2.id
}


resource "aws_eip" "FGTPublicIP" {
  depends_on        = [aws_instance.fgtvm]
  domain            = "vpc"
  network_interface = aws_network_interface.eth0.id
}

resource "aws_eip" "FGTPrimaryIP" {
  depends_on        = [aws_instance.fgtvm]
  domain            = "vpc"
  network_interface = aws_network_interface.eth2.id
}

resource "aws_eip" "FGTSecondaryIP" {
  depends_on        = [aws_instance.fgtvm2]
  domain            = "vpc"
  network_interface = aws_network_interface.eth2-2.id
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
    Name = "Public Allow All"
  }
}
