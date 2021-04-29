//AWS Configuration
variable access_key {}
variable secret_key {}

variable "region" {
  default = "eu-west-1"
}

variable "az" {
  default = "eu-west-1a"
}
// IAM role that has proper permission for HA
// Refer to https://docs.fortinet.com/vm/aws/fortigate/6.2/aws-cookbook/6.2.0/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE>"
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

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "byol"
}

// AMIs are for FGTVM-AWS(PAYG) - 7.0.0
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

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the passive fgt
variable "license2" {
  // Change to your own byol license file, license2.lic
  type    = string
  default = "license2.lic"
}

