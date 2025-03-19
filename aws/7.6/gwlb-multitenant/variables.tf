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

// AMIs for FGTVM-7.6.2
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-0d99c9297ffbf97f0"
      },
      x86 = {
        byol = "ami-03af9ca89cca2d5f6"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-03006139b1480c2f1"
      },
      x86 = {
        byol = "ami-0d9910a32f1606b1e"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-09cdcb3bce66ada46"
      },
      x86 = {
        byol = "ami-0a2e4f961d006b2b3"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0e2245c826472e6de"
      },
      x86 = {
        byol = "ami-06bfe2460e0a76848"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-03ae1f256197d0248"
      },
      x86 = {
        byol = "ami-070847dd30574d429"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-00637a0f1fb166580"
      },
      x86 = {
        byol = "ami-03d884ae71b3d909a"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-08fa73387ae4ec535"
      },
      x86 = {
        byol = "ami-0c7334e4c7b1bd594"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-00f5147e4a024e5cc"
      },
      x86 = {
        byol = "ami-09abed1c2fc390ea7"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0a82229077b0994a5"
      },
      x86 = {
        byol = "ami-03a50ae6deb2cb9fb"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0e822d3634edb3b32"
      },
      x86 = {
        byol = "ami-029ca9971a4e8f0b1"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-033f879722379afc4"
      },
      x86 = {
        byol = "ami-0665de0df2f44f866"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-017b0d11053a9ea5a"
      },
      x86 = {
        byol = "ami-081d86fcba975636b"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-04646f545f8ee0cab"
      },
      x86 = {
        byol = "ami-0d105e77e5a4bd4fe"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-042b25f7caf8b5402"
      },
      x86 = {
        byol = "ami-015d56060284cf805"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-039e4f8d4a16f9f59"
      },
     x86 = {
        byol = "ami-0abd3c18957bb5e6a"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-00952685019854d53"
      },
      x86 = {
        byol = "ami-0308e79dfcf664464"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-03857b53c39078583"
      },
      x86 = {
        byol = "ami-0b0ae44faeca8ddd2"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-061b101692410ba49"
      },
      x86 = {
        byol = "ami-0c1ad25816d0a240a"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0b9531cc597081a80"
      },
      x86 = {
        byol = "ami-015a928a037aab36f"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-038d063be017a3d28"
      },
      x86 = {
        byol = "ami-09c6d3279f6fe10a6"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-079ede986ea0f616c"
      },
      x86 = {
        byol = "ami-0606108a38e0f0042"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-03a836ad4c5afb6ed"
      },
      x86 = {
        byol = "ami-0758e267ed18597f8"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-039d01855ff2f374b"
      },
      x86 = {
        byol = "ami-0f2b90e6cc1233278"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0277b84db44836cb0"
      },
      x86 = {
        byol = "ami-0c5ae8b8ef718b56d"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-05c5bec326f90a6cb"
      },
      x86 = {
        byol = "ami-0b67146793310e637"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0dd6068308cdaf5f2"
      },
      x86 = {
        byol = "ami-097d3610462ac2127"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0187c913f025dc066"
      },
      x86 = {
        byol = "ami-053250b3bec83dd8d"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-01f990da044c97d10"
      },
      x86 = {
        byol = "ami-00877b308cea2c071"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0b52ac19bfc383dd3"
      },
      x86 = {
        byol = "ami-0eb9684ee7e22c40c"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0c4b28e79cb51bd08"
      },
      x86 = {
        byol = "ami-0e7e2811191a5b69a"
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
