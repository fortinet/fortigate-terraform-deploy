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

// AMIs for FGTVM-7.6.0
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-0e1b088dc9b1d440b"
      },
      x86 = {
        byol = "ami-0337ef068426bf493"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-00208c4e97bd077be"
      },
      x86 = {
        byol = "ami-0102b7b136ffb414f"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-004ecebd3b1c8b36b"
      },
      x86 = {
        byol = "ami-004ecebd3b1c8b36b"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-07e6523e7b4fd3bc8"
      },
      x86 = {
        byol = "ami-0c732b364a291db35"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-083d6f8bb92eceee6"
      },
      x86 = {
        byol = "ami-0f1dc9e045374688a"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0d2c5dbb45a9c101d"
      },
      x86 = {
        byol = "ami-0b25539c461118c9d"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-036d06e610b9291e5"
      },
      x86 = {
        byol = "ami-09fe72340bb5dab1c"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-03291e5b0b4635029"
      },
      x86 = {
        byol = "ami-0fbb9838a8d140a68"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-08affe4343719a53a"
      },
      x86 = {
        byol = "ami-07ed12b4355247eee"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-04be38cbc9ce583b7"
      },
      x86 = {
        byol = "ami-0142e4c6b1a46e8d3"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-0ccc52988e402af00"
      },
      x86 = {
        byol = "ami-05d883dbc4e4aa694"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0c9fdd47fb5b14e5e"
      },
      x86 = {
        byol = "ami-00a88f9c51bf074e4"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-04990bfeecdcc6ab0"
      },
      x86 = {
        byol = "ami-007e33ac560c55144"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-07192d3458cf51a0e"
      },
      x86 = {
        byol = "ami-07dfe4c56d45564e5"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-006bada376b5cd572"
      },
      x86 = {
        byol = "ami-01610d30e07cb80b2"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0c321e3eb69b366d8"
      },
      x86 = {
        byol = "ami-0b09782abdf7b5f4e"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-012b6231b2a9e7d99"
      },
      x86 = {
        byol = "ami-073419585fab4fc59"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0275d6d39c0535079"
      },
      x86 = {
        byol = "ami-0267504a99068558b"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0f4964b5f55bbfff2"
      },
      x86 = {
        byol = "ami-0df64208c8337c011"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-012314c25640e1423"
      },
      x86 = {
        byol = "ami-03b2e272c139e733f"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0c34380e6f9325500"
      },
      x86 = {
        byol = "ami-02b25623c3c519ccb"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0304e8eac2d36d476"
      },
      x86 = {
        byol = "ami-06309b5534966541c"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-06e1b2d75553beed5"
      },
      x86 = {
        byol = "ami-0a18b17b6a121f86d"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-028f49522a0843eb1"
      },
      x86 = {
        byol = "ami-0e76c5d757234efb5"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-08a9e7c3e3f00b3b9"
      },
      x86 = {
        byol = "ami-005d69f65381be87e"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-02eed2206da299277"
      },
      x86 = {
        byol = "ami-02ca824d60ca023d1"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-02e5c81e4591747ab"
      },
      x86 = {
        byol = "ami-0b8b98bda12015b59"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0190a0f6c859b25b1"
      },
      x86 = {
        byol = "ami-06fa1fb94240c3fae"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0b2c7d36334ae5a67"
      },
      x86 = {
        byol = "ami-07ef1f07da7e6bb70"
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
