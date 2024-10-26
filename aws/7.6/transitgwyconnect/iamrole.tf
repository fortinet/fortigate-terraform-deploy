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

# Create IAM role just for HA purpose only
#
resource "aws_iam_role" "fortigateha" {
  name = "fgthaiamrole${random_string.random_name_post.result}"

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

# IAM Policy with just HA failover purpose
#
resource "aws_iam_role_policy" "fortigate-ha-iam_role_policy" {
  name   = "fgthaiamrolepolicy${random_string.random_name_post.result}"
  role   = aws_iam_role.fortigateha.id
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
   }
  ]
}
EOF
}

# Assign the IAM Profile to the FortiGate instance
#
resource "aws_iam_instance_profile" "fortigate" {
  count = var.bucket ? 1 : 0
  name  = "fgtiamprofile${random_string.random_name_post.result}"

  role = aws_iam_role.fortigate[0].name
}

resource "aws_iam_instance_profile" "fortigateha" {
  name = "fgtiamhaprofile${random_string.random_name_post.result}"

  role = aws_iam_role.fortigateha.name
}


# Create S3 bucket
#
resource "aws_s3_bucket" "s3_bucket" {
  count  = var.bucket ? 1 : 0
  bucket = "ftnts3boot${random_string.random_name_post.result}"
}

# S3 Bucket license file for BYOL License
#
resource "aws_s3_object" "lic1" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = var.licenses[0]
  source = var.licenses[0]
  etag   = filemd5(var.licenses[0])
}

# S3 Bucket license file for BYOL License
#
resource "aws_s3_object" "lic2" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = var.licenses[1]
  source = var.licenses[1]
  etag   = filemd5(var.licenses[1])
}

# S3 Bucket config file for storing active fgtvm config
#
resource "aws_s3_object" "conf" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = var.bootstrap-fgtvm
  content = templatefile("${var.bootstrap-fgtvm}", {
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
  })
}

# S3 Bucket config file for storing passive fgtvm config
#
resource "aws_s3_object" "conf2" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = var.bootstrap-fgtvm2
  content = templatefile("${var.bootstrap-fgtvm2}", {
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
  })
}
