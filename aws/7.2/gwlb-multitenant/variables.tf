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
  default = "21.1.0.0/16"
}

variable "cs2publiccidraz1" {
  default = "21.1.0.0/24"
}

variable "cs2privatecidraz1" {
  default = "21.1.1.0/24"
}


variable "cs2publiccidraz2" {
  default = "21.1.2.0/24"
}

variable "cs2privatecidraz2" {
  default = "21.1.3.0/24"
}


// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, byol.
variable "license_type" {
  default = "byol"
}

// instance architect
// Either x86
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}


// AMIs for FGTVM-7.2.2
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      x86 = {
        byol = "ami-0b3319db6548e6ba9"
      }
    },
    us-east-2 = {
      x86 = {
        byol = "ami-06a058dbebecb20ba"
      }
    },
    us-west-1 = {
     x86 = {
        byol = "ami-088f6e6cd7e2d1e80"
      }
    },
    us-west-2 = {
     x86 = {
        byol = "ami-0eaa5af24f037c62f"
      }
    },
    af-south-1 = {
     x86 = {
        byol = "ami-01218edaf747f9d1d"
      }
    },
    ap-east-1 = {
     x86 = {
        byol = "ami-07364323dc297ad03"
      }
    },
    ap-southeast-3 = {
     x86 = {
        byol = "ami-07eea7e44e4ffccbb"
      }
    },
    ap-south-1 = {
     x86 = {
        byol = "ami-0209d99105fdb7698"
      }
    },
    ap-northeast-3 = {
     x86 = {
        byol = "ami-069b0c703ea29d83e"
      }
    },
    ap-northeast-2 = {
     x86 = {
        byol = "ami-0b70c933cd19ea860"
      }
    },
    ap-southeast-1 = {
     x86 = {
        byol = "ami-0fd47fb54f2930d82"
      }
    },
    ap-southeast-2 = {
     x86 = {
        byol = "ami-0eb58e93476e4cc4d"
      }
    },
    ap-northeast-1 = {
     x86 = {
        byol = "ami-08092592378d8d6ec"
      }
    },
    ca-central-1 = {
     x86 = {
        byol = "ami-056f5286aafab5205"
      }
    },
    eu-central-1 = {
     x86 = {
        byol = "ami-037f93ac7ef8ce5bd"
      }
    },
    eu-west-1 = {
     x86 = {
        byol = "ami-0b7c2f464c014fcf8"
      }
    },
    eu-west-2 = {
     x86 = {
        byol = "ami-058b5a72d11f1d273"
      }
    },
    eu-south-1 = {
     x86 = {
        byol = "ami-03e98ed7e18e42a0b"
      }
    },
    eu-west-3 = {
     x86 = {
        byol = "ami-02c432f95b9fd7751"
      }
    },
    eu-north-1 = {
     x86 = {
        byol = "ami-068d7475d3b1be847"
      }
    },
    me-south-1 = {
     x86 = {
        byol = "ami-070a27dae920ae9b0"
      }
    },
    sa-east-1 = {
     x86 = {
        byol = "ami-06b457a922e700066"
      }
    }
  }
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

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}
