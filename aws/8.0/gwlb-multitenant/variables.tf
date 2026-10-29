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

// AMIs for FGTVM-8.0.2
variable "fgtami" {
  type = map(any)
  default = {
    f-south-1 = {
      arm = {
        byol = "ami-00f990b22af296ebe"
      },
      x86 = {
        byol = "ami-026511d4afb45e1f1"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0b0bcba68b25e61b9"
      },
      x86 = {
        byol = "ami-07e6dbdbb0b4594a4"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-03c2e31be9992ebe3"
      },
      x86 = {
        byol = "ami-074d913fbbc64c9aa"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0e13f65b42eec4770"
      },
      x86 = {
        byol = "ami-0a1849c2e1c3191fa"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0c5ed6343bad9dbc6"
      },
      x86 = {
        byol = "ami-03d8dff62bb1844fd"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-069c4af6d4d704547"
      },
      x86 = {
        byol = "ami-05eee641e9b1a3c63"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-040d1231b20b088f7"
      },
      x86 = {
        byol = "ami-02c87b78346be4259"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-09078058904d19785"
      },
      x86 = {
        byol = "ami-0da44d1f873baeed2"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0d181de76404049d1"
      },
      x86 = {
        byol = "ami-0fa7b93ad095d752a"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0ae19052b8671f848"
      },
      x86 = {
        byol = "ami-00db7d3a427575538"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-05cff00e907e65bc8"
      },
      x86 = {
        byol = "ami-01516c7b0be29dd50"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0c1078c51625b4592"
      },
      x86 = {
        byol = "ami-0484fc9fd50c1398f"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0c1718f5d3a6740ac"
      },
      x86 = {
        byol = "ami-02e5ddab29c5b1819"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-01502db9070d557fb"
      },
      x86 = {
        byol = "ami-0859c2382bbddaafe"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-01334c34f7039d39b"
      },
      x86 = {
        byol = "ami-073ebbf2db39a32f8"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0b3ca4e71af35c9f8"
      },
      x86 = {
        byol = "ami-0a57b70e9a3f6c16b"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-00a52a73d44049165"
      },
      x86 = {
        byol = "ami-0c94c0482cf0e817b"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0613eecc47d0da274"
      },
      x86 = {
        byol = "ami-0f87c9d117231cd4b"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-020a42aeabc0d37e4"
      },
      x86 = {
        byol = "ami-001ccc34b0eb64e23"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0d95f9d166974db91"
      },
      x86 = {
        byol = "ami-05227024e16445ed0"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0e8b4f639f9460f53"
      },
      x86 = {
        byol = "ami-00c9f11a957b62db4"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-07c9c192b4cfd8b67"
      },
      x86 = {
        byol = "ami-08e80015168ba430b"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-00d9e40b27bac0fd6"
      },
      x86 = {
        byol = "ami-09c04df685c68c949"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0d695c5bc1ce8cb37"
      },
      x86 = {
        byol = "ami-062af3cae718cb7db"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-08b479b55e6130085"
      },
      x86 = {
        byol = "ami-0f4dc030829d6cc64"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0b9b6ba757c1f2a63"
      },
      x86 = {
        byol = "ami-07ddaaf18100470ac"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-08958166b8ef22f8b"
      },
      x86 = {
        byol = "ami-00dba7978d4de52ca"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0733734781963105c"
      },
      x86 = {
        byol = "ami-09d06a5ee0d51bbb1"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0552bdab5fcbdbf42"
      },
      x86 = {
        byol = "ami-09ac160f27939b681"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-007ff97eb46fea60b"
      },
      x86 = {
        byol = "ami-05759f9be28c9dc7f"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-072f8038d544938e5"
      },
      x86 = {
        byol = "ami-0ebfa396d55901053"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-06d573f24b2214f19"
      },
      x86 = {
        byol = "ami-05002b82c861c3c8f"
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
