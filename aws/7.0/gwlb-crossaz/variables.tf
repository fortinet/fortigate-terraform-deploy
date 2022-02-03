//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

// Availability zones for the region
variable "az1" {
  default = "eu-west-1a"
}

variable "az2" {
  default = "eu-west-1b"
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

variable "publiccidraz2" {
  default = "10.1.2.0/24"
}

variable "privatecidraz2" {
  default = "10.1.3.0/24"
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



// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// AMIs are for FGTVM AWS(PAYG) - 7.0.3
variable "fgtvmami" {
  type = map(any)
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
  type = map(any)
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

//  Admin HTTPS access port
variable "adminsport" {
  default = "443"
}

variable "bootstrap-fgtvm" {
  // Change to your own path
  type    = string
  default = "fgtvm.conf"
}

// license file for the fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the fgt
variable "license2" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license2.lic"
}
