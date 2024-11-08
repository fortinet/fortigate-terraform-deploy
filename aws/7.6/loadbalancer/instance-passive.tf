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

resource "aws_network_interface_sg_attachment" "passivepublicattachment" {
  depends_on           = [aws_network_interface.passiveeth0]
  security_group_id    = aws_security_group.public_allow.id
  network_interface_id = aws_network_interface.passiveeth0.id
}

resource "aws_network_interface_sg_attachment" "passiveinternalattachment" {
  depends_on           = [aws_network_interface.passiveeth1]
  security_group_id    = aws_security_group.allow_all.id
  network_interface_id = aws_network_interface.passiveeth1.id
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

  tags = {
    Name = "FortiGateVM Passive"
  }
}
