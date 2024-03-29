// FGTVM active instance

resource "aws_network_interface" "eth0" {
  description = "active-port1"
  subnet_id   = aws_subnet.publicsubnet.id
  private_ips = [var.activeport1]
}

resource "aws_network_interface" "eth1" {
  description       = "active-port2"
  subnet_id         = aws_subnet.privatesubnet.id
  private_ips       = [var.activeport2]
  source_dest_check = false
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

resource "aws_instance" "fgtactive" {
  ami                  = lookup(var.fgtvmami, var.region)
  instance_type        = var.size
  availability_zone    = var.az
  key_name             = var.keyname
  user_data            = data.template_file.activeFortiGate.rendered
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
    network_interface_id = aws_network_interface.eth0.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.eth1.id
    device_index         = 1
  }

  tags = {
    Name = "FortiGateVM Active"
  }
}


data "template_file" "activeFortiGate" {
  template = file("${var.bootstrap-active}")
  vars = {
    port1_ip       = "${var.activeport1}"
    port1_mask     = "${var.activeport1mask}"
    port2_ip       = "${var.activeport2}"
    port2_mask     = "${var.activeport2mask}"
    passive_peerip = "${var.passiveport1}"
    presharekey    = "${var.presharekey}"
    defaultgwy     = "${var.activeport1gateway}"
    adminsport     = "${var.adminsport}"
  }
}

