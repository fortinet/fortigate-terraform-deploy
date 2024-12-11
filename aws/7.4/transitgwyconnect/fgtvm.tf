// FGTVM instance

resource "aws_network_interface" "eth0" {
  description = "fgtvm-port1"
  private_ips = var.fgtport1ip
  subnet_id   = aws_subnet.publicsubnetaz1.id
}
resource "aws_network_interface" "eth1" {
  description       = "fgtvm-port2"
  subnet_id         = aws_subnet.privatesubnetaz1.id
  private_ips       = var.fgtport2ip
  source_dest_check = false
}
resource "aws_network_interface" "eth2" {
  description       = "fgtvm-port3"
  subnet_id         = aws_subnet.hasyncsubnetaz1.id
  private_ips       = var.fgtport3ip
  source_dest_check = false
}

data "aws_network_interface" "eth1" {
  id = aws_network_interface.eth1.id
}

data "aws_network_interface" "eth2" {
  id = aws_network_interface.eth2.id
}

resource "aws_network_interface_sg_attachment" "publicattachment" {
  depends_on           = [aws_network_interface.eth0]
  security_group_id    = aws_security_group.public_allow.id
  network_interface_id = aws_network_interface.eth0.id
}

resource "aws_network_interface_sg_attachment" "internalattachment" {
  depends_on           = [aws_network_interface.eth1]
  security_group_id    = aws_security_group.allow_all.id
  network_interface_id = aws_network_interface.eth1.id
}

resource "aws_network_interface_sg_attachment" "hasyncattachment" {
  depends_on           = [aws_network_interface.eth2]
  security_group_id    = aws_security_group.allow_all.id
  network_interface_id = aws_network_interface.eth2.id
}

resource "aws_instance" "fgtvm" {
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.size
  availability_zone = var.az1
  key_name          = var.keyname
  user_data = chomp(templatefile("${var.bootstrap-fgtvm}", {
    type            = "${var.license_type}"
    license_file    = var.licenses[0]
    format          = "${var.license_format}"
    port1_ip        = "${var.fgtport1ip[0]}"
    port1_mask      = "${cidrnetmask(var.publiccidraz1)}"
    port2_ip        = "${var.fgtport2ip[0]}"
    port2_mask      = "${cidrnetmask(var.privatecidraz1)}"
    port3_ip        = "${var.fgtport3ip[0]}"
    port3_mask      = "${cidrnetmask(var.hasynccidraz1)}"
    adminsport      = "${var.adminsport}"
    passive_peerip  = "${var.fgt2port3ip[0]}"
    mgmt_gateway_ip = cidrhost(var.hasynccidraz1, 1)
    gateway         = cidrhost(var.privatecidraz1, 1)
    defaultgwy      = cidrhost(var.publiccidraz1, 1)
  }))

  iam_instance_profile = var.iam

  root_block_device {
    volume_type = "gp2"
    volume_size = "2"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "30"
    volume_type = "gp2"
  }

  network_interface {
    network_interface_id = aws_network_interface.eth0.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.eth1.id
    device_index         = 1
  }

  network_interface {
    network_interface_id = aws_network_interface.eth2.id
    device_index         = 2
  }


  tags = {
    Name = "FortiGateVM"
  }
}
