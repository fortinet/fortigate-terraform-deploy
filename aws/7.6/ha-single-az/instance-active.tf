// FGTVM active instance

resource "aws_network_interface" "eth0" {
  description = "active-port1"
  subnet_id   = aws_subnet.publicsubnet.id
  private_ips = [var.activeport1, var.activeport1float]
}

resource "aws_network_interface" "eth1" {
  description       = "active-port2"
  subnet_id         = aws_subnet.privatesubnet.id
  private_ips       = [var.activeport2, var.activeport2float]
  source_dest_check = false
}


resource "aws_network_interface" "eth2" {
  description       = "active-port3"
  subnet_id         = aws_subnet.hasyncsubnet.id
  private_ips       = [var.activeport3]
  source_dest_check = false
}


resource "aws_network_interface" "eth3" {
  description = "active-port4"
  subnet_id   = aws_subnet.hamgmtsubnet.id
  private_ips = [var.activeport4]
}


resource "aws_network_interface_sg_attachment" "publicattachment" {
  depends_on           = [aws_network_interface.eth0]
  security_group_id    = aws_security_group.public_allow.id
  network_interface_id = aws_network_interface.eth0.id
}


resource "aws_network_interface_sg_attachment" "mgmtattachment" {
  depends_on           = [aws_network_interface.eth3]
  security_group_id    = aws_security_group.public_allow.id
  network_interface_id = aws_network_interface.eth3.id
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

# Cloudinit config in MIME format
data "cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "config"
    content_type = "text/x-shellscript"
    content = templatefile("${var.bootstrap-active}", {
      adminsport      = "${var.adminsport}"
      port1_ip        = "${var.activeport1float}"
      port1_mask      = "${var.activeport1mask}"
      port2_ip        = "${var.activeport2float}"
      port2_mask      = "${var.activeport2mask}"
      port3_ip        = "${var.activeport3}"
      port3_mask      = "${var.activeport3mask}"
      port4_ip        = "${var.activeport4}"
      port4_mask      = "${var.activeport4mask}"
      passive_peerip  = "${var.passiveport3}"
      mgmt_gateway_ip = "${var.activeport4gateway}"
      defaultgwy      = "${var.activeport1gateway}"
    })
  }

  part {
    filename     = "license"
    content_type = "text/plain"
    content      = var.license_format == "token" ? "LICENSE-TOKEN:${chomp(file("${var.licenses[0]}"))} INTERVAL:4 COUNT:4" : "${file("${var.licenses[0]}")}"
  }
}

resource "aws_instance" "fgtactive" {
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.size
  availability_zone = var.az
  key_name          = var.keyname

  user_data = var.bucket ? (var.license_format == "file" ? "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license                       = var.licenses[0],
    config                        = "${var.bootstrap-active}"
    })}" : "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license-token                 = file("${var.licenses[0]}"),
    config                        = "${var.bootstrap-active}"
  })}") : "${data.cloudinit_config.config.rendered}"

  iam_instance_profile = var.bucket ? aws_iam_instance_profile.fortigate[0].id : aws_iam_instance_profile.fortigateha.id

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

  network_interface {
    network_interface_id = aws_network_interface.eth3.id
    device_index         = 3
  }


  tags = {
    Name = "FortiGateVM Active"
  }
}
