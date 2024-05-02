// FGTVM instance

resource "aws_network_interface" "eth0-2" {
  description = "fgtvm2-port1"
  private_ips = var.fgt2port1ip
  subnet_id   = aws_subnet.publicsubnetaz2.id
}
resource "aws_network_interface" "eth1-2" {
  description       = "fgtvm2-port2"
  subnet_id         = aws_subnet.privatesubnetaz2.id
  private_ips       = var.fgt2port2ip
  source_dest_check = false
}
resource "aws_network_interface" "eth2-2" {
  description       = "fgtvm2-port3"
  subnet_id         = aws_subnet.hasyncsubnetaz2.id
  private_ips       = var.fgt2port3ip
  source_dest_check = false
}

data "aws_network_interface" "eth1-2" {
  id = aws_network_interface.eth1-2.id
}

data "aws_network_interface" "eth2-2" {
  id = aws_network_interface.eth2-2.id
}

resource "aws_network_interface_sg_attachment" "publicattachment-2" {
  depends_on           = [aws_network_interface.eth0-2]
  security_group_id    = aws_security_group.public_allow.id
  network_interface_id = aws_network_interface.eth0-2.id
}

resource "aws_network_interface_sg_attachment" "internalattachment-2" {
  depends_on           = [aws_network_interface.eth1-2]
  security_group_id    = aws_security_group.allow_all.id
  network_interface_id = aws_network_interface.eth1-2.id
}

resource "aws_network_interface_sg_attachment" "hasyncattachment-2" {
  depends_on           = [aws_network_interface.eth2-2]
  security_group_id    = aws_security_group.allow_all.id
  network_interface_id = aws_network_interface.eth2-2.id
}

resource "aws_instance" "fgtvm2" {
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.size
  availability_zone = var.az2
  key_name          = var.keyname
  user_data = chomp(templatefile("${var.bootstrap-fgtvm2}", {
    type            = "${var.license_type}"
    license_file    = "${var.license}"
    format          = "${var.license_format}"
    adminsport      = "${var.adminsport}"
    port1_ip        = "${var.fgt2port1ip[0]}"
    port1_mask      = "${cidrnetmask(var.publiccidraz2)}"
    port2_ip        = "${var.fgt2port2ip[0]}"
    port2_mask      = "${cidrnetmask(var.privatecidraz2)}"
    port3_ip        = "${var.fgt2port3ip[0]}"
    port3_mask      = "${cidrnetmask(var.hasynccidraz2)}"
    active_peerip   = "${var.fgtport3ip[0]}"
    mgmt_gateway_ip = cidrhost(var.hasynccidraz2, 1)
    gateway         = cidrhost(var.privatecidraz2, 1)
    defaultgwy      = cidrhost(var.publiccidraz2, 1)
  }))

  iam_instance_profile = var.iam

  root_block_device {
    volume_type = "standard"
    volume_size = "2"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "30"
    volume_type = "standard"
  }

  network_interface {
    network_interface_id = aws_network_interface.eth0-2.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.eth1-2.id
    device_index         = 1
  }

  network_interface {
    network_interface_id = aws_network_interface.eth2-2.id
    device_index         = 2
  }

  tags = {
    Name = "FortiGateVM-2"
  }
}
