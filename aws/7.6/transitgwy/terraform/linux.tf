##############################################################################################################
# VM LINUX for testing
##############################################################################################################
## Retrieve AMI info
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# test device in spoke1
resource "aws_instance" "instance-spoke1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.spoke_vpc1-priv1.id
  vpc_security_group_ids = [aws_security_group.NSG-spoke1-ssh-icmp-https.id]
  key_name               = var.keypair

  tags = {
    Name     = "instance-${var.tag_name_unique}-spoke1"
    scenario = var.scenario
    az       = var.availability_zone1
  }
}

# test device in spoke2
resource "aws_instance" "instance-spoke2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.spoke_vpc2-priv2.id
  vpc_security_group_ids = [aws_security_group.NSG-spoke2-ssh-icmp-https.id]
  key_name               = var.keypair

  tags = {
    Name     = "instance-${var.tag_name_unique}-spoke2"
    scenario = var.scenario
    az       = var.availability_zone2
  }
}

# test device in mgmt
resource "aws_instance" "instance-mgmt" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.spoke_mgmt-priv1.id
  vpc_security_group_ids      = [aws_security_group.NSG-mgmt-ssh-icmp-https.id]
  key_name                    = var.keypair
  associate_public_ip_address = true

  tags = {
    Name     = "instance-${var.tag_name_unique}-mgmt"
    scenario = var.scenario
    az       = var.availability_zone1
  }
}


