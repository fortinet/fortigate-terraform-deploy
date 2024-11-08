// FGTVM instance

resource "aws_network_interface" "eth0" {
  description = "fgtvm-port1"
  subnet_id   = aws_subnet.publicsubnetaz1.id
}

resource "aws_network_interface" "eth1" {
  description       = "fgtvm-port2"
  subnet_id         = aws_subnet.privatesubnetaz1.id
  source_dest_check = false
}

resource "aws_network_interface" "eth0-1" {
  description = "fgtvm2-port1"
  subnet_id   = aws_subnet.publicsubnetaz2.id
}

resource "aws_network_interface" "eth1-1" {
  description       = "fgtvm2-port2"
  subnet_id         = aws_subnet.privatesubnetaz2.id
  source_dest_check = false
}



data "aws_network_interface" "eth1" {
  id = aws_network_interface.eth1.id
}

data "aws_network_interface" "eth1-1" {
  id = aws_network_interface.eth1-1.id
}



//
data "aws_network_interface" "vpcendpointip" {
  depends_on = [aws_vpc_endpoint.gwlbendpoint]
  filter {
    name   = "vpc-id"
    values = ["${aws_vpc.fgtvm-vpc.id}"]
  }
  filter {
    name   = "status"
    values = ["in-use"]
  }
  filter {
    name   = "description"
    values = ["*ELB*"]
  }
  filter {
    name   = "availability-zone"
    values = ["${var.az1}"]
  }
}

data "aws_network_interface" "vpcendpointipaz2" {
  depends_on = [aws_vpc_endpoint.gwlbendpoint]
  filter {
    name   = "vpc-id"
    values = ["${aws_vpc.fgtvm-vpc.id}"]
  }
  filter {
    name   = "status"
    values = ["in-use"]
  }
  filter {
    name   = "description"
    values = ["*ELB*"]
  }
  filter {
    name   = "availability-zone"
    values = ["${var.az2}"]
  }
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

resource "aws_network_interface_sg_attachment" "publicattachment2" {
  depends_on           = [aws_network_interface.eth0-1]
  security_group_id    = aws_security_group.public_allow.id
  network_interface_id = aws_network_interface.eth0-1.id
}

resource "aws_network_interface_sg_attachment" "internalattachment2" {
  depends_on           = [aws_network_interface.eth1-1]
  security_group_id    = aws_security_group.allow_all.id
  network_interface_id = aws_network_interface.eth1-1.id
}

# Render a part using a `template_file`
data "template_file" "fgtconfig1" {
  template = file("${var.bootstrap-fgtvm}")

  vars = {
    adminsport  = "${var.adminsport}"
    dst         = var.privatecidraz2
    gateway     = cidrhost(var.privatecidraz1, 1)
    endpointip  = "${data.aws_network_interface.vpcendpointip.private_ip}"
    endpointip2 = "${data.aws_network_interface.vpcendpointipaz2.private_ip}"
  }
}

# Cloudinit config in MIME format
data "template_cloudinit_config" "config1" {
  gzip          = false
  base64_encode = false

  # Main cloud-config configuration file.
  part {
    filename     = "config"
    content_type = "text/x-shellscript"
    content      = data.template_file.fgtconfig1.rendered
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
  })}") : "${data.template_cloudinit_config.config1.rendered}"

  iam_instance_profile = var.bucket ? aws_iam_instance_profile.fortigate[0].id : ""

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

  tags = {
    Name = "FortiGateVM-az1"
  }
}

# Render a part using a `template_file`
data "template_file" "fgtconfig2" {
  template = file("${var.bootstrap-fgtvm}")

  vars = {
    adminsport  = "${var.adminsport}"
    dst         = var.privatecidraz1
    gateway     = cidrhost(var.privatecidraz2, 1)
    endpointip  = "${data.aws_network_interface.vpcendpointip.private_ip}"
    endpointip2 = "${data.aws_network_interface.vpcendpointipaz2.private_ip}"
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

resource "aws_instance" "fgtvm2" {
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.size
  availability_zone = var.az2
  key_name          = var.keyname

  user_data = var.bucket ? (var.license_format == "file" ? "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license                       = var.licenses[1],
    config                        = "${var.bootstrap-fgtvm}2"
    })}" : "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license-token                 = file("${var.licenses[1]}"),
    config                        = "${var.bootstrap-fgtvm}2"
  })}") : "${data.template_cloudinit_config.config2.rendered}"

  iam_instance_profile = var.bucket ? aws_iam_instance_profile.fortigate[0].id : ""

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
    network_interface_id = aws_network_interface.eth0-1.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.eth1-1.id
    device_index         = 1
  }

  tags = {
    Name = "FortiGateVM-az2"
  }
}
