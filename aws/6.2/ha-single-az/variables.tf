//AWS Configuration
variable access_key {}
variable secret_key {}

variable "region" {
  default = "us-west-2"
}

variable "az" {
  default = "us-west-2a"
}

/ IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/6.2.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>"    //Put in the IAM Role name created
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

variable "hamgmtcidr" {
  default = "10.1.3.0/24"
}

// AMIs are for FGTVM-AWS(PAYG) - 6.2.3
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-02b9cc036cab1071d"
    us-west-1      = "ami-0f54d37e47fa994a0"
    us-east-1      = "ami-027f258cda3df62de"
    us-east-2      = "ami-05a4ac8312f7911b9"
    ap-east-1      = "ami-0437be57fc361c67b"
    ap-south-1     = "ami-0f6693857523585b8"
    ap-northeast-2 = "ami-065b67d14c722617a"
    ap-southeast-1 = "ami-0155fb808596ae522"
    ap-southeast-2 = "ami-0b67711c6be07aa0b"
    ap-northeast-1 = "ami-0444162d604179bf6"
    ca-central-1   = "ami-099941e57393c2225"
    eu-central-1   = "ami-0c380ca68f2b1f6e8"
    eu-west-1      = "ami-0874d1d29263b27ff"
    eu-west-2      = "ami-04eba63bb19dbeebe"
    eu-west-3      = "ami-0c104a0848b644152"
    eu-north-1     = "ami-0d49417aa3a3912e1"
    me-south-1     = "ami-0fcd028d7d86a0695"
    sa-east-1      = "ami-04de901f24e8532db"
  }
}

//Your desired instance type is available in your region if it is listed on the Instance types page for your region:
//https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-discovery.html
variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS
variable "keyname" {
  default = "<aws ssh key>"
}

// HTTPS access port
variable "adminsport" {
  default = "8443"
}

variable "activeport1" {
  default = "10.1.0.10"
}

variable "activeport1float" {
  default = "10.1.0.12"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "10.1.1.10"
}

variable "activeport2float" {
  default = "10.1.1.12"
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

