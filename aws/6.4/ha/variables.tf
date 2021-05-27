//AWS Configuration
variable access_key {}
variable secret_key {}

variable "region" {
  default = "eu-west-1"
}

// Availability zone 1 for the region
variable "az1" {
  default = "eu-west-1a"
}

// Availability zone 2 for the region
variable "az2" {
  default = "eu-west-1c"
}

// IAM role that has proper permission for HA
// Refer to https://docs.fortinet.com/vm/aws/fortigate/6.2/aws-cookbook/6.2.0/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE>"
}

variable "vpccidr" {
  default = "20.1.0.0/16"
}

variable "publiccidraz1" {
  default = "20.1.0.0/24"
}

variable "privatecidraz1" {
  default = "20.1.1.0/24"
}

variable "hasynccidraz1" {
  default = "20.1.2.0/24"
}

variable "hamgmtcidraz1" {
  default = "20.1.3.0/24"
}

variable "publiccidraz2" {
  default = "20.1.10.0/24"
}

variable "privatecidraz2" {
  default = "20.1.11.0/24"
}

variable "hasynccidraz2" {
  default = "20.1.12.0/24"
}

variable "hamgmtcidraz2" {
  default = "20.1.13.0/24"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default     = "payg"
}

// AMIs are for FGTVM-AWS(PAYG) - 6.4.5
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-0bd63e9b6f030819a"
    us-west-1      = "ami-0109010188b5b573b"
    us-east-1      = "ami-08ea233f6c1af5e84"
    us-east-2      = "ami-04c250698411252c9"
    ap-east-1      = "ami-0f86b4d9e4042517c"
    ap-south-1     = "ami-02623434e90a4eb94"
    ap-northeast-3 = "ami-0dad396c8a078d79a"
    ap-northeast-2 = "ami-09e9c92b84ea58aaf"
    ap-southeast-1 = "ami-086e03d1b2585d1d8"
    ap-southeast-2 = "ami-097983da0f89a0165"
    ap-northeast-1 = "ami-03d14586c97618b09"
    ca-central-1   = "ami-09cd0ee65f8a7cbd6"
    eu-central-1   = "ami-0479cc1e690725514"
    eu-west-1      = "ami-04acaa2b439d0ab7a"
    eu-west-2      = "ami-00f80eeec7920b5ab"
    eu-south-1     = "ami-001b7d48c8f37d191"
    eu-west-3      = "ami-0105ba9c9d7df062e"
    eu-north-1     = "ami-05472a2645b39adce"
    me-south-1     = "ami-037ce9c4a95c5a335"
    sa-east-1      = "ami-025e01b791a5b0bd6"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 6.4.5
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-093c91ef5edce49a6"
    us-west-1      = "ami-0abf93087b8b6039c"
    us-east-1      = "ami-07e907b5ae3b6ad27"
    us-east-2      = "ami-0369456bca7679c37"
    ap-east-1      = "ami-0607c244f54cebd77"
    ap-south-1     = "ami-0ab141906704f2a51"
    ap-northeast-3 = "ami-0fa22d36cbb805b1d"
    ap-northeast-2 = "ami-036c90e71abd027ba"
    ap-southeast-1 = "ami-0cd6daf941ce15238"
    ap-southeast-2 = "ami-05fcd1eda54018e13"
    ap-northeast-1 = "ami-0b8771d8318131ea0"
    ca-central-1   = "ami-0c4cecd2e2f91c577"
    eu-central-1   = "ami-0e3b4279c34108da8"
    eu-west-1      = "ami-0c3fd9d2d765f52d7"
    eu-west-2      = "ami-01e98c30685d313a9"
    eu-south-1     = "ami-01c4700850d722eef"
    eu-west-3      = "ami-05fb5ba112997f4c4"
    eu-north-1     = "ami-0d2ff02042bdbaa74"
    me-south-1     = "ami-001a8c09bb54d3afc"
    sa-east-1      = "ami-09fe162de6d31c4de"
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
  default = "20.1.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "20.1.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  default = "20.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "activeport4" {
  default = "20.1.3.10"
}

variable "activeport4mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  default = "20.1.10.10"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  default = "20.1.11.10"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  default = "20.1.12.10"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  default = "20.1.13.10"
}

variable "passiveport4mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "20.1.0.1"
}

variable "activeport2gateway" {
  default = "20.1.1.1"
}

variable "activeport4gateway" {
  default = "20.1.3.1"
}

variable "passiveport1gateway" {
  default = "20.1.10.1"
}

variable "passiveport2gateway" {
  default = "20.1.11.1"
}

variable "passiveport4gateway" {
  default = "20.1.13.1"
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

