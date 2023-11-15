resource "aws_eip" "ClusterPublicIP" {
  depends_on                = [aws_instance.fgtactive]
  vpc                       = true
  network_interface         = aws_network_interface.eth0.id
  associate_with_private_ip = var.activeport1float
}

resource "aws_eip" "MGMTPublicIP" {
  depends_on        = [aws_instance.fgtactive]
  vpc               = true
  network_interface = aws_network_interface.eth3.id
}

resource "aws_eip" "PassiveMGMTPublicIP" {
  depends_on        = [aws_instance.fgtpassive]
  vpc               = true
  network_interface = aws_network_interface.passiveeth3.id
}




// Security Group

resource "aws_security_group" "public_allow" {
  name        = "Public Allow"
  description = "Public Allow traffic"
  //vpc_id      = aws_vpc.fgtvm-vpc.id
  vpc_id = var.vpcid

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

resource "aws_security_group" "allow_all" {
  name        = "Allow All"
  description = "Allow all traffic"
  //vpc_id      = aws_vpc.fgtvm-vpc.id
  vpc_id = var.vpcid

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
    Name = "Private Allow"
  }
}
