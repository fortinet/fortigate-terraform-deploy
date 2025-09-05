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

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "file"
}

// use s3 bucket for bootstrap
// Either true or false
//
variable "bucket" {
  type    = bool
  default = "false"
}

// instance architect
// Either x86 or arm
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5.xlarge"
}

// AMIs for FGTVM-7.6.4
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      x86 = {
        byol = "ami-0333782d3467101c4"
      }
    },
    ap-east-1 = {
      x86 = {
        byol = "ami-08a630285d04e4fea"
      }
    },
    ap-east-2 = {
      x86 = {
        byol = "ami-006fb279f52241280"
      }
    },
    ap-northeast-1 = {
      x86 = {
        byol = "ami-05da04ba94924394b"
      }
    },
    ap-northeast-2 = {
      x86 = {
        byol = "ami-080a811571020c88d"
      }
    },
    ap-northeast-3 = {
      x86 = {
        byol = "ami-0f2b82184a6f10a5d"
      }
    },
    ap-south-1 = {
      x86 = {
        byol = "ami-068b39f0a99ef7fec"
      }
    },
    ap-south-2 = {
      x86 = {
        byol = "ami-03010041638cc00df"
      }
    },
    ap-southeast-1 = {
      x86 = {
        payg = "ami-025ff5a37daf75d87"
      }
    },
    ap-southeast-2 = {
      x86 = {
        byol = "ami-0db26387d0e8fac3b"
      }
    },
    ap-southeast-3 = {
      x86 = {
        byol = "ami-029ec0592b50556e5"
      }
    },
    ap-southeast-4 = {
      x86 = {
        byol = "ami-0fcf304a3df7333b1"
      }
    },
    ap-southeast-5 = {
      x86 = {
        byol = "ami-060d631aa946be099"
      }
    },
    ap-southeast-7 = {
      x86 = {
        byol = "ami-0de931c0ddaf47b75"
      }
    },
    ca-central-1 = {
      x86 = {
        byol = "ami-069f74f059ba4843e"
      }
    },
    ca-west-1 = {
      x86 = {
        byol = "ami-0f51e38f829f78d30"
      }
    },
    eu-central-1 = {
      x86 = {
        byol = "ami-014e3714647c41e91"
      }
    },
    eu-central-2 = {
      x86 = {
        byol = "ami-0367a61149646468c"
      }
    },
    eu-north-1 = {
      x86 = {
        byol = "ami-0d6bf4561b42efb0a"
      }
    },
    eu-south-1 = {
      x86 = {
        byol = "ami-0892196b4e7722db0"
      }
    },
    eu-south-2 = {
      x86 = {
        byol = "ami-0722e430540644827"
      }
    },
    eu-west-1 = {
      x86 = {
        byol = "ami-0d8777d2d0215419b"
      }
    },
    eu-west-2 = {
      x86 = {
        byol = "ami-0011e5df6a1cc865d"
      }
    },
    eu-west-3 = {
      x86 = {
        byol = "ami-01f4cf7b315c53054"
      }
    },
    il-central-1 = {
      x86 = {
        byol = "ami-0d656be65730ddf69"
      }
    },
    me-central-1 = {
      x86 = {
        byol = "ami-0797e0963e52c12b7"
      }
    },
    me-south-1 = {
      x86 = {
        byol = "ami-01aac3ac4770306a1"
      }
    },
    mx-central-1 = {
      x86 = {
        byol = "ami-0e716cedf64906925"
      }
    },
    sa-east-1 = {
      x86 = {
        byol = "ami-096c27177d35d30e5"
      }
    },
    us-east-1 = {
      x86 = {
        byol = "ami-0b332c0226afc1a6b"
      }
    },
    us-east-2 = {
      x86 = {
        byol = "ami-02ea72889044b0b49"
      }
    },
    us-west-1 = {
      x86 = {
        byol = "ami-0940c420b6fc4a4fc"
      }
    },
    us-west-2 = {
      x86 = {
        byol = "ami-06bac2fe66b8738a2"
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
