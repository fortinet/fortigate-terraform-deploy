// FGTVM active instance

resource "aws_network_interface" "passiveeth0" {
  description = "passive-port1"
  subnet_id   = aws_subnet.publicsubnet.id
  private_ips = [var.passiveport1]
}

resource "aws_network_interface" "passiveeth1" {
  description       = "passive-port2"
  subnet_id         = aws_subnet.privatesubnet.id
  private_ips       = [var.passiveport2]
  source_dest_check = false
}


resource "aws_network_interface" "passiveeth2" {
  description       = "passive-port3"
  subnet_id         = aws_subnet.hasyncsubnet.id
  private_ips       = [var.passiveport3]
  source_dest_check = false
}


resource "aws_network_interface" "passiveeth3" {
  description = "passive-port4"
  subnet_id   = aws_subnet.hamgmtsubnet.id
  private_ips = [var.passiveport4]
}


resource "aws_network_interface_sg_attachment" "passivepublicattachment" {
  depends_on           = [aws_network_interface.passiveeth0]
  security_group_id    = aws_security_group.public_allow.id
  network_interface_id = aws_network_interface.passiveeth0.id
}


resource "aws_network_interface_sg_attachment" "passivemgmtattachment" {
  depends_on           = [aws_network_interface.passiveeth3]
  security_group_id    = aws_security_group.public_allow.id
  network_interface_id = aws_network_interface.passiveeth3.id
}

resource "aws_network_interface_sg_attachment" "passiveinternalattachment" {
  depends_on           = [aws_network_interface.passiveeth1]
  security_group_id    = aws_security_group.allow_all.id
  network_interface_id = aws_network_interface.passiveeth1.id
}

resource "aws_network_interface_sg_attachment" "passivehasyncattachment" {
  depends_on           = [aws_network_interface.passiveeth2]
  security_group_id    = aws_security_group.allow_all.id
  network_interface_id = aws_network_interface.passiveeth2.id
}

# Render a part using a `template_file`
data "template_file" "fgtconfig2" {
  template = file("${var.bootstrap-passive}")

  vars = {
    adminsport      = "${var.adminsport}"
    port1_ip        = "${var.passiveport1}"
    port1_mask      = "${var.passiveport1mask}"
    port2_ip        = "${var.passiveport2}"
    port2_mask      = "${var.passiveport2mask}"
    port3_ip        = "${var.passiveport3}"
    port3_mask      = "${var.passiveport3mask}"
    port4_ip        = "${var.passiveport4}"
    port4_mask      = "${var.passiveport4mask}"
    active_peerip   = "${var.activeport3}"
    mgmt_gateway_ip = "${var.passiveport4gateway}"
    defaultgwy      = "${var.passiveport1gateway}"
  }
}

# Cloudinit config in MIME format
data "template_cloudinit_config" "config2" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "config"
    content_type = "text/x-shellscript"
    content      = data.template_file.fgtconfig2.rendered
  }

  part {
    filename     = "license"
    content_type = "text/plain"
    content      = var.license_format == "token" ? "LICENSE-TOKEN:${chomp(file("${var.licenses[1]}"))} INTERVAL:4 COUNT:4" : "${file("${var.licenses[1]}")}"
  }
}

resource "aws_instance" "fgtpassive" {
  depends_on = [aws_instance.fgtactive]
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.size
  availability_zone = var.az
  key_name          = var.keyname

  user_data = var.bucket ? (var.license_format == "file" ? "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license                       = var.licenses[1],
    config                        = "${var.bootstrap-passive}"
    })}" : "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license-token                 = file("${var.licenses[1]}"),
    config                        = "${var.bootstrap-passive}"
  })}") : "${data.template_cloudinit_config.config2.rendered}"

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
    network_interface_id = aws_network_interface.passiveeth0.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.passiveeth1.id
    device_index         = 1
  }

  network_interface {
    network_interface_id = aws_network_interface.passiveeth2.id
    device_index         = 2
  }

  network_interface {
    network_interface_id = aws_network_interface.passiveeth3.id
    device_index         = 3
  }


  tags = {
    Name = "FortiGateVM Passive"
  }
}
