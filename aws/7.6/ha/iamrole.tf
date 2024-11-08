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
  key    = var.bootstrap-active
  content = templatefile("${var.bootstrap-active}", {
    adminsport      = "${var.adminsport}"
    port1_ip        = "${var.activeport1}"
    port1_mask      = "${var.activeport1mask}"
    port2_ip        = "${var.activeport2}"
    port2_mask      = "${var.activeport2mask}"
    port3_ip        = "${var.activeport3}"
    port3_mask      = "${var.activeport3mask}"
    port4_ip        = "${var.activeport4}"
    port4_mask      = "${var.activeport4mask}"
    passive_peerip  = "${var.passiveport3}"
    mgmt_gateway_ip = "${var.activeport4gateway}"
    defaultgwy      = "${var.activeport1gateway}"
    privategwy      = "${var.activeport2gateway}"
    vpc_ip          = cidrhost(var.vpccidr, 0)
    vpc_mask        = cidrnetmask(var.vpccidr)
  })
}

# S3 Bucket config file for storing passive fgtvm config
#
resource "aws_s3_object" "conf2" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = var.bootstrap-passive
  content = templatefile("${var.bootstrap-passive}", {
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
    privategwy      = "${var.passiveport2gateway}"
    vpc_ip          = cidrhost(var.vpccidr, 0)
    vpc_mask        = cidrnetmask(var.vpccidr)
  })
}
