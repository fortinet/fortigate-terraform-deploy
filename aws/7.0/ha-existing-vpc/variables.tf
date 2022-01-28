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
  default = "eu-west-1b"
}

// IAM role that has proper permission for HA
// Refer to https://docs.fortinet.com/vm/aws/fortigate/6.2/aws-cookbook/6.2.0/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE>"
}

variable "vpcid" {
  description = "VPC ID"
  default = "vpc-xxxxx"
}

variable "vpccidr" {
  default = "20.1.0.0/16"
}

variable "publiccidraz1id" {
  description = "Public Subnet 1 AZ1 ID"
  default = "subnet-xxxxx"
}

variable "privatecidraz1id" {
  description = "Private Subnet 1 AZ1 ID"
  default = "subnet-xxxxx"
}

variable "hasynccidraz1id" {
  description = "HASYNC Subnet 1 AZ1 ID"
  default = "subnet-xxxxx"
}

variable "hamgmtcidraz1id" {
  description = "HAMGMT Subnet 1 AZ1 ID"
  default = "subnet-xxxxx"
}

variable "publiccidraz2id" {
  description = "Public Subnet 1 AZ2 ID"
  default = "subnet-xxxxx"
}

variable "privatecidraz2id" {
  description = "Private Subnet 1 AZ2 ID"
  default = "subnet-xxxxx"
}

variable "hasyncidraz2id" {
  description = "HASYNC Subnet 1 AZ2 ID"
  default = "subnet-xxxxx"
}

variable "hamgmtidraz2id" {
  description = "HAMGMT Subnet 1 AZ2 ID"
  default = "subnet-xxxxx"
}

variable "hamgmtcidraz2" {
  default = "20.1.13.0/24"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// AMIs are for FGTVM AWS(PAYG) - 7.0.3
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-014b0761f581d0e9d"
    us-west-1      = "ami-0e6d4eb48ac4956e0"
    us-east-1      = "ami-099e9f57e31ec423c"
    us-east-2      = "ami-0323df31f5a8f8bd2"
    ap-east-1      = "ami-041983c36b6fbbb0d"
    ap-south-1     = "ami-0f56a870791d33ced"
    ap-northeast-3 = "ami-0fb452b72b910d144"
    ap-northeast-2 = "ami-0efc1e91b7ee9407d"
    ap-southeast-1 = "ami-03bc23b66fb984025"
    ap-southeast-2 = "ami-016f1d1cc2bc0dc18"
    ap-northeast-1 = "ami-0d3ae196f89774c27"
    ca-central-1   = "ami-0d42479c46feab8f7"
    eu-central-1   = "ami-0c0d7785bcc656ea4"
    eu-west-1      = "ami-0c149861a0243badc"
    eu-west-2      = "ami-029ffbc3b4ee2ea69"
    eu-south-1     = "ami-0060556a3c2ee8af3"
    eu-west-3      = "ami-0e8f659f310a04c55"
    eu-north-1     = "ami-0fa18afb10d953432"
    me-south-1     = "ami-0800493574bacdca4"
    sa-east-1      = "ami-00d6b0680d26d5f29"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 7.0.3
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-083a0794c27f644cd"
    us-west-1      = "ami-02f74eacda2205a3f"
    us-east-1      = "ami-07ebc2e34d5ce72f4"
    us-east-2      = "ami-056dda2f1e4afb543"
    ap-east-1      = "ami-0311b61685243ba66"
    ap-south-1     = "ami-0a10c8c2f2aaa4ae1"
    ap-northeast-3 = "ami-0f60eaf0461e2136d"
    ap-northeast-2 = "ami-0d20f9116ec8b7b38"
    ap-southeast-1 = "ami-056c0803ff6f6afa5"
    ap-southeast-2 = "ami-0265ba41aa07c3558"
    ap-northeast-1 = "ami-05ac4892f4ee74676"
    ca-central-1   = "ami-00b08287c478c4a98"
    eu-central-1   = "ami-016c74c0462cafba2"
    eu-west-1      = "ami-00844c5dd9a2e4396"
    eu-west-2      = "ami-0ed73511e91ef6e86"
    eu-south-1     = "ami-0295d1b6c0f8b856a"
    eu-west-3      = "ami-061e0f308353b27b1"
    eu-north-1     = "ami-033be08365c1ebed8"
    me-south-1     = "ami-0e5c84edacd14a664"
    sa-east-1      = "ami-07d447912183bc4be"
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
  description = "Active FGT port1 ip address, needs to be same subnet as Public Subnet in AZ1"
  default = "20.1.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  description = "Active FGT port2 ip address, needs to be same subnet as Private Subnet in AZ1"
  default = "20.1.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  description = "Active FGT port3 ip address, needs to be same subnet as HASYNC Subnet in AZ1"
  default = "20.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "activeport4" {
  description = "Active FGT port4 ip address, needs to be same subnet as HAMGMT Subnet in AZ1"
  default = "20.1.3.10"
}

variable "activeport4mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  description = "Passive FGT port1 ip address, needs to be same subnet as Public Subnet in AZ2"
  default = "20.1.10.10"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  description = "Passive FGT port2 ip address, needs to be same subnet as Private Subnet in AZ2"
  default = "20.1.11.10"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  description = "Passive FGT port3 ip address, needs to be same subnet as HASYNC Subnet in AZ2"
  default = "20.1.12.10"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  description = "Passive FGT port4 ip address, needs to be same subnet as HAMGMT Subnet in AZ2"
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

