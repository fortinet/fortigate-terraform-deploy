//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

variable "az" {
  default = "eu-west-1a"
}

// IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/6.4.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>" //Put in the IAM Role name created
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

// Preshare key for autoscale
variable "presharekey" {
  default = "Test123#"
}

// Load Balancer Listen rules for forwarding the traffic
variable "test_forwarding_config" {
  default = {
    80  = "TCP"
    443 = "TCP"
  }
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "byol"
}

// AMIs are for FGTVM-AWS(PAYG) - 6.4.13
variable "fgtvmami" {
  type = map(any)
  default = {
    us-west-2      = "ami-02c3d0e3485fd9cc3"
    us-west-1      = "ami-06fd9ee9a22819e93"
    us-east-1      = "ami-0d2e1dbd88cb90d88"
    us-east-2      = "ami-0d9e6a6fa5d480dc5"
    ap-east-1      = "ami-0cba1e5dbfd73a65a"
    ap-south-1     = "ami-04bebae4f75a96c7a"
    ap-northeast-3 = "ami-093bcf5d4c68b2b95"
    ap-northeast-2 = "ami-00983410b4f1403ec"
    ap-southeast-1 = "ami-070b1b4eb3d3c60a7"
    ap-southeast-2 = "ami-0e7c05f8a7ada2233"
    ap-northeast-1 = "ami-07f0fc07f2c1aa8f9"
    ca-central-1   = "ami-020d62bd23d0a2ce8"
    eu-central-1   = "ami-0b15328bf5aa72a55"
    eu-west-1      = "ami-0e18979c70f883fc3"
    eu-west-2      = "ami-0edd548310ac8f27c"
    eu-south-1     = "ami-08288b180c501d799"
    eu-west-3      = "ami-0153a514558e966e9"
    eu-north-1     = "ami-0ae9abae3b34a8a94"
    me-south-1     = "ami-098d32f5570aaf072"
    sa-east-1      = "ami-0cf524ba4a55b383e"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 6.4.13
variable "fgtvmbyolami" {
  type = map(any)
  default = {
    us-west-2      = "ami-0bcde649fd65b5581"
    us-west-1      = "ami-0a9343e9bedc1089d"
    us-east-1      = "ami-0619aa306668f1276"
    us-east-2      = "ami-05d7975a2268c0410"
    ap-east-1      = "ami-0242e82447b9d90df"
    ap-south-1     = "ami-08394dd67c3953e8d"
    ap-northeast-3 = "ami-0610288da3b427589"
    ap-northeast-2 = "ami-0b53abe564f5df4f9"
    ap-southeast-1 = "ami-0aed1c4dd82224e5c"
    ap-southeast-2 = "ami-0f1c17f67c91b7599"
    ap-northeast-1 = "ami-000a05d9e840e55d3"
    ca-central-1   = "ami-0d324bc705c412758"
    eu-central-1   = "ami-0c58f79e44e8287e1"
    eu-west-1      = "ami-0f91bbdabb1f08daa"
    eu-west-2      = "ami-02cf48b5215b8bb06"
    eu-south-1     = "ami-0a4bfa45a8136b145"
    eu-west-3      = "ami-03e37a401a4386b47"
    eu-north-1     = "ami-0e66a66b02f3ba5d9"
    me-south-1     = "ami-07c1887b27f18a833"
    sa-east-1      = "ami-0a7d42e30b5b4b096"
  }
}

variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH Key>"
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

