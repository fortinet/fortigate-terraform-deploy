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

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, file.
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
// Either arm or x86
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


// AMIs for FGTVM-7.6.7
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-061c6cea1dbc91bbf"
        payg = "ami-0daef082211d5b77e"
      },
      x86 = {
        payg = "ami-0e62f0da2b37d6214"
        byol = "ami-0ee9b44e4ec1bfdc0"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0087ab7b3e70c0157"
        byol = "ami-052b547469cf5c5b9"
      },
      x86 = {
        byol = "ami-002abb0c1a5e36534"
        payg = "ami-058cf596fa0421269"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-01072181889dc2142"
        payg = "ami-0cf88368f7a046af3"
      },
      x86 = {
        byol = "ami-02def78b29c1493dc"
        payg = "ami-0bf8dd3e192b9d296"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-041bc33603ca0f22c"
        byol = "ami-054af3435c841ffcb"
      },
      x86 = {
        payg = "ami-0054ec448fc525d05"
        byol = "ami-0bfe018b23b03115f"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0a0195f64d690b8db"
        byol = "ami-0d0dbd071a5cc4f1b"
      },
      x86 = {
        payg = "ami-027ec0eab5c9ff26c"
        byol = "ami-0df95c014402984ee"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-034bbedf6f41b3500"
        payg = "ami-0f72ddcb3a6bbbdc2"
      },
      x86 = {
        byol = "ami-004ebcb6de62846e9"
        payg = "ami-06455b6ca5ae5c2ba"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-000e3622708f7662b"
        payg = "ami-0206f61ed00bb9f61"
      },
      x86 = {
        payg = "ami-00707fcd3e727532f"
        byol = "ami-01fd6f2e969e9bf87"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-090c6d675f5e73e58"
        payg = "ami-0e1c169015b39cfa7"
      },
      x86 = {
        byol = "ami-098062df796dd3fdd"
        payg = "ami-0e04c84b173481716"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-01a0364907cb53faf"
        byol = "ami-0f8beab3e14825928"
      },
      x86 = {
        byol = "ami-06081b4788006017f"
        payg = "ami-07a0b006b250b393b"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0bad28b6ebd7627eb"
        byol = "ami-0ed3647d8430f38eb"
      },
      x86 = {
        byol = "ami-0451629a1bd0d971e"
        payg = "ami-0a8fb9d197ee75929"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-014b65e14128df96b"
        payg = "ami-0676f839ccff3b251"
      },
      x86 = {
        payg = "ami-060ecf635a17382e3"
        byol = "ami-0fab4fbd350e69b00"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-00d949c94e0ca8991"
        payg = "ami-08c57c79b843b236e"
      },
      x86 = {
        byol = "ami-041d58c8593d02a7c"
        payg = "ami-0a6803404a3e9d59e"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-0824cfd5bf5213b0e"
        byol = "ami-0f592e6ba8dbbd3d2"
      },
      x86 = {
        payg = "ami-0699572b746c5e57b"
        byol = "ami-0d66ada48bb5f6b3a"
      }
    },
    ap-southeast-6 = {
      arm = {
        payg = "ami-042b82b55d6939c9e"
        byol = "ami-0fa74a08e4f5a4921"
      },
      x86 = {
        payg = "ami-0db54aa0aaa735c20"
        byol = "ami-0ffab948d945fa9fe"
      }
    },
    ap-southeast-7 = {
      arm = {
        payg = "ami-09e4907c5a418246b"
        byol = "ami-0aec254d994c6134b"
      },
      x86 = {
        payg = "ami-0e8022dde5b283cbf"
        byol = "ami-0f950be3f245faf2d"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-073846093cb7ef246"
        payg = "ami-0b024ebe98510bd39"
      },
      x86 = {
        byol = "ami-0e0b2ef56e1003e6b"
        payg = "ami-0fb6bf31908199e50"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-055a2fa28f140dc9e"
        byol = "ami-0d00a4335e0fe046e"
      },
      x86 = {
        byol = "ami-08c620242e8615d6b"
        payg = "ami-0c65ce4baab22fd31"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0691f492b8aabed16"
        payg = "ami-0897e485216cd83f1"
      },
      x86 = {
        byol = "ami-08f6b4a95c4dc816b"
        payg = "ami-0ebd6316e41474b30"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-05fb66973a73b5b8d"
        byol = "ami-0f78eaa7f72ee0acb"
      },
      x86 = {
        byol = "ami-043858c596709fe1a"
        payg = "ami-0d2feccf892d860b6"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-05c5fc80582e34607"
        byol = "ami-0f7ca05d25a7df3fc"
      },
      x86 = {
        byol = "ami-0546ad7b7f07f8788"
        payg = "ami-0e46c7d37bd538b89"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-071b74db8c68f2eb3"
        payg = "ami-0b1525e9ef4d10698"
      },
      x86 = {
        payg = "ami-05f708634ca3ff2d4"
        byol = "ami-0d41963bfa1d197e2"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-027073bc80bfd55fe"
        payg = "ami-0e9f6e9c6b8671a2d"
      },
      x86 = {
        byol = "ami-00754d3493eee3efd"
        payg = "ami-02ada2d34605e6615"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-00d9ead721dfaf527"
        byol = "ami-048cf952b69294bb2"
      },
      x86 = {
        payg = "ami-07a4a3570d3117474"
        byol = "ami-0a384d1748bf21e70"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-038cec9a69a5e03d4"
        byol = "ami-087fcf0ff9a5f504d"
      },
      x86 = {
        byol = "ami-0c439ff75a7838a13"
        payg = "ami-0c6bfe978ea534ff3"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-00ab0b4d24f8dacf2"
        payg = "ami-05590ca0786a39b6f"
      },
      x86 = {
        byol = "ami-0afc698fe61d0d7fa"
        payg = "ami-0c4d486d7e7cef158"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0bcf25d178298fd0a"
        byol = "ami-0e3a916cc8de0e90e"
      },
      x86 = {
        byol = "ami-030d7eeff68167332"
        payg = "ami-0581c380ae55b77b9"
      }
    },
    mx-central-1 = {
      arm = {
        payg = "ami-04216e1f1df00c3c4"
        byol = "ami-07d09c5b8df90be41"
      },
      x86 = {
        payg = "ami-00ed9bb428293d6d9"
        byol = "ami-09d3b0f7e95d8bd1a"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-01726ecc6b3510449"
        byol = "ami-0f533b5f844360273"
      },
      x86 = {
        payg = "ami-037d3c88c7ef47320"
        byol = "ami-0ba2f033294524226"
      }
    },
    us-east-1 = {
      arm = {
        payg = "ami-08227f22575dda27d"
        byol = "ami-0938d5f314e1496a5"
      },
      x86 = {
        payg = "ami-0952cc960307ac712"
        byol = "ami-0b10f99ddb71cacda"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-004815935e3a0ec24"
        byol = "ami-07ae0b385479fcff2"
      },
      x86 = {
        payg = "ami-01ce042b8d8c861ad"
        byol = "ami-097289a2e1b0b2b45"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0575e83efe4520dd6"
        byol = "ami-0c64e14ed328b3f19"
      },
      x86 = {
        byol = "ami-03d7def66d7017003"
        payg = "ami-0a6ec2841fdf86019"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0434fb3bf60dc2dba"
        byol = "ami-097e5da546553d170"
      },
      x86 = {
        byol = "ami-058d68276defbe7b5"
        payg = "ami-0d54b65f9858df8ae"
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
