// AWS VPC - FortiGate 
resource "aws_vpc" "fgtvm-vpc" {
  cidr_block           = var.vpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
  tags = {
    Name = "terraform fgt demo"
  }
}

resource "aws_subnet" "publicsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.publiccidraz1
  availability_zone = var.az1
  tags = {
    Name = "public subnet az1"
  }
}

resource "aws_subnet" "privatesubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.privatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "private subnet az1"
  }
}

// AWS VPC - Customer
resource "aws_vpc" "customer-vpc" {
  cidr_block           = var.csvpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
  tags = {
    Name = "terraform customer demo"
  }
}

resource "aws_subnet" "cspublicsubnetaz1" {
  vpc_id            = aws_vpc.customer-vpc.id
  cidr_block        = var.cspubliccidraz1
  availability_zone = var.az1
  tags = {
    Name = "cs public subnet az1"
  }
}

resource "aws_subnet" "csprivatesubnetaz1" {
  vpc_id            = aws_vpc.customer-vpc.id
  cidr_block        = var.csprivatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "cs private subnet az1"
  }
}

resource "aws_subnet" "cspublicsubnetaz2" {
  vpc_id            = aws_vpc.customer-vpc.id
  cidr_block        = var.cspubliccidraz2
  availability_zone = var.az2
  tags = {
    Name = "cs public subnet az2"
  }
}

resource "aws_subnet" "csprivatesubnetaz2" {
  vpc_id            = aws_vpc.customer-vpc.id
  cidr_block        = var.csprivatecidraz2
  availability_zone = var.az2
  tags = {
    Name = "cs private subnet az2"
  }
}
