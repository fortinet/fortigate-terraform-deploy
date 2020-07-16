//AWS Configuration
variable access_key {}
variable secret_key {}

variable "region" {
  default = "us-west-1"
}

// Availability zones for the region
variable "az1" {
  default = "us-west-1a"
}

variable "az2" {
  default = "us-west-1b"
}

variable "vpccidr" {
  default = "10.1.0.0/16"
}

variable "publiccidraz1" {
  default = "10.1.0.0/24"
}

variable "privatecidraz1" {
  default = "10.1.1.0/24"
}


// AMIs are for FGTVM-AWS(PAYG) - 6.4.1
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-02cbcc029e8550e2f"
    us-west-1      = "ami-075a3a13e2b2fc908"
    us-east-1      = "ami-016ac6c1a802f99a1"
    us-east-2      = "ami-0470a65a67f774b54"
    ap-east-1      = "ami-0d82609784db73afd"
    ap-south-1     = "ami-07a7a8bc7b8280414"
    ap-northeast-2 = "ami-0d714b0e360fbc378"
    ap-southeast-1 = "ami-06bbcc3ed16453638"
    ap-southeast-2 = "ami-0468c6395d63fdd96"
    ap-northeast-1 = "ami-06e83b5511ad5c7f1"
    ca-central-1   = "ami-09ea7263a6246dd3d"
    eu-central-1   = "ami-0cd63578d8a6fc4cd"
    eu-west-1      = "ami-0d78759a784f8085d"
    eu-west-2      = "ami-0e65eb4dd45ee4258"
    eu-west-3      = "ami-0b47346da759bd67e"
    eu-north-1     = "ami-014dde07dffde2c0f"
    me-south-1     = "ami-0b0432582909ba94a"
    sa-east-1      = "ami-03bf81fbb4967011c"
  }
}

variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS
variable "keyname" {
  default = "<AWS SSH key>"
}

variable "adminsport" {
  default = "8443"
}

variable "bootstrap-fgtvm" {
  // Change to your own path
  type    = string
  default = "fgtvm.conf"
}

