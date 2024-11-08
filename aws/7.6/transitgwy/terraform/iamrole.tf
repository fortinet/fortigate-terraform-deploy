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
  key    = "./fgt-userdata.tpl"
  content = templatefile("./fgt-userdata.tpl", {
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
  })
}

# S3 Bucket config file for storing passive fgtvm config
#
resource "aws_s3_object" "conf2" {
  count  = var.bucket ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  key    = "./fgt-userdata2.tpl"
  content = templatefile("./fgt-userdata.tpl", {
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
  })
}
