// FGTVM instance

resource "aws_network_interface" "eth0" {
  description = "fgtvm-port1"
  subnet_id   = var.publiccidraz1id
  private_ips = [var.port1]
}

resource "aws_network_interface" "eth1" {
  description       = "fgtvm-port2"
  subnet_id         = var.privatecidraz1id
  private_ips       = [var.port2]
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


resource "aws_instance" "fgtvm" {
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.size
  availability_zone = var.az1
  key_name          = var.keyname
  user_data = templatefile("${var.bootstrap-fgtvm}", {
    type         = "${var.license_type}"
    license_file = "${var.license}"
    username     = "${var.username}"
    password     = "${var.password}"
    webserver    = "${var.webserver}"
    port1_ip     = "${var.port1}"
    port1_mask   = "${var.port1mask}"
    port2_ip     = "${var.port2}"
    port2_mask   = "${var.port2mask}"
    defaultgwy   = "${var.port1defaultgwy}"
    adminsport   = "${var.adminsport}"
  })

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
    Name = "FortiGateVM"
  }
}
