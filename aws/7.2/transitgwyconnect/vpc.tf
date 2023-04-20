// AWS VPC - FortiGate
resource "aws_vpc" "fgtvm-vpc" {
  cidr_block           = var.vpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
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
    Name = "fgt public subnet az1"
  }
}
//
resource "aws_subnet" "privatesubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.privatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "fgt private subnet az1"
  }
}

resource "aws_subnet" "transitsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.attachcidraz1
  availability_zone = var.az1
  tags = {
    Name = "fgt transit attach subnet az1"
  }
}

// AWS VPC - Customer
resource "aws_vpc" "customer-vpc" {
  cidr_block           = var.csvpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "terraform customer demo"
  }
}

resource "aws_subnet" "csprivatesubnetaz1" {
  vpc_id            = aws_vpc.customer-vpc.id
  cidr_block        = var.csprivatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "cs app subnet az1"
  }
}


// AWS VPC - Customer2
resource "aws_vpc" "customer2-vpc" {
  cidr_block           = var.cs2vpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "terraform customer2 demo"
  }
}

resource "aws_subnet" "cs2privatesubnetaz1" {
  vpc_id            = aws_vpc.customer2-vpc.id
  cidr_block        = var.cs2privatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "cs2 app subnet az1"
  }
}
