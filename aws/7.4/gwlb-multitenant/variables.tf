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

// AMIs for FGTVM-7.4.8
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-0784a2ccadf39fc61"
      },
      x86 = {
        byol = "ami-0923e9b937688b139"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-00ae67945593ee5f6"
      },
      x86 = {
        byol = "ami-05ae611f07c237ed5"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-015fcc34a5bc77203"
      },
      x86 = {
        byol = "ami-0d3740df0035919ac"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0117edb18e04c48be"
      },
      x86 = {
        byol = "ami-0d0e2926dfec0f08e"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-015fc28dc2345dc23"
      },
      x86 = {
        byol = "ami-0c6c7e738ff7cfd28"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0b1ec160ec52916bc"
      },
      x86 = {
        byol = "ami-036b8c87adeb61515"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0bcabf0b2d4166c0b"
      },
      x86 = {
        byol = "ami-064be2a1fa65643d0"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0630a9009f8df888e"
      },
      x86 = {
        byol = "ami-0c20fe334e191c30e"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-033971168ba769a1f"
      },
      x86 = {
        byol = "ami-02362feb1b46dec65"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0e492f154abeb1648"
      },
      x86 = {
        byol = "ami-0554fc7c507a6ed1b"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0fe5dbe5a6cf983c5"
      },
      x86 = {
        byol = "ami-0197f41bcb758812c"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-07378175c93817199"
      },
      x86 = {
        byol = "ami-087b2eaeea280a72d"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-00043510fab2a0da3"
      },
      x86 = {
        byol = "ami-01e6d2182fe3a144a"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0eee8884afac7d8b2"
      },
      x86 = {
        byol = "ami-0070448690bbd8fca"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-082e5ae6f5e7f64ea"
      },
      x86 = {
        byol = "ami-06d6547fc9378763b"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0dcbf03afd622e7ad"
      },
      x86 = {
        byol = "ami-0924b345681953214"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-03e5b42faffe63285"
      },
      x86 = {
        byol = "ami-0717e2aeb1bde3515"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-098b1d7b70c66b8ec"
      },
      x86 = {
        byol = "ami-0cebcd86553102f21"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-09335d07b448c5969"
      },
      x86 = {
        byol = "ami-07dbe0f8d94f6bb10"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0867d7d6d027c612c"
      },
      x86 = {
        byol = "ami-044c1b05808077c4d"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0530b9becdf81dd9d"
      },
      x86 = {
        byol = "ami-0060659f4d03dd705"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-059712066c61d8c18"
      },
      x86 = {
        byol = "ami-0b91841d64b14f2f3"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-05384ab4fed8983cd"
      },
      x86 = {
        byol = "ami-089010848aa96d33d"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0d8f1e5ed529ae00a"
      },
      x86 = {
        byol = "ami-00360d24857d65646"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0bb7209d6f5639798"
      },
      x86 = {
        byol = "ami-0f2123a7f310e61b1"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0bb7209d6f5639798"
      },
      x86 = {
        byol = "ami-0f2123a7f310e61b1"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0447a9ef6e441760a"
      },
      x86 = {
        byol = "ami-00135bc71d066e4e9"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-06d873373ee2ee993"
      },
      x86 = {
        byol = "ami-04a52dcc54e48c46a"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0a9aa83a0f7a5c1be"
      },
      x86 = {
        byol = "ami-0e3acfe60c4182a19"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0fdd1d41c65a04129"
      },
      x86 = {
        byol = "ami-009547c21c2c66fd3"
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
