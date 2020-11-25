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
  default = "<AWS IAM Role>"
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
  default     = "payg"
}


// AMIs are for FGTVM-AWS(PAYG) - 6.4.3
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-0ddbc0e996e124572"
    us-west-1      = "ami-01d7f9197c106f3b4"
    us-east-1      = "ami-0c184c594e9203c45"
    us-east-2      = "ami-0fcf6b58d6d82a53f"
    ap-east-1      = "ami-06a747a157d4b78ec"
    ap-south-1     = "ami-0afa25566526b5c3a"
    ap-northeast-2 = "ami-05eb0d45254a7a0ce"
    ap-southeast-1 = "ami-0015dc48d24804323"
    ap-southeast-2 = "ami-04b5dda77d0a5c9e7"
    ap-northeast-1 = "ami-05bd4d10b85a28745"
    ca-central-1   = "ami-0224f468fd52b1b28"
    eu-central-1   = "ami-0046e253de29782f4"
    eu-west-1      = "ami-00d3e7b592e7b9c73"
    eu-west-2      = "ami-08b2373c2c6e94882"
    eu-west-3      = "ami-0965b5ec92e30ebd4"
    eu-north-1     = "ami-041765016e33a5496"
    me-south-1     = "ami-0ba296ca31432a756"
    sa-east-1      = "ami-07ca8d72b427216b4"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 6.4.3
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-073592d096f2699ad"
    us-west-1      = "ami-0717fc4ad21d83d92"
    us-east-1      = "ami-056b8cbed90f235f7"
    us-east-2      = "ami-0fa6c260237788eb1"
    ap-east-1      = "ami-08de303af09fb2ba5"
    ap-south-1     = "ami-01fe3471c95b0bd8d"
    ap-northeast-2 = "ami-0741cc6aa50ee2f15"
    ap-southeast-1 = "ami-0066ff4bb5b3beb87"
    ap-southeast-2 = "ami-041c504cef8087823"
    ap-northeast-1 = "ami-0ed1410fa91b8fe63"
    ca-central-1   = "ami-00e3f08f2797559b4"
    eu-central-1   = "ami-09df5f66c63f3af7b"
    eu-west-1      = "ami-0a14533f2a9dcad5f"
    eu-west-2      = "ami-0079c171f690bd729"
    eu-west-3      = "ami-033da5aa41d3d6710"
    eu-north-1     = "ami-08dbc6001d5d8d9e1"
    me-south-1     = "ami-0042f1e48c7a55a75"
    sa-east-1      = "ami-086b55d007b3f2cf0"
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

