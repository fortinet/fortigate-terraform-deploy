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

# IAM Policy for FortiGate to access the S3 Buckets
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

# Assign the IAM Profile to the FortiGate instance
#
resource "aws_iam_instance_profile" "fortigate" {
  count = var.bucket ? 1 : 0
  name  = "fgtiamprofile${random_string.random_name_post.result}"

  role = aws_iam_role.fortigate[0].name
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

# S3 Bucket config file for storing fgtvm1 config
#
resource "aws_s3_object" "conf1" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = var.bootstrap-fgtvm
  content = templatefile("${var.bootstrap-fgtvm}", {
    adminsport  = "${var.adminsport}"
    dst         = var.privatecidraz2
    gateway     = cidrhost(var.privatecidraz1, 1)
    endpointip  = "${data.aws_network_interface.vpcendpointip.private_ip}"
    endpointip2 = "${data.aws_network_interface.vpcendpointipaz2.private_ip}"
  })
}

# S3 Bucket config file for storing fgtvm1 config
#
resource "aws_s3_object" "conf2" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = "${var.bootstrap-fgtvm}2"
  content = templatefile("${var.bootstrap-fgtvm}", {
    adminsport  = "${var.adminsport}"
    dst         = var.privatecidraz1
    gateway     = cidrhost(var.privatecidraz2, 1)
    endpointip  = "${data.aws_network_interface.vpcendpointip.private_ip}"
    endpointip2 = "${data.aws_network_interface.vpcendpointipaz2.private_ip}"
  })
}
