//AWS Configuration
variable access_key {}
variable secret_key {}

variable "region" {
  default = "us-west-1"
}

variable "az" {
  default = "us-west-1a"
}
// IAM role that has proper permission for HA
// Refer to https://docs.fortinet.com/vm/aws/fortigate/6.2/aws-cookbook/6.2.0/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM role>"
}

variable "vpccidr" {
  default = "10.1.0.0/16"
}

variable "publiccidr" {
  default = "10.1.0.0/24"
}

variable "privatecidr" {
  default = "10.1.1.0/24"
}

variable "hasynccidr" {
  default = "10.1.2.0/24"
}

// Preshare key for autoscale
variable "presharekey" {
  default = "Test123#"
}

variable "hamgmtcidr" {
  default = "10.1.3.0/24"
}
// Load Balancer Listen rules for forwarding the traffic
variable "test_forwarding_config" {
  default = {
    80  = "TCP"
    443 = "TCP"
  }
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

// HTTPS access port
variable "adminsport" {
  default = "8443"
}

variable "activeport1" {
  default = "10.1.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "10.1.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  default = "10.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "activeport4" {
  default = "10.1.3.10"
}

variable "activeport4mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  default = "10.1.0.11"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  default = "10.1.1.11"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  default = "10.1.2.11"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  default = "10.1.3.11"
}

variable "passiveport4mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "10.1.0.1"
}

variable "activeport4gateway" {
  default = "10.1.3.1"
}

variable "passiveport1gateway" {
  default = "10.1.0.1"
}

variable "passiveport4gateway" {
  default = "10.1.3.1"
}


variable "bootstrap-active" {
  // Change to your own path
  type    = string
  default = "config-active.conf"
}

variable "bootstrap-passive" {
  // Change to your own path
  type    = string
  default = "config-passive.conf"
}

