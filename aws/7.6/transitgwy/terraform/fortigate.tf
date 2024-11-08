##############################################################################################################
#
# AWS Transit Gateway
# FortiGate setup with Active/Passive in Multiple Availability Zones
#
##############################################################################################################

##############################################################################################################
# GENERAL
##############################################################################################################

# Security Groups
## Need to create 4 of them as our Security Groups are linked to a VPC

resource "aws_security_group" "NSG-spoke1-ssh-icmp-https" {
  name        = "NSG-spoke1-ssh-icmp-https"
  description = "Allow SSH, HTTPS and ICMP traffic"
  vpc_id      = aws_vpc.spoke_vpc1.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8 # the ICMP type number for 'Echo'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0 # the ICMP type number for 'Echo Reply'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "NSG-spoke1-ssh-icmp-https"
    scenario = var.scenario
  }
}

resource "aws_security_group" "NSG-spoke2-ssh-icmp-https" {
  name        = "NSG-spoke2-ssh-icmp-https"
  description = "Allow SSH, HTTPS and ICMP traffic"
  vpc_id      = aws_vpc.spoke_vpc2.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1 # all icmp
    to_port     = -1 # all icmp
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "NSG-spoke2-ssh-icmp-https"
    scenario = var.scenario
  }
}

resource "aws_security_group" "NSG-mgmt-ssh-icmp-https" {
  name        = "NSG-mgmt-ssh-icmp-https"
  description = "Allow SSH, HTTPS and ICMP traffic"
  vpc_id      = aws_vpc.spoke_mgmt.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1 # the ICMP type number for 'Echo Reply'
    to_port     = -1 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "NSG-mgmt-ssh-icmp-https"
    scenario = var.scenario
  }
}

resource "aws_security_group" "NSG-vpc-sec-ssh-icmp-https" {
  name        = "NSG-vpc-sec-ssh-icmp-https"
  description = "Allow SSH, HTTPS and ICMP traffic"
  vpc_id      = aws_vpc.vpc_sec.id

  ingress {
    description = "Allow remote access to FGT"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "NSG-vpc-sec-ssh-icmp-https"
    scenario = var.scenario
  }
}

##############################################################################################################
# FORTIGATES VM
##############################################################################################################
# Create the IAM role/profile for the API Call
resource "aws_iam_instance_profile" "APICall_profile" {
  name = "APICall_profile"
  role = aws_iam_role.APICallrole.name
}

# Assign the IAM Profile to the FortiGate instance
#
resource "aws_iam_instance_profile" "fortigate" {
  count = var.bucket ? 1 : 0
  name  = "fgtiamprofile${random_string.random_name_post.result}"

  role = aws_iam_role.fortigate[0].name
}


# Create an IAM Role to assign to the FortiGate VM instance
#
resource "aws_iam_role" "fortigate" {
  count = var.bucket ? 1 : 0
  name  = "fgtiamrole${random_string.random_name_post.result}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Sid = ""
      }
    ]
  })
}

resource "aws_iam_role" "APICallrole" {
  name = "APICall_role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
              "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "APICallpolicy" {
  name        = "APICall_policy"
  path        = "/"
  description = "Policies for the FGT APICall Role"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement":
      [
        {
          "Effect": "Allow",
          "Action": 
            [
              "ec2:Describe*",
              "ec2:AssociateAddress",
              "ec2:AssignPrivateIpAddresses",
              "ec2:UnassignPrivateIpAddresses",
              "ec2:ReplaceRoute"
            ],
            "Resource": "*"
        }
      ]
}
EOF
}


# IAM Policy for FortiGate to access the S3 Buckets and HA Failover
#
resource "aws_iam_role_policy" "fortigate-iam_role_policy" {
  count  = var.bucket ? 1 : 0
  name   = "fgtiamrolepolicy${random_string.random_name_post.result}"
  role   = aws_iam_role.fortigate[0].id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
   {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*",
        "ec2:AssociateAddress",
        "ec2:AssignPrivateIpAddresses",
        "ec2:UnassignPrivateIpAddresses",
        "ec2:ReplaceRoute"
        ],
      "Resource": "*"
   },
   {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.s3_bucket[0].id}"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.s3_bucket[0].id}/*"]
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "APICall-attach" {
  name       = "APICall-attachment"
  roles      = [aws_iam_role.APICallrole.name]
  policy_arn = aws_iam_policy.APICallpolicy.arn
}


# Create all the eni interfaces
resource "aws_network_interface" "eni-fgt1-data" {
  subnet_id         = aws_subnet.data_subnet1.id
  security_groups   = [aws_security_group.NSG-vpc-sec-ssh-icmp-https.id]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt1-enidata"
  }
}

resource "aws_network_interface" "eni-fgt2-data" {
  subnet_id         = aws_subnet.data_subnet2.id
  security_groups   = [aws_security_group.NSG-vpc-sec-ssh-icmp-https.id]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt2-enidata"
  }
}

resource "aws_network_interface" "eni-fgt1-hb" {
  subnet_id         = aws_subnet.heartbeat_subnet1.id
  security_groups   = [aws_security_group.NSG-vpc-sec-ssh-icmp-https.id]
  private_ips       = [cidrhost(var.security_vpc_heartbeat_subnet_cidr1, 10)]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt1-enihb"
  }
}

resource "aws_network_interface" "eni-fgt2-hb" {
  subnet_id         = aws_subnet.heartbeat_subnet2.id
  security_groups   = [aws_security_group.NSG-vpc-sec-ssh-icmp-https.id]
  private_ips       = [cidrhost(var.security_vpc_heartbeat_subnet_cidr2, 10)]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt2-enihb"
  }
}

resource "aws_network_interface" "eni-fgt1-mgmt" {
  subnet_id         = aws_subnet.mgmt_subnet1.id
  security_groups   = [aws_security_group.NSG-vpc-sec-ssh-icmp-https.id]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt1-enimgmt"
  }
}

resource "aws_network_interface" "eni-fgt2-mgmt" {
  subnet_id         = aws_subnet.mgmt_subnet2.id
  security_groups   = [aws_security_group.NSG-vpc-sec-ssh-icmp-https.id]
  source_dest_check = false
  tags = {
    Name = "${var.tag_name_prefix}-fgt2-enimgmt"
  }
}

# Create and attach the eip to the units
resource "aws_eip" "eip-mgmt1" {
  depends_on        = [aws_instance.fgt1]
  domain            = "vpc"
  network_interface = aws_network_interface.eni-fgt1-mgmt.id
  tags = {
    Name = "${var.tag_name_prefix}-fgt1-eip-mgmt"
  }
}

resource "aws_eip" "eip-mgmt2" {
  depends_on        = [aws_instance.fgt2]
  domain            = "vpc"
  network_interface = aws_network_interface.eni-fgt2-mgmt.id
  tags = {
    Name = "${var.tag_name_prefix}-fgt2-eip-mgmt"
  }
}

resource "aws_eip" "eip-shared" {
  depends_on        = [aws_instance.fgt1]
  domain            = "vpc"
  network_interface = aws_network_interface.eni-fgt1-data.id
  tags = {
    Name = "${var.tag_name_prefix}-eip-cluster"
  }
}

# Render a part using a `template_file`
data "template_file" "fgtconfig" {
  template = file("./fgt-userdata.tpl")

  vars = {
    fgt_id               = "FGT-Active"
    fgt_data_ip          = join("/", [element(tolist(aws_network_interface.eni-fgt1-data.private_ips), 0), cidrnetmask("${var.security_vpc_data_subnet_cidr1}")])
    fgt_heartbeat_ip     = join("/", [element(tolist(aws_network_interface.eni-fgt1-hb.private_ips), 0), cidrnetmask("${var.security_vpc_heartbeat_subnet_cidr1}")])
    fgt_mgmt_ip          = join("/", [element(tolist(aws_network_interface.eni-fgt1-mgmt.private_ips), 0), cidrnetmask("${var.security_vpc_mgmt_subnet_cidr1}")])
    data_gw              = cidrhost(var.security_vpc_data_subnet_cidr1, 1)
    spoke1_cidr          = var.spoke_vpc1_cidr
    spoke2_cidr          = var.spoke_vpc2_cidr
    mgmt_cidr            = var.mgmt_cidr
    password             = var.password
    mgmt_gw              = cidrhost(var.security_vpc_mgmt_subnet_cidr1, 1)
    fgt_priority         = "255"
    fgt-remote-heartbeat = element(tolist(aws_network_interface.eni-fgt2-hb.private_ips), 0)
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

# Create the instances
resource "aws_instance" "fgt1" {
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.instance_type
  availability_zone = var.availability_zone1
  key_name          = var.keypair

  user_data = var.bucket ? (var.license_format == "file" ? "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license                       = var.licenses[0],
    config                        = "fgt-userdata.tpl"
    })}" : "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license-token                 = file("${var.licenses[0]}"),
    config                        = "fgt-userdata.tpl"
  })}") : "${data.template_cloudinit_config.config.rendered}"

  iam_instance_profile = var.bucket ? aws_iam_instance_profile.fortigate[0].id : aws_iam_instance_profile.APICall_profile.name

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.eni-fgt1-data.id
  }
  network_interface {
    device_index         = 1
    network_interface_id = aws_network_interface.eni-fgt1-hb.id
  }
  network_interface {
    device_index         = 2
    network_interface_id = aws_network_interface.eni-fgt1-mgmt.id
  }
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-fgt1"
  }
}

# Render a part using a `template_file`
data "template_file" "fgtconfig2" {
  template = file("./fgt-userdata.tpl")

  vars = {
    fgt_id               = "FGT-Passive"
    fgt_data_ip          = join("/", [element(tolist(aws_network_interface.eni-fgt2-data.private_ips), 0), cidrnetmask("${var.security_vpc_data_subnet_cidr2}")])
    fgt_heartbeat_ip     = join("/", [element(tolist(aws_network_interface.eni-fgt2-hb.private_ips), 0), cidrnetmask("${var.security_vpc_heartbeat_subnet_cidr2}")])
    fgt_mgmt_ip          = join("/", [element(tolist(aws_network_interface.eni-fgt2-mgmt.private_ips), 0), cidrnetmask("${var.security_vpc_mgmt_subnet_cidr2}")])
    data_gw              = cidrhost(var.security_vpc_data_subnet_cidr2, 1)
    spoke1_cidr          = var.spoke_vpc1_cidr
    spoke2_cidr          = var.spoke_vpc2_cidr
    mgmt_cidr            = var.mgmt_cidr
    password             = var.password
    mgmt_gw              = cidrhost(var.security_vpc_mgmt_subnet_cidr2, 1)
    fgt_priority         = "100"
    fgt-remote-heartbeat = element(tolist(aws_network_interface.eni-fgt1-hb.private_ips), 0)
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

resource "aws_instance" "fgt2" {
  //it will use region, architect, and license type to decide which ami to use for deployment
  ami               = var.fgtami[var.region][var.arch][var.license_type]
  instance_type     = var.instance_type
  availability_zone = var.availability_zone2
  key_name          = var.keypair

  user_data = var.bucket ? (var.license_format == "file" ? "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license                       = var.licenses[1],
    config                        = "fgt-userdata2.tpl"
    })}" : "${jsonencode({ bucket = aws_s3_bucket.s3_bucket[0].id,
    region                        = var.region,
    license-token                 = file("${var.licenses[1]}"),
    config                        = "fgt-userdata2.tpl"
  })}") : "${data.template_cloudinit_config.config2.rendered}"

  iam_instance_profile = var.bucket ? aws_iam_instance_profile.fortigate[0].id : aws_iam_instance_profile.APICall_profile.name


  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.eni-fgt2-data.id
  }
  network_interface {
    device_index         = 1
    network_interface_id = aws_network_interface.eni-fgt2-hb.id
  }
  network_interface {
    device_index         = 2
    network_interface_id = aws_network_interface.eni-fgt2-mgmt.id
  }
  tags = {
    Name = "${var.tag_name_prefix}-${var.tag_name_unique}-fgt2"
  }
}
