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
  key    = var.license
  source = var.license
  etag   = filemd5(var.license)
}

# S3 Bucket config file for storing fgtvm config
#
resource "aws_s3_object" "conf" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = var.bootstrap-fgtvm
  content = templatefile("${var.bootstrap-fgtvm}", {
    adminsport  = "${var.adminsport}"
    endpointip  = "${data.aws_network_interface.vpcendpointip.private_ip}"
    endpointid1 = trimprefix("${aws_vpc_endpoint.gwlbendpoint.id}", "vpce-")
    endpointid2 = trimprefix("${aws_vpc_endpoint.gwlbendpoint2.id}", "vpce-")
  })
}
