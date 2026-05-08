##############################################################################################################
# VPC SECURITY
##############################################################################################################
resource "aws_vpc" "vpc_sec" {
  cidr_block           = var.security_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.tag_name_prefix}-vpc_sec"
  }
}

# IGW
resource "aws_internet_gateway" "igw_sec" {
  vpc_id = aws_vpc.vpc_sec.id
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-igw_sec"
  }
}

# Subnets
resource "aws_subnet" "data_subnet1" {
  vpc_id            = aws_vpc.vpc_sec.id
  cidr_block        = var.security_vpc_data_subnet_cidr1
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-data-subnet1"
  }
}

resource "aws_subnet" "data_subnet2" {
  vpc_id            = aws_vpc.vpc_sec.id
  cidr_block        = var.security_vpc_data_subnet_cidr2
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-data-subnet2"
  }
}

resource "aws_subnet" "relay_subnet1" {
  vpc_id            = aws_vpc.vpc_sec.id
  cidr_block        = var.security_vpc_relay_subnet_cidr1
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-relay-subnet1"
  }
}

resource "aws_subnet" "relay_subnet2" {
  vpc_id            = aws_vpc.vpc_sec.id
  cidr_block        = var.security_vpc_relay_subnet_cidr2
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-relay-subnet2"
  }
}

resource "aws_subnet" "heartbeat_subnet1" {
  vpc_id            = aws_vpc.vpc_sec.id
  cidr_block        = var.security_vpc_heartbeat_subnet_cidr1
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-heartbeat-subnet1"
  }
}

resource "aws_subnet" "heartbeat_subnet2" {
  vpc_id            = aws_vpc.vpc_sec.id
  cidr_block        = var.security_vpc_heartbeat_subnet_cidr2
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-heartbeat-subnet2"
  }
}

resource "aws_subnet" "mgmt_subnet1" {
  vpc_id            = aws_vpc.vpc_sec.id
  cidr_block        = var.security_vpc_mgmt_subnet_cidr1
  availability_zone = var.availability_zone1
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-mgmt-subnet1"
  }
}

resource "aws_subnet" "mgmt_subnet2" {
  vpc_id            = aws_vpc.vpc_sec.id
  cidr_block        = var.security_vpc_mgmt_subnet_cidr2
  availability_zone = var.availability_zone2
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-mgmt-subnet2"
  }
}

# Routes
resource "aws_route_table" "data_rt" {
  vpc_id = aws_vpc.vpc_sec.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_sec.id
  }
  route {
    cidr_block         = var.spoke_vpc1_cidr
    transit_gateway_id = aws_ec2_transit_gateway.TGW-XAZ.id
  }
  route {
    cidr_block         = var.spoke_vpc2_cidr
    transit_gateway_id = aws_ec2_transit_gateway.TGW-XAZ.id
  }
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-data-and-mgmt-rt"
  }
}

resource "aws_route_table" "relay_rt" {
  vpc_id = aws_vpc.vpc_sec.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.eni-fgt1-data.id
  }
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-relay-rt"
  }
}

resource "aws_route_table" "heartbeat_rt" {
  vpc_id = aws_vpc.vpc_sec.id
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-heartbeat-rt"
  }
}

# Route tables associations
resource "aws_route_table_association" "data_rt_association1" {
  subnet_id      = aws_subnet.data_subnet1.id
  route_table_id = aws_route_table.data_rt.id
}

resource "aws_route_table_association" "data_rt_association2" {
  subnet_id      = aws_subnet.data_subnet2.id
  route_table_id = aws_route_table.data_rt.id
}

resource "aws_route_table_association" "relay_rt_association1" {
  subnet_id      = aws_subnet.relay_subnet1.id
  route_table_id = aws_route_table.relay_rt.id
}

resource "aws_route_table_association" "relay_rt_association2" {
  subnet_id      = aws_subnet.relay_subnet2.id
  route_table_id = aws_route_table.relay_rt.id
}

resource "aws_route_table_association" "mgmt_rt_association1" {
  subnet_id      = aws_subnet.mgmt_subnet1.id
  route_table_id = aws_route_table.data_rt.id
}

resource "aws_route_table_association" "mgmt_rt_association2" {
  subnet_id      = aws_subnet.mgmt_subnet2.id
  route_table_id = aws_route_table.data_rt.id
}

# Attachment to TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-vpc-sec" {
  subnet_ids                                      = [aws_subnet.relay_subnet1.id, aws_subnet.relay_subnet2.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.TGW-XAZ.id
  vpc_id                                          = aws_vpc.vpc_sec.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name     = "tgw-att-vpc_sec"
    scenario = var.scenario
  }
  depends_on = [aws_ec2_transit_gateway.TGW-XAZ]
}

#############################################################################################################
# VPC SPOKE1
#############################################################################################################
resource "aws_vpc" "spoke_vpc1" {
  cidr_block = var.spoke_vpc1_cidr

  tags = {
    Name     = "${var.tag_name_prefix}-vpc-spoke1"
    scenario = var.scenario
  }
}

# Subnets
resource "aws_subnet" "spoke_vpc1-priv1" {
  vpc_id            = aws_vpc.spoke_vpc1.id
  cidr_block        = var.spoke_vpc1_private_subnet_cidr1
  availability_zone = var.availability_zone1

  tags = {
    Name = "${aws_vpc.spoke_vpc1.tags.Name}-priv1"
  }
}

resource "aws_subnet" "spoke_vpc1-priv2" {
  vpc_id            = aws_vpc.spoke_vpc1.id
  cidr_block        = var.spoke_vpc1_private_subnet_cidr2
  availability_zone = var.availability_zone2

  tags = {
    Name = "${aws_vpc.spoke_vpc1.tags.Name}-priv2"
  }
}

# Routes
resource "aws_route_table" "spoke1-rt" {
  vpc_id = aws_vpc.spoke_vpc1.id

  route {
    cidr_block         = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.TGW-XAZ.id
  }

  tags = {
    Name     = "spoke-vpc1-rt"
    scenario = var.scenario
  }
  depends_on = [aws_ec2_transit_gateway.TGW-XAZ]
}

# Route tables associations
resource "aws_route_table_association" "spoke1_rt_association1" {
  subnet_id      = aws_subnet.spoke_vpc1-priv1.id
  route_table_id = aws_route_table.spoke1-rt.id
}

resource "aws_route_table_association" "spoke1_rt_association2" {
  subnet_id      = aws_subnet.spoke_vpc1-priv2.id
  route_table_id = aws_route_table.spoke1-rt.id
}

# Attachment to TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-spoke-vpc1" {
  subnet_ids                                      = [aws_subnet.spoke_vpc1-priv1.id, aws_subnet.spoke_vpc1-priv2.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.TGW-XAZ.id
  vpc_id                                          = aws_vpc.spoke_vpc1.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name     = "tgw-att-spoke-vpc1"
    scenario = var.scenario
  }
  depends_on = [aws_ec2_transit_gateway.TGW-XAZ]
}

#############################################################################################################
# VPC SPOKE2
#############################################################################################################
resource "aws_vpc" "spoke_vpc2" {
  cidr_block = var.spoke_vpc2_cidr

  tags = {
    Name     = "${var.tag_name_prefix}-vpc-spoke2"
    scenario = var.scenario
  }
}

# Subnets
resource "aws_subnet" "spoke_vpc2-priv1" {
  vpc_id            = aws_vpc.spoke_vpc2.id
  cidr_block        = var.spoke_vpc2_private_subnet_cidr1
  availability_zone = var.availability_zone1

  tags = {
    Name = "${aws_vpc.spoke_vpc2.tags.Name}-priv1"
  }
}

resource "aws_subnet" "spoke_vpc2-priv2" {
  vpc_id            = aws_vpc.spoke_vpc2.id
  cidr_block        = var.spoke_vpc2_private_subnet_cidr2
  availability_zone = var.availability_zone2

  tags = {
    Name = "${aws_vpc.spoke_vpc2.tags.Name}-priv2"
  }
}

# Routes
resource "aws_route_table" "spoke2-rt" {
  vpc_id = aws_vpc.spoke_vpc2.id

  route {
    cidr_block         = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.TGW-XAZ.id
  }

  tags = {
    Name     = "spoke-vpc2-rt"
    scenario = var.scenario
  }
  depends_on = [aws_ec2_transit_gateway.TGW-XAZ]
}

# Route tables associations
resource "aws_route_table_association" "spoke2_rt_association1" {
  subnet_id      = aws_subnet.spoke_vpc2-priv1.id
  route_table_id = aws_route_table.spoke2-rt.id
}

resource "aws_route_table_association" "spoke2_rt_association2" {
  subnet_id      = aws_subnet.spoke_vpc2-priv2.id
  route_table_id = aws_route_table.spoke2-rt.id
}

# Attachment to TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-spoke-vpc2" {
  subnet_ids                                      = [aws_subnet.spoke_vpc2-priv1.id, aws_subnet.spoke_vpc2-priv2.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.TGW-XAZ.id
  vpc_id                                          = aws_vpc.spoke_vpc2.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name     = "tgw-att-spoke-vpc2"
    scenario = var.scenario
  }
  depends_on = [aws_ec2_transit_gateway.TGW-XAZ]
}

#############################################################################################################
# VPC MGMT
#############################################################################################################
resource "aws_vpc" "spoke_mgmt" {
  cidr_block = var.mgmt_cidr

  tags = {
    Name     = "${var.tag_name_prefix}-vpc-mgmt"
    scenario = var.scenario
  }
}

# IGW
resource "aws_internet_gateway" "igw_mgmt" {
  vpc_id = aws_vpc.spoke_mgmt.id
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-igw_mgmt"
  }
}

# Subnets
resource "aws_subnet" "spoke_mgmt-priv1" {
  vpc_id            = aws_vpc.spoke_mgmt.id
  cidr_block        = var.mgmt_private_subnet_cidr1
  availability_zone = var.availability_zone1

  tags = {
    Name = "${aws_vpc.spoke_mgmt.tags.Name}-priv1"
  }
}

resource "aws_subnet" "spoke_mgmt-priv2" {
  vpc_id            = aws_vpc.spoke_mgmt.id
  cidr_block        = var.mgmt_private_subnet_cidr2
  availability_zone = var.availability_zone2

  tags = {
    Name = "${aws_vpc.spoke_mgmt.tags.Name}-priv2"
  }
}

# Routes
resource "aws_route_table" "mgmt-rt" {
  vpc_id = aws_vpc.spoke_mgmt.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_mgmt.id
  }
  route {
    cidr_block         = var.spoke_vpc1_cidr
    transit_gateway_id = aws_ec2_transit_gateway.TGW-XAZ.id
  }
  route {
    cidr_block         = var.spoke_vpc2_cidr
    transit_gateway_id = aws_ec2_transit_gateway.TGW-XAZ.id
  }

  tags = {
    Name     = "mgmt-rt"
    scenario = var.scenario
  }
  depends_on = [aws_ec2_transit_gateway.TGW-XAZ]
}

# Route tables associations
resource "aws_route_table_association" "mgmtvpc_rt_association1" {
  subnet_id      = aws_subnet.spoke_mgmt-priv1.id
  route_table_id = aws_route_table.mgmt-rt.id
}

resource "aws_route_table_association" "mgmtvpc_rt_association2" {
  subnet_id      = aws_subnet.spoke_mgmt-priv2.id
  route_table_id = aws_route_table.mgmt-rt.id
}

# Attachment to TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-mgmt" {
  subnet_ids                                      = [aws_subnet.spoke_mgmt-priv1.id, aws_subnet.spoke_mgmt-priv2.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.TGW-XAZ.id
  vpc_id                                          = aws_vpc.spoke_mgmt.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name     = "tgw-att-spoke-mgmt"
    scenario = var.scenario
  }
  depends_on = [aws_ec2_transit_gateway.TGW-XAZ]
}

# S3 endpoint inside the VPC
resource "aws_vpc_endpoint" "s3-endpoint-fgtvm-vpc" {
  count           = var.bucket ? 1 : 0
  vpc_id          = aws_vpc.vpc_sec.id
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = [aws_route_table.data_rt.id]
  policy          = <<POLICY
{
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ]
}
POLICY
  tags = {
    Name = "fgtvm-endpoint-to-s3"
  }
}
