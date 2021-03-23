//AWS Configuration
variable access_key {}
variable secret_key {}

variable "region" {
  default = "ap-southeast-2"
}

// Availability zones for the region
variable "az1" {
  default = "ap-southeast-2a"
}

variable "az2" {
  default = "ap-southeast-2b"
}

// VPC for FortiGate Security VPC
variable "vpccidr" {
  default = "10.1.0.0/16"
}

variable "publiccidraz1" {
  default = "10.1.0.0/24"
}

variable "privatecidraz1" {
  default = "10.1.1.0/24"
}

variable "attachcidraz1" {
  default = "10.1.2.0/24"
}

variable "gwlbcidraz1" {
  default = "10.1.3.0/24"
}

variable "publiccidraz2" {
  default = "10.1.4.0/24"
}

variable "privatecidraz2" {
  default = "10.1.5.0/24"
}

variable "attachcidraz2" {
  default = "10.1.6.0/24"
}

variable "gwlbcidraz2" {
  default = "10.1.7.0/24"
}

// VPC for Customer VPC
variable "csvpccidr" {
  default = "20.1.0.0/16"
}

variable "cspubliccidraz1" {
  default = "20.1.0.0/24"
}

variable "csprivatecidraz1" {
  default = "20.1.1.0/24"
}


variable "cspubliccidraz2" {
  default = "20.1.2.0/24"
}

variable "csprivatecidraz2" {
  default = "20.1.3.0/24"
}

// VPC for Customer2 VPC
variable "cs2vpccidr" {
  default = "30.1.0.0/16"
}

variable "cs2publiccidraz1" {
  default = "30.1.0.0/24"
}

variable "cs2privatecidraz1" {
  default = "30.1.1.0/24"
}


variable "cs2publiccidraz2" {
  default = "30.1.2.0/24"
}

variable "cs2privatecidraz2" {
  default = "30.1.3.0/24"
}

// Autoscale settings
variable "scaledesire" {
  default = 2
}

variable "scalemax" {
  default = 2
}

variable "scalemin" {
  default = 2
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}


// AMIs are for FGTVM-AWS(PAYG) - 6.4.4
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-00b7c2fdcc89f090a"
    us-west-1      = "ami-08f558c88d066cd22"
    us-east-1      = "ami-07a2b724815412830"
    us-east-2      = "ami-0edd7a2e2ddd15b13"
    ap-east-1      = "ami-06fd2d4785b68d8cf"
    ap-south-1     = "ami-037195aab5c0862bb"
    ap-northeast-2 = "ami-05bcba53c232cc81c"
    ap-southeast-1 = "ami-07c7d2b7860822939"
    ap-southeast-2 = "ami-0e9c903b7a4fa5504"
    ap-northeast-1 = "ami-0c84d4defa5bf575f"
    ca-central-1   = "ami-0cd53df921304e190"
    eu-central-1   = "ami-0243001b5a7ac84fa"
    eu-west-1      = "ami-080914b57c95affc4"
    eu-west-2      = "ami-0a042f452e36fe070"
    eu-west-3      = "ami-06839d1b6c5b22390"
    eu-north-1     = "ami-0c72003c6b2d1a573"
    me-south-1     = "ami-07eee8c78fb8bbe6e"
    sa-east-1      = "ami-01576fcc0419c1be7"
  }
}

// AMIs are for FGTVM AWS(BYOL) - 6.4.4
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-081dc0143534e7a10"
    us-west-1      = "ami-0c7336886c55caf99"
    us-east-1      = "ami-048bcc579fae59b10"
    us-east-2      = "ami-0415913c8102a5fd6"
    ap-east-1      = "ami-0825413a2e42daea8"
    ap-south-1     = "ami-0d1d3ce256537fe84"
    ap-northeast-2 = "ami-051e5f232fb9e8047"
    ap-southeast-1 = "ami-0af57535c61bc6c30"
    ap-southeast-2 = "ami-0cdb73f24016bdba4"
    ap-northeast-1 = "ami-0ede7fceeb91d9ec4"
    ca-central-1   = "ami-0cf732b7a31e698d4"
    eu-central-1   = "ami-05b3feef6ce4eb779"
    eu-west-1      = "ami-049e7c376b1a39b6e"
    eu-west-2      = "ami-062610ff75716be70"
    eu-west-3      = "ami-07ad717aeb7589448"
    eu-north-1     = "ami-04441fa360060eb3a"
    me-south-1     = "ami-002240bf66e41453e"
    sa-east-1      = "ami-04acf42b911191b07"
  }
}

variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "taskcat"
}

//  Admin HTTPS access port
variable "adminsport" {
  default = "443"
}

variable "bootstrap-fgtvmasg" {
  type    = string
  default = "fgtvmasg.conf"
}

variable "bootstrap-fgtvm" {
  // Change to your own path
  type    = string
  default = "fgtvm.conf"
}

variable "bootstrap-fgtvm2" {
  // Change to your own path
  type    = string
  default = "fgtvm2.conf"
}

// license file for the fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the fgt 2
variable "license2" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license2.lic"
}
