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
  default = "payg"
}

// instance architect
// Either arm or x86
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.0.11
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-05f37d81e626b9398"
        byol = "ami-0d2dfae9972be5c1e"
      },
      x86 = {
        payg = "ami-020544bd05fd20445"
        byol = "ami-068e6f045bdc827da"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0c0a9a2c7f668a648"
        byol = "ami-066d72dd2bb3b2743"
      },
      x86 = {
        payg = "ami-013b7ba1232b1c0d8"
        byol = "ami-0fa39f13cb96dd5a6"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-00c140b0ff7cef592"
        byol = "ami-0f53286b1f82468b8"
      },
      x86 = {
        payg = "ami-09ba15a8708a68cdd"
        byol = "ami-0311ef7f65656e718"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-04072b76fc3d4d93d"
        byol = "ami-07d5d2a810a275219"
      },
      x86 = {
        payg = "ami-0f21814b99141495b"
        byol = "ami-02fc5bffd63b50f6c"
      }
    },
    af-south-1 = {
     arm = {
        payg = "ami-09b4309d113bada73"
        byol = "ami-07bdff749bba81eaa"
     },
     x86 = {
        payg = "ami-0eb46b25a3afa0655"
        byol = "ami-043dc9056ac53aa92"
     }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-02b4e495b60bfed9f"
        byol = "ami-0f6239b28b57181a0"
      },
      x86 = {
        payg = "ami-08d55dd10f64cc0ea"
        byol = "ami-0b8ca7cb4503a368c"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-06d9fc089fdbd79c7"
        byol = "ami-0087935262033cec1"
      },
      x86 = {
        payg = "ami-0ae93c863e314d051"
        byol = "ami-0b6e49c17b9beb1ac"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0bbb7cdc414ce72b6"
        byol = "ami-07ce4ff93f8e1eb82"
      },
      x86 = {
        payg = "ami-0919abd80bbf921a5"
        byol = "ami-0237a3409b27a19e2"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0169c1f2cda09bd0b"
        byol = "ami-0ec71690a7cdbad1b"
      },
      x86 = {
        payg = "ami-0e655cc998bc0d877"
        byol = "ami-00bdca28740fb213a"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0fd0b5802c6c53363"
        byol = "ami-099216bfb34913466"
      },
      x86 = {
        payg = "ami-0f495b46488c1ed15"
        byol = "ami-0015aecbab8476fe3"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0fb9fd0912ba82c7d"
        byol = "ami-00d9815ec3e8caf8a"
      },
      x86 = {
        payg = "ami-0cfea0802f69ea83b"
        byol = "ami-0641251acee4a305c"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0be7dee7d022f8225"
        byol = "ami-03bfc2e3b3f0ffb36"
      },
      x86 = {
        payg = "ami-00a519004c937d3a9"
        byol = "ami-0e67a44c6e27e7d2a"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-022d36582e2e8ec02"
        byol = "ami-084e4999a805a813c"
      },
      x86 = {
        payg = "ami-0f5e78e6f44937dd1"
        byol = "ami-053e78d74a111f7fe"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-00ff291cb1e78c3f0"
        byol = "ami-008ea271a86085810"
      },
      x86 = {
        payg = "ami-0d6d043ed6c5e2873"
        byol = "ami-038ae5d53f0d72e69"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0647aacc1dc3a46f7"
        byol = "ami-0c2657109d7cb8db0"
      },
      x86 = {
        payg = "ami-0e67e26f03fa531cf"
        byol = "ami-052085ab18ff3355b"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-023f98bf40f2b595f"
        byol = "ami-0a0f67d96b1851bec"
      },
      x86 = {
        payg = "ami-0dbb52c3de794a3df"
        byol = "ami-00fec15be7bf1d2e0"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0d2da8846715b7b19"
        byol = "ami-02b3caf832d67e58c"
      },
      x86 = {
        payg = "ami-005a2a24b24959ea2"
        byol = "ami-0f6325662e8c20563"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0fca0ba95afd46078"
        byol = "ami-00be60d888e47447f"
      },
      x86 = {
        payg = "ami-0b36fdf89f71dc07d"
        byol = "ami-048225b17798a5e32"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-020849a48104833dd"
        byol = "ami-086e988f69eedb27a"
      },
      x86 = {
        payg = "ami-00389a666464eb503"
        byol = "ami-06f27c8937bf46733"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0638da43642c63d55"
        byol = "ami-0d50def71190453d6"
      },
      x86 = {
        payg = "ami-0d82464a818bfac59"
        byol = "ami-02098eeacc5632882"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0e099de3fc89a997d"
        byol = "ami-0dc597eba1abf5f87"
      },
      x86 = {
        payg = "ami-0a787c9a12633ec2a"
        byol = "ami-07e92a2956b43ca75"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-023b6783447946bd2"
        byol = "ami-0a0d9b55e3b00d040"
      },
      x86 = {
        payg = "ami-0577169447dc99a9b"
        byol = "ami-05160bf9ecb222693"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0ae2fb1b1c4fe35c8"
        byol = "ami-0724e1e4f0ae96cb8"
      },
      x86 = {
        payg = "ami-0f4615d9a4644da9e"
        byol = "ami-0b73a8f7d6e50d04f"
      }
    }
  }
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
