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

// AMIs for FGTVM-8.0.0
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-09cf4e3f7d306b968"
      },
      x86 = {
        byol = "ami-0c0b2ead5447a7b4b"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0108c953c86b3efb3"
      },
      x86 = {
        byol = "ami-038f671ae98b4e246"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-0edccb6b9d376f025"
      },
      x86 = {
        byol = "ami-08e309920ce5f7625"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-05666bd43bf2cbb76"
      },
      x86 = {
        byol = "ami-00ba3d8614680fea2"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-070fcb06f61cea107"
      },
      x86 = {
        byol = "ami-0957d856da4c64d36"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-0389d3f29df9cb37c"
      },
      x86 = {
        byol = "ami-0125a991c6acabf06"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0172d9d7b26ee63f3"
      },
      x86 = {
        byol = "ami-006ab74b927622db0"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-07d3979c290673a63"
      },
      x86 = {
        byol = "ami-039fc974d0473a79a"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-07c155f24c6d5c1c6"
      },
      x86 = {
        byol = "ami-01b40b8c7ff7b28e3"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-08633dcb97ec6911e"
      },
      x86 = {
        byol = "ami-0f4d8d27a9f1a5cc6"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-07d819ac825bb5365"
      },
      x86 = {
        byol = "ami-063df0d20a8f762ef"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-01868b1ff60aa722c"
      },
      x86 = {
        byol = "ami-02edbc2f26a4da062"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0ce07d92e61e46b4a"
      },
      x86 = {
        byol = "ami-0dd0ab09633c330da"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-0ab19d385ddc87eac"
      },
      x86 = {
        byol = "ami-0d71439c1c6d29c6b"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0f6da44a8f0ca3eb5"
      },
      x86 = {
        byol = "ami-09847f47641789748"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-058c6674f12151ab0"
      },
      x86 = {
        byol = "ami-033f84d383cc1a898"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-056f7298bba8c899d"
      },
      x86 = {
        byol = "ami-0422e932b21e779fe"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0e9ab3066e6ac81b0"
      },
      x86 = {
        byol = "ami-068b2fdf5e652ec30"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-08fb919d138ffc419"
      },
      x86 = {
        byol = "ami-0ef40f0f7f6b6e0ca"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-03b3acd7e8745bca8"
      },
      x86 = {
        byol = "ami-08ea88197e81115ef"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-073cfc95720483669"
      },
      x86 = {
        byol = "ami-075a01ced39c9ee31"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0d493b6d61f16acba"
      },
      x86 = {
        byol = "ami-00c0c795fa8ad0440"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-06f660eecb5894f0e"
      },
      x86 = {
        byol = "ami-05cdbf9b79dda4edc"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-05a6aadf1f1626f57"
      },
      x86 = {
        byol = "ami-0f4f8d919abf1ba7b"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0653be6cde942de6d"
      },
      x86 = {
        byol = "ami-09cdf9cbff0b61d4e"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0d1299c5f58929fc3"
      },
      x86 = {
        byol = "ami-00f4005460262332a"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-0641159bd7377441e"
      },
      x86 = {
        byol = "ami-09f2295b26345a2d9"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-06c60ead9f2264f36"
      },
      x86 = {
        byol = "ami-0f9f74436e8e48169"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0c3e5b64cb65b76ef"
      },
      x86 = {
        byol = "ami-09c4e5189ccaa48ce"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0780793a05ced8039"
      },
      x86 = {
        byol = "ami-0cb1506741751e133"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-07eb7ca135fbd74b4"
      },
      x86 = {
        byol = "ami-051bbca5ba244d613"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-061b399a5df4d92bf"
      },
      x86 = {
        byol = "ami-03696e7cc03fb6b31"
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
