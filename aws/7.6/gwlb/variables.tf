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

// AMIs for FGTVM-7.6.3
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0b9400fd7cd027606"
        byol = "ami-0c09dd0feb39d9abd"
      },
      x86 = {
        payg = "ami-0482366d385444bde"
        byol = "ami-04b6436c754771c43"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-05efc09576373d02c"
        byol = "ami-0be776e948c110282"
      },
      x86 = {
        payg = "ami-0cd3b09301fb8943b"
        byol = "ami-01c5c33c53441eda1"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0c1ed0c15f2416af6"
        byol = "ami-040c3e5da5bf344b9"
      },
      x86 = {
        payg = "ami-062a5df9ad68cac12"
        byol = "ami-0b6678b5416106f71"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-02fd6b851544dc1ed"
        byol = "ami-0861db97c43a8ac23"
      },
      x86 = {
        payg = "ami-0f4edf123dcf4eb29"
        byol = "ami-0e64df3471ecda0d8"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-03209469c14ccfbdb"
        byol = "ami-03f053fef63ce27cd"
      },
      x86 = {
        payg = "ami-0866606e076db7ddd"
        byol = "ami-03f053fef63ce27cd"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0f775875cd9cb64c9"
        byol = "ami-097ae41867caae55f"
      },
      x86 = {
        payg = "ami-06eba6f20ca2150e0"
        byol = "ami-069fa73749473bfef"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-01b9abb1179a9d78d"
        byol = "ami-0a3bdbd87245bb3b4"
      },
      x86 = {
        payg = "ami-06d62e38e4ad740ff"
        byol = "ami-0ff7a402e83f62361"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0a93d35fcf42c292c"
        byol = "ami-00b3f2bd098dec7c7"
      },
      x86 = {
        payg = "ami-09ecd8b90190690e5"
        byol = "ami-07248afe5fabfd8a0"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-02b04c96ff5971f07"
        byol = "ami-03f43e6ed40187ed0"
      },
      x86 = {
        payg = "ami-09f310c3ff58ff312"
        byol = "ami-02a4803d3371022e0"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-045a927b2355112ac"
        byol = "ami-0b807546d6ae17fe0"
      },
      x86 = {
        payg = "ami-0a56bfe19be5777e0"
        byol = "ami-0b78443f541ffeee4"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-066091afffb7feecc"
        byol = "ami-03710d72180981023"
      },
      x86 = {
        payg = "ami-0d89632784fb150c1"
        byol = "ami-0c873b9fb9b9cdcbd"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0fd0a0682b4c14956"
        byol = "ami-0bd9ce5cb2b9aec7e"
      },
      x86 = {
        payg = "ami-08bb510257e266121"
        byol = "ami-02a2535edb6d986f5"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-093b718b919921c3c"
        byol = "ami-0ab195291683ec98b"
      },
      x86 = {
        payg = "ami-0fe2bbb42dea11b71"
        byol = "ami-0d2c049e39e6fa73b"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-06c35d5290376bc55"
        byol = "ami-04a45c547cc57e4d6"
      },
      x86 = {
        payg = "ami-0a034403e4671de87"
        byol = "ami-0e641013b2d5ad44e"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-01acef956b9894896"
        byol = "ami-053def2f0a594d845"
      },
     x86 = {
        payg = "ami-049ea328068a8dce9"
        byol = "ami-0df7e55680542af89"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-07a3f8e0fe0e0a316"
        byol = "ami-0545e0b3e49ae126d"
      },
      x86 = {
        payg = "ami-0d797b8cf92f26ad0"
        byol = "ami-0c78ccf064348ba72"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0f6988e6c8ada2607"
        byol = "ami-0e9fbd9b21b3d4937"
      },
      x86 = {
        payg = "ami-0b84485723cde48d0"
        byol = "ami-0d0fd52611723955c"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0044878e7c318a888"
        byol = "ami-073e1c9ef2f66b59d"
      },
      x86 = {
        payg = "ami-0b27c03302da07e19"
        byol = "ami-0b4e49556a1f60af9"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-08122b676d37485e3"
        byol = "ami-07237c38d889a903d"
      },
      x86 = {
        payg = "ami-078946f0ac9534255"
        byol = "ami-08e61d6cabea25fbb"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0fe05f509b1c09907"
        byol = "ami-0b81d0555730f77ba"
      },
      x86 = {
        payg = "ami-0e8af11eb0c0cdaec"
        byol = "ami-080166d5907d7c542"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0ec3aada017f0c8bc"
        byol = "ami-05aac9a2d7cb6bd8d"
      },
      x86 = {
        payg = "ami-0828f98eff557e99a"
        byol = "ami-024b3b50b88eb4f96"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0240c63e557572d4a"
        byol = "ami-0320f8ef9e27dd916"
      },
      x86 = {
        payg = "ami-0d16006d27bc16818"
        byol = "ami-0a477b484e5019490"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0acb61aba13e1167f"
        byol = "ami-00ee1899649fa02a4"
      },
      x86 = {
        payg = "ami-04db8c598fd0e2808"
        byol = "ami-02ae36e6d3f0da6e9"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-0f91d0c1cfe1c7d0c"
        byol = "ami-0e7f407bf1f96083a"
      },
      x86 = {
        payg = "ami-0be97e53f2f1362f2"
        byol = "ami-0689d57c3ecaa3ee0"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-00e22068c9bae6891"
        byol = "ami-0d8d8557d2d88b046"
      },
      x86 = {
        payg = "ami-040b133e6bf413d99"
        byol = "ami-0004a5bdd3b28dfd5"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-08727dfeade88da58"
        byol = "ami-01e2e3025d01d0f03"
      },
      x86 = {
        payg = "ami-08727dfeade88da58"
        byol = "ami-07b0dd0470a4fb68d"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0be12bfdefadc1b09"
        byol = "ami-0d0b472a983b7a69e"
      },
      x86 = {
        payg = "ami-00b78201f8d2ed17f"
        byol = "ami-02c6126bf4a42ba8f"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-00e22068c9bae6891"
        byol = "ami-0d8d8557d2d88b046"
      },
      x86 = {
        payg = "ami-040b133e6bf413d99"
        byol = "ami-0004a5bdd3b28dfd5"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0578dd29bb8c24015"
        byol = "ami-088d01fa868c7e013"
      },
      x86 = {
        payg = "ami-04eb9fb0c7b124c8a"
        byol = "ami-0c63c4ca7057b102a"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-078572d29c2d166cc"
        byol = "ami-0c63c4ca7057b102a"
      },
      x86 = {
        payg = "ami-0fdd84bb9b4c86c03"
        byol = "ami-0cbe1196d9dfc02b0"
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
