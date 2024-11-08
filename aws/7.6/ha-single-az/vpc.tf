// AWS VPC 
resource "aws_vpc" "fgtvm-vpc" {
  cidr_block           = var.vpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "terraform demo"
  }
}

resource "aws_subnet" "publicsubnet" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.publiccidr
  availability_zone = var.az
  tags = {
    Name = "public subnet"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.privatecidr
  availability_zone = var.az
  tags = {
    Name = "private subnet"
  }
}

resource "aws_subnet" "hasyncsubnet" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.hasynccidr
  availability_zone = var.az
  tags = {
    Name = "hasync subnet"
  }
}

resource "aws_subnet" "hamgmtsubnet" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.hamgmtcidr
  availability_zone = var.az
  tags = {
    Name = "hamgmt subnet"
  }
}

# S3 endpoint inside the VPC
resource "aws_vpc_endpoint" "s3-endpoint-fgtvm-vpc" {
  count           = var.bucket ? 1 : 0
  vpc_id          = aws_vpc.fgtvm-vpc.id
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = [aws_route_table.fgtvmpublicrt.id]
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
