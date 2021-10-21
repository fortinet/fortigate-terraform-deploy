//AWS Configuration
variable access_key {}
variable secret_key {}

variable "region" {
  default = "eu-west-1"
}

// Availability zones for the region
variable "az1" {
  default = "eu-west-1a"
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


// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default     = "byol"
}

// AMIs are for FGTVM-AWS(PAYG) - 7.0.2
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-0e569295bb3f6ab11"
    us-west-1      = "ami-095959eb30adfa9a3"
    us-east-1      = "ami-0f37125f0c38e8ea8"
    us-east-2      = "ami-06793c2af5608535d"
    ap-east-1      = "ami-0699af54b4633491a"
    ap-south-1     = "ami-0a127f57954a4a1f2"
    ap-northeast-3 = "ami-09ad17171ea4eff8d"
    ap-northeast-2 = "ami-0d3c494bb99d82447"
    ap-southeast-1 = "ami-00112697759f99d8d"
    ap-southeast-2 = "ami-07452c768a8cbed39"
    ap-northeast-1 = "ami-03e8c6e055020dd9b"
    ca-central-1   = "ami-0ede51ef40cee3efa"
    eu-central-1   = "ami-07e1b42208e73e245"
    eu-west-1      = "ami-0fab4ac7da7ff40e7"
    eu-west-2      = "ami-0c061b51af9e9b077"
    eu-south-1     = "ami-0cb93c71083b7dae7"
    eu-west-3      = "ami-0fdfb85a314198974"
    eu-north-1     = "ami-03107d291accd5ea4"
    me-south-1     = "ami-0ad2dfcb40065e84a"
    sa-east-1      = "ami-03dde0d83f69a5982"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 7.0.2
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-05558fc4d58e0311d"
    us-west-1      = "ami-02b8386b83b22a768"
    us-east-1      = "ami-03b05077372374ac2"
    us-east-2      = "ami-0d64f9d41d2c347fe"
    ap-east-1      = "ami-0aebd5b952425a493"
    ap-south-1     = "ami-015b6108d837a11bb"
    ap-northeast-3 = "ami-09eabd6630c92b02f"
    ap-northeast-2 = "ami-0575bff848509c6d8"
    ap-southeast-1 = "ami-0c36d980e164c3372"
    ap-southeast-2 = "ami-06217cfb67db81bd7"
    ap-northeast-1 = "ami-046d2f9510157fe5a"
    ca-central-1   = "ami-014a19c8175403554"
    eu-central-1   = "ami-090da6c908c1127f6"
    eu-west-1      = "ami-082aa757173803c84"
    eu-west-2      = "ami-0ab723f14117aa285"
    eu-south-1     = "ami-0472705b9d0a4e155"
    eu-west-3      = "ami-0b4e3a514d31d3a79"
    eu-north-1     = "ami-0a48ff95e49c70174"
    me-south-1     = "ami-03a43777cd244fca4"
    sa-east-1      = "ami-094f94451eda5df8b"
  }
}



variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY>"
}

variable "adminsport" {
  default = "8443"
}

variable "bootstrap-fgtvm" {
  // Change to your own path
  type    = string
  default = "fgtvm.conf"
}


// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}
