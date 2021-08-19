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

// AMIs are for FGTVM-AWS(PAYG) - 7.0.1
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-0450a759578d5f9e8"
    us-west-1      = "ami-0bed74e557899b316"
    us-east-1      = "ami-0b9c648555f605b8a"
    us-east-2      = "ami-048fa209a6f531c8e"
    ap-east-1      = "ami-0ba7332b78dedfdf0"
    ap-south-1     = "ami-0f8da603aeae144f0"
    ap-northeast-2 = "ami-0d90068740a70e960"
    ap-southeast-1 = "ami-0aa8b7bcf2a04ad1f"
    ap-southeast-2 = "ami-0793fa38bb58f353e"
    ap-northeast-1 = "ami-0e45541bf4f626eb8"
    ca-central-1   = "ami-0e92233e968a00d5a"
    eu-central-1   = "ami-0c48bc0e23f9042fc"
    eu-west-1      = "ami-066f47e167e4090e0"
    eu-west-2      = "ami-073e93d6afc52ee0e"
    eu-west-3      = "ami-07a5212e5d2fee5ed"
    eu-north-1     = "ami-0f21240140d3d2866"
    me-south-1     = "ami-0694965772c0df593"
    sa-east-1      = "ami-0c80c01c54651d66e"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 7.0.1
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-0070ab4edc735c379"
    us-west-1      = "ami-09e5387cc293153c1"
    us-east-1      = "ami-02678839ab63d47a1"
    us-east-2      = "ami-01fc50db5a27388fa"
    ap-east-1      = "ami-069022a0b0042e2b8"
    ap-south-1     = "ami-00609a13c17b3cf5d"
    ap-northeast-2 = "ami-0a0e4c41637e6936f"
    ap-southeast-1 = "ami-0d9a129903b7ba964"
    ap-southeast-2 = "ami-0b9ef7623fc628069"
    ap-northeast-1 = "ami-0bfb0a297a846758d"
    ca-central-1   = "ami-0f5966c7ff86c1cb6"
    eu-central-1   = "ami-09ca8648996694d40"
    eu-west-1      = "ami-01118ca5692326739"
    eu-west-2      = "ami-073e5153688b42f25"
    eu-west-3      = "ami-00e8ba0a04789ad0e"
    eu-north-1     = "ami-0907f64a7bbfb94ff"
    me-south-1     = "ami-098b025df177bd3d4"
    sa-east-1      = "ami-01abe8a3a6cd165e7"
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

