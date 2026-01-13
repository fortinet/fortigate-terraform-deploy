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

// AMIs for FGTVM-7.6.5
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-05b751428e646c4fd"
      },
      x86 = {
        byol = "ami-09ac3417587185809"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-082ac0a9b8fb1f108"
      },
      x86 = {
        byol = "ami-04e537a07e0ac2927"
      }
    },
    ap-east-2 = {
      x86 = {
        byol = "ami-04070b132232de018"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0089619b381040985"
      },
      x86 = {
        byol = "ami-0a9835675dd41659b"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-009047740271a1179"
      },
      x86 = {
        byol = "ami-0cf2cabb25e2a529c"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-04bbff08c8e5135bd"
      },
      x86 = {
        byol = "ami-010b25d92ef70b375"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0f194bbaa55a66905"
      },
      x86 = {
        byol = "ami-06df4de7e16fc019b"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0f0a38d904107b063"
      },
      x86 = {
        byol = "ami-020cb803147409b14"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0e71c8e2617e02f79"
      },
      x86 = {
        byol = "ami-004187244eeae5e06"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-00da3a839a3dd2943"
      },
      x86 = {
        byol = "ami-0b1f2d4a19bc46f44"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0387e8c0cf2ac3338"
      },
      x86 = {
        byol = "ami-0cc22d5185f4ec734"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-091135b73dce0b9bf"
      },
      x86 = {
        byol = "ami-050574e1d8131f535"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-018fefc0504d048d0"
      },
      x86 = {
        byol = "ami-00c771c30bd2c5c59"
      }
    },
    ap-southeast-6 = {
      x86 = {
        byol = "ami-0a461da3bb724620d"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-02b7e5055cf2297c9"
      },
      x86 = {
        byol = "ami-07f6cb18cc52e3b00"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0259cb582f5f5e717"
      },
      x86 = {
        byol = "ami-0dac9c950711eeea5"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-05dcb790ff206a02e"
      },
      x86 = {
        byol = "ami-044161a9861bb34a3"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0528bd38b9c512266"
      },
      x86 = {
        byol = "ami-08c84542e9fa60d2c"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0d87bcac0be8eafb0"
      },
      x86 = {
        byol = "ami-09ca25fb4916b2f25"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-03e4fb16fdef4cde6"
      },
      x86 = {
        byol = "ami-0ab0926e453ce2e7f"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0848e49792d27cfe4"
      },
      x86 = {
        byol = "ami-084616152d2c86d79"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-002fa28b31a4c7ffb"
      },
      x86 = {
        byol = "ami-0f718a2f39f03e965"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0eb810a51a8401e04"
      },
      x86 = {
        byol = "ami-0835220c7b65fd43e"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0fef03e76f7209f8f"
      },
      x86 = {
        byol = "ami-04230ae3fbe976ea6"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-07ca849c0513439e9"
      },
      x86 = {
        byol = "ami-0a53b3629d9030e43"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-018cfb0eb3ae7b3d5"
      },
      x86 = {
        byol = "ami-051180ec04e007b80"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0a129a870dfc14e94"
      },
      x86 = {
        byol = "ami-0d3dbd38648bb2c50"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-08fe02fcde5b5e734"
      },
      x86 = {
        byol = "ami-000ad40ae89c1cc19"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-0d04617a2d7ae8ac6"
      },
      x86 = {
        byol = "ami-06a2ab0837903da3b"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0f256336d7dc8ada1"
      },
      x86 = {
        byol = "ami-0e5c3e64c5e55ed60"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-058f3a672e5fea6e3"
      },
      x86 = {
        byol = "ami-0a4add777dfc8ab6c"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0d56f3c9731a4123f"
      },
      x86 = {
        byol = "ami-022fc4a3e086c890e"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-07ae666072110cc30"
      },
      x86 = {
        byol = "ami-0e95da8848c7cb7ba"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-017c4f833100433d7"
      },
      x86 = {
        byol = "ami-0c321ed1d6381e943"
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
