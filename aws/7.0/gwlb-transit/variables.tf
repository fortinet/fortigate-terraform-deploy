//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "ap-southeast-2"
}

// Availability zones for the region
variable "az1" {
  default = "ap-southeast-2a"
}

variable "az2" {
  default = "ap-southeast-2b"
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

variable "attachcidraz1" {
  default = "10.1.2.0/24"
}

variable "gwlbcidraz1" {
  default = "10.1.3.0/24"
}

variable "publiccidraz2" {
  default = "10.1.4.0/24"
}

variable "privatecidraz2" {
  default = "10.1.5.0/24"
}

variable "attachcidraz2" {
  default = "10.1.6.0/24"
}

variable "gwlbcidraz2" {
  default = "10.1.7.0/24"
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
  default = "30.1.0.0/16"
}

variable "cs2publiccidraz1" {
  default = "30.1.0.0/24"
}

variable "cs2privatecidraz1" {
  default = "30.1.1.0/24"
}


variable "cs2publiccidraz2" {
  default = "30.1.2.0/24"
}

variable "cs2privatecidraz2" {
  default = "30.1.3.0/24"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// instance architect
// Either arm or x86
// Note: 7.0.12 doesn't have ARM AMI.  Only x86.
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c6g.xlarge"
}

// For 7.0.12, there is no AMI for the ARM platform
// AMIs for FGTVM-7.0.12
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-08ddbd2155132317b"
        byol = "ami-0ac6fa050c788d801"
      }
    },
    us-east-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-01817f6f93e76ad2a"
        byol = "ami-09321dcf8bb1fa0b6"
      }
    },
    us-west-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0ed78d7029954819d"
        byol = "ami-090ac5f1b82e51bf9"
      }
    },
    us-west-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-066d72b2d87de88fa"
        byol = "ami-0696a6c4d799074bb"
      }
    },
    af-south-1 = {
     arm = {
        payg = ""
        byol = ""
     },
     x86 = {
        payg = "ami-03330f74d11751a6d"
        byol = "ami-0c179219bfaabdace"
     }
    },
    ap-east-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-05148635f70a86df8"
        byol = "ami-03176e7744042594b"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0bfed2a7d1e68949a"
        byol = "ami-00ffa267f368640c0"
      }
    },
    ap-south-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-097079b4f31d18394"
        byol = "ami-0a692a2d630e762f6"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0a86f59680c0f33d0"
        byol = "ami-075638c64edd29eb2"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0ad93f15c983581c6"
        byol = "ami-06e461f119feb2799"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-05af12f32906bfc49"
        byol = "ami-0c0a996565d9fecdf"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0b9c231097025128c"
        byol = "ami-029606d980a551721"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0d10006c63e2055f9"
        byol = "ami-08c9b1b69f7d4b995"
      }
    },
    ca-central-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-02ca02182aa40c490"
        byol = "ami-0c0b7a8b039e8bdcf"
      }
    },
    eu-central-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-019e76ee8a02a3226"
        byol = "ami-09f7b3f5ac2313e57"
      }
    },
    eu-west-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-00a65f06615fc77ac"
        byol = "ami-04ec9ddb79754a393"
      }
    },
    eu-west-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-070e8c502bfa98d12"
        byol = "ami-089778e7a76387976"
      }
    },
    eu-south-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0f5d9628169846585"
        byol = "ami-02b5db61c8c0e7917"
      }
    },
    eu-west-3 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0f5d9628169846585"
        byol = "ami-02b5db61c8c0e7917"
      }
    },
    eu-north-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0d65275f41a617820"
        byol = "ami-07cc4c668064909d7"
      }
    },
    me-south-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0b4108b3d16e8539b"
        byol = "ami-0b6bb03f34629461e"
      }
    },
    me-central-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-00d8342144b773b21"
        byol = "ami-071bd251c584b1516"
      }
    },
    sa-east-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-00eb40920085e089b"
        byol = "ami-01ce2e9971a787830"
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

variable "bootstrap-fgtvm2" {
  // Change to your own path
  type    = string
  default = "fgtvm2.conf"
}

// license file for the fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the fgt 2
variable "license2" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license2.lic"
}
