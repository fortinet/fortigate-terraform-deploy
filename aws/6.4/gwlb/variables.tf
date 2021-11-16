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
  default = "byol"
}

// AMIs are for FGTVM-AWS(PAYG) - 6.4.7
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-0a56e818a46c63c91"
    us-west-1      = "ami-0ba8bcbaa9804c553"
    us-east-1      = "ami-0d480c4d334beff0e"
    us-east-2      = "ami-0d5333f9359d76a8e"
    ap-east-1      = "ami-0528a929e41968c90"
    ap-south-1     = "ami-03f7a76c1380c7ad6"
    ap-northeast-3 = "ami-02a07846a621a69d9"
    ap-northeast-2 = "ami-016b91e562c386569"
    ap-southeast-1 = "ami-04b14fc559454956a"
    ap-southeast-2 = "ami-0021afae0133c1009"
    ap-northeast-1 = "ami-03323ffab431a051a"
    ca-central-1   = "ami-065842c41b73e0197"
    eu-central-1   = "ami-0026cf2f0ab64b87b"
    eu-west-1      = "ami-0d853ba436dc8fc01"
    eu-west-2      = "ami-0f7055c9365eae6f4"
    eu-south-1     = "ami-048355214147aa2d1"
    eu-west-3      = "ami-03432560a8dfbb4f7"
    eu-north-1     = "ami-0f5b9a3a22260ebf1"
    me-south-1     = "ami-0da8469b3b9eb7afa"
    sa-east-1      = "ami-089cad2a7a4d3501e"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 6.4.7
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-0e08f3fe74ba7e859"
    us-west-1      = "ami-0baabe133544a64f0"
    us-east-1      = "ami-065f5f3d485c1ec3f"
    us-east-2      = "ami-044959ac92cbb585b"
    ap-east-1      = "ami-0d29fd65fc50a0a68"
    ap-south-1     = "ami-071e11bc680d59725"
    ap-northeast-3 = "ami-062467bb168cb7641"
    ap-northeast-2 = "ami-036c495952ea228f8"
    ap-southeast-1 = "ami-0d6b93a8ed23875f8"
    ap-southeast-2 = "ami-07c25feff0b1d73cb"
    ap-northeast-1 = "ami-05f22289eae68a667"
    ca-central-1   = "ami-02bedc73195b4f137"
    eu-central-1   = "ami-0c971b652ecda772d"
    eu-west-1      = "ami-0e360533772060fd1"
    eu-west-2      = "ami-0df08d256789f9289"
    eu-south-1     = "ami-004cf59a5f497ff89"
    eu-west-3      = "ami-09a295993c0c918b3"
    eu-north-1     = "ami-0033cfa8c85af242f"
    me-south-1     = "ami-0705cf1da677bd2e9"
    sa-east-1      = "ami-0aecd7b1537bcbf91"
  }
}

variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS
variable "keyname" {
  default = "<AWS SSH Key>"
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

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}
