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

// AMIs for FGTVM-7.4.6
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-0a65d516df5789266"
      },
      x86 = {
        byol = "ami-04a25db97c0ca0826"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0dca0399791d5b786"
      },
      x86 = {
        byol = "ami-0dd8c5f7eea08b1dc"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0300125887b042c6e"
      },
      x86 = {
        byol = "ami-07594d44a4106e02b"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0923e5e36c2ebd07d"
      },
      x86 = {
        byol = "ami-00855c5a6fb818920"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-0fe8969afacd332a2"
      },
      x86 = {
        byol = "ami-0b5a693d843cbc8a7"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0d8b0acf4ed7381c1"
      },
      x86 = {
        byol = "ami-066a8c1d6aa9a4622"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0eafaa211a83d7580"
      },
      x86 = {
        byol = "ami-0d9d0c2b1140720bf"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0d1ec1bd9991994de"
      },
      x86 = {
        byol = "ami-04bf7b29351a6e424"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-03a983c8a7e3ec15b"
      },
      x86 = {
        byol = "ami-0082c7bcf1f0c075f"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-039044441cd700da2"
      },
      x86 = {
        byol = "ami-0456f2abe95073f47"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-052e761a2b194df99"
      },
      x86 = {
        byol = "ami-09a5ea2c1b63c8b61"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-040f7d2b59d025826"
      },
      x86 = {
        byol = "ami-0d33679c10f3ad567"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-01bfec63375a86b07"
      },
      x86 = {
        byol = "ami-0fbbaf6901984daef"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0f8467d0b11feda0d"
      },
      x86 = {
        byol = "ami-08d8b16d206181ce4"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-09f9b70772c2e68fa"
      },
      x86 = {
        byol = "ami-03854cc16f8bf9c63"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0d7b9b5d3ecd30a5a"
      },
      x86 = {
        byol = "ami-06b27e653108b2da3"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-013156d1ceac8e295"
      },
      x86 = {
        byol = "ami-0d02b915c3bfd3beb"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0b63afdc4915e8b68"
      },
      x86 = {
        byol = "ami-0af73ff09e37581e6"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-072449858bf433f33"
      },
      x86 = {
        byol = "ami-041ab60c7d321566a"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-059e7c0239d0865cc"
      },
      x86 = {
        byol = "ami-013bc359e3b45e2c0"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-09ca0699596d056cc"
      },
      x86 = {
        byol = "ami-07463647ebc282a26"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0e9f592991a3300c2"
      },
      x86 = {
        byol = "ami-0f44b75f6e866d36e"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0f66bbfbc90dfa81a"
      },
      x86 = {
        byol = "ami-0140ea76e4f2e0462"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-09419ff58357d89a2"
      },
      x86 = {
        byol = "ami-078ef82a72ba41dfc"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-018528391930e0cc5"
      },
      x86 = {
        byol = "ami-0494839e2d53d5ee7"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0f7105d871af1684e"
      },
      x86 = {
        byol = "ami-05e4df939932a2f4a"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-036a587a16b23aa09"
      },
      x86 = {
        byol = "ami-085bcd2263233d5b9"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-04ed753623c37bb99"
      },
      x86 = {
        byol = "ami-03dd8486de1eb22fa"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0c06733917f9d3e19"
      },
      x86 = {
        byol = "ami-0c970738a0abe5bb2"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-02462aa70981e954b"
      },
      x86 = {
        byol = "ami-037225948b8cc664a"
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
