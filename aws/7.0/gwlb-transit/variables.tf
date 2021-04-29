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

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-0bcde5f20befaef29"
    us-west-1      = "ami-0d47e4065bc75afd0"
    us-east-1      = "ami-01a54d044634cf0f6"
    us-east-2      = "ami-03ab0acba901bbec4"
    ap-east-1      = "ami-02148e751d8ce6c1d"
    ap-south-1     = "ami-07def664c3a7d57b8"
    ap-northeast-2 = "ami-040206dd95f5dae4d"
    ap-southeast-1 = "ami-0bec3fa7b49492202"
    ap-southeast-2 = "ami-0a7013c7c28f2c667"
    ap-northeast-1 = "ami-0c549c1d962b7cc28"
    ca-central-1   = "ami-02d3b40ce0f2be79e"
    eu-central-1   = "ami-07a164a40b3fab627"
    eu-west-1      = "ami-0fcd573f69714ed57"
    eu-west-2      = "ami-0deb30f490c8dd07f"
    eu-west-3      = "ami-0d16a8df07a13375d"
    eu-north-1     = "ami-091492883a1e4e2b6"
    me-south-1     = "ami-04a68927aa0cc21ab"
    sa-east-1      = "ami-01ab2ddf70adbae51"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 7.0.0
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-06001decb1cc65300"
    us-west-1      = "ami-01c16bdc91332f7ab"
    us-east-1      = "ami-0eb86d725cdceaebc"
    us-east-2      = "ami-04e4d720d31e93509"
    ap-east-1      = "ami-04c86a4d790dfc955"
    ap-south-1     = "ami-005f774c3443d956e"
    ap-northeast-2 = "ami-00eda4a12b5e6abf3"
    ap-southeast-1 = "ami-0bc23aee33e9c0b6c"
    ap-southeast-2 = "ami-0241253d4175098df"
    ap-northeast-1 = "ami-0656212a93166e13f"
    ca-central-1   = "ami-00f4cf5a2ec67f01a"
    eu-central-1   = "ami-0fbc69c41159026cd"
    eu-west-1      = "ami-05cd458dd16b40fc8"
    eu-west-2      = "ami-06d26c9c2b173184d"
    eu-west-3      = "ami-0d25245082df1074a"
    eu-north-1     = "ami-0cfc06894012624ab"
    me-south-1     = "ami-051f14f36368e32ed"
    sa-east-1      = "ami-089b5807bf62919a0"
  }
}

variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY>"
}

//  Admin HTTPS access port
variable "adminsport" {
  default = "443"
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
