//AWS Configuration
variable access_key {}
variable secret_key {}

variable "region" {
  default = "us-west-2"
}

// Availability zones for the region
variable "az1" {
  default = "us-west-2a"
}

variable "az2" {
  default = "us-west-2b"
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

variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<aws ssh key>"
}

variable "adminsport" {
  default = "8443"
}

variable "bootstrap-fgtvm" {
  // Change to your own path
  type    = string
  default = "fgtvm.conf"
}

