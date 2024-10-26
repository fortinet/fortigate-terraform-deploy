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

# Render a part using a `template_file`
data "template_file" "fgtconfig" {
  template = file("${var.bootstrap-fgtvm}")

  vars = {
    adminsport      = "${var.adminsport}"
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
  }
}

# Cloudinit config in MIME format
data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "config"
    content_type = "text/x-shellscript"
    content      = data.template_file.fgtconfig.rendered
  }

  part {
    filename     = "license"
    content_type = "text/plain"
    content      = var.license_format == "token" ? "LICENSE-TOKEN:${chomp(file("${var.licenses[0]}"))} INTERVAL:4 COUNT:4" : "${file("${var.licenses[0]}")}"
  }
}

resource "aws_instance" "fgtvm" {
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.size
  availability_zone = var.az1
  key_name          = var.keyname

  user_data = var.bucket ? (var.license_format == "file" ? "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license                       = var.licenses[0],
    config                        = "${var.bootstrap-fgtvm}"
    })}" : "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license-token                 = file("${var.licenses[0]}"),
    config                        = "${var.bootstrap-fgtvm}"
  })}") : "${data.template_cloudinit_config.config.rendered}"

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


  tags = {
    Name = "FortiGateVM"
  }
}
