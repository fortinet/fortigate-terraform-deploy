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

// AMIs for FGTVM-7.6.1
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-015d206cf4d0248c0"
      },
      x86 = {
        byol = "ami-08af434d4f7a67d23"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0e88f00ba85e75d60"
      },
      x86 = {
        byol = "ami-00379d5a1deba1773"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0851e6495ad3a405d"
      },
      x86 = {
        byol = "ami-0f2bd186b60ffdc2f"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0b744cfb916ded4dd"
      },
      x86 = {
        byol = "ami-061dc9e399349b5a5"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-0f71b38cc401b685d"
      },
      x86 = {
        byol = "ami-0f593a212bab92986"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0da484568d0134063"
      },
      x86 = {
        byol = "ami-0b843a15dace180ca"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-088d7dd6e52c17aaf"
      },
      x86 = {
        byol = "ami-05c58c82a0a7b1d45"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-05a3b5f830c5d36f4"
      },
      x86 = {
        byol = "ami-0b15fecb31d798054"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0697ce022c29a2f0a"
      },
      x86 = {
        byol = "ami-04848e4a858c61a2c"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0a459284aca7bd873"
      },
      x86 = {
        byol = "ami-03dbfe66309796971"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-03c1a3ffd4e470e0e"
      },
      x86 = {
        byol = "ami-010cf5073c1d9fa55"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-00161f77cdd45ac44"
      },
      x86 = {
        byol = "ami-0414e8998ef138de7"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0f22e9998e5ba593b"
      },
      x86 = {
        byol = "ami-0ebe5ecbfd0bf7821"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0097c1fc138aa69ba"
      },
      x86 = {
        byol = "ami-0dac030dd3f362225"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0b92dae2e95cfe666"
      },
     x86 = {
        byol = "ami-0b539fd4301b13bd9"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0cc83ec7d19ec55d8"
      },
      x86 = {
        byol = "ami-043e38d0b2fe1b424"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0f70c42cf44cabc5f"
      },
      x86 = {
        byol = "ami-001f3c7653f62014c"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-024f0f49dfb49188c"
      },
      x86 = {
        byol = "ami-0ba75afb849c6acab"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-059314d32be53f7b3"
      },
      x86 = {
        byol = "ami-00e56c7dd9a530a9e"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0969e520ab5d295a0"
      },
      x86 = {
        byol = "ami-098b1172a88f3937c"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0b2380d71a0f2278c"
      },
      x86 = {
        byol = "ami-03eafc3546870d115"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-08005bc6393bc7ba1"
      },
      x86 = {
        byol = "ami-056bcf822545a4817"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0d3d4be66f18007b2"
      },
      x86 = {
        byol = "ami-04e011cc5c8327ff3"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-059a21dc68956c192"
      },
      x86 = {
        byol = "ami-0bc6b4afe7e6f6c71"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0a5a9d97afcb2d7ca"
      },
      x86 = {
        byol = "ami-043ca4b94aba11d35"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-06a81b0d0e7f2b392"
      },
      x86 = {
        byol = "ami-069ae4b787dd51ba3"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0be2a076c8a6db884"
      },
      x86 = {
        byol = "ami-062e4de767375245d"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0ff7dd67d270fb847"
      },
      x86 = {
        byol = "ami-0bf14aeb9991049df"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-06f79574cb34962f5"
      },
      x86 = {
        byol = "ami-0b599ccbf7708fd4a"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-06f666395ac3b7908"
      },
      x86 = {
        byol = "ami-0c83a4becd17d27c8"
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
