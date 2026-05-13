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

// AMIs for FGTVM-7.4.12
variable "fgtami" {
  type = map(any)
  default = {
    f-south-1 = {
      arm = {
        byol = "ami-0b013dd5635053177"
      },
      x86 = {
        byol = "ami-087b7664d6564ad97"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0bf14889369912cc2"
      },
      x86 = {
        byol = "ami-048a9e158ebb08503"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-0583ac8235df26847"
      },
      x86 = {
        byol = "ami-0f62709b35c5f5c4c"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-015ceaab0ac814f0b"
      },
      x86 = {
        byol = "ami-0c9584969c4082bc8"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-036ab926fa77b1c1e"
      },
      x86 = {
        byol = "ami-01289cd0ed54cb1da"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-081a8fa4cc565a4ee"
      },
      x86 = {
        byol = "ami-05556c74cfc0b871f"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0d5c1d200109fbfa2"
      },
      x86 = {
        byol = "ami-046393a9e4a8dcad0"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-052649d19843af36d"
      },
      x86 = {
        byol = "ami-0fb12b9ba4bfc940d"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0530a12de3b550d8b"
      },
      x86 = {
        byol = "ami-0224d16694b60499d"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-09de43b9daa84f528"
      },
      x86 = {
        byol = "ami-0d565319e2c478155"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0c542d3b4be61d41e"
      },
      x86 = {
        byol = "ami-0adb482fd6f8e65aa"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0409fb623869374b5"
      },
      x86 = {
        byol = "ami-09fc95a34af853a50"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-01ca3e0bd4051307e"
      },
      x86 = {
        byol = "ami-03483641fc7b7ba8b"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-00ab5eb698f7eb32d"
      },
      x86 = {
        byol = "ami-0c8649a722d6fb805"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-01e7597bb49956cde"
      },
      x86 = {
        byol = "ami-093bf06e7fa055181"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-04da6b49e81f34c03"
      },
      x86 = {
        byol = "ami-0add2ff898c5284af"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-08ddde79f960f0615"
      },
      x86 = {
        byol = "ami-0afe145c0827d78cb"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-04eb5539677c56344"
      },
      x86 = {
        byol = "ami-0ae68938e44d78e0c"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-02ca40dcef381dfb7"
      },
      x86 = {
        byol = "ami-019de575646202847"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0ea13e8addd630087"
      },
      x86 = {
        byol = "ami-0e383e684de171ea7"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0aae2c24ccff268ed"
      },
      x86 = {
        byol = "ami-07f85a24014935a24"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0d2fc20953c002bbd"
      },
      x86 = {
        byol = "ami-0f28ba37d371786c0"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0d9d4ebe9fc6f3a87"
      },
      x86 = {
        byol = "ami-0aaf54c4488d90a16"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-01a553533917c47cf"
      },
      x86 = {
        byol = "ami-0d85d97baf506255d"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0699bce6a1491000b"
      },
      x86 = {
        byol = "ami-02f5cff505d3f801d"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0109a8e6e7e042db5"
      },
      x86 = {
        byol = "ami-06dd1c208192f0738"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-059683280f1d5e123"
      },
      x86 = {
        byol = "ami-0cfad70ec1ab07a85"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-00f67e01506a56564"
      },
      x86 = {
        byol = "ami-0bb017be9973ca3ff"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0e8dc5f0ac6722755"
      },
      x86 = {
        byol = "ami-08f8b0b29e88aabf3"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-004acb8c82971dee4"
      },
      x86 = {
        byol = "ami-0f8ebe2bfe54cb601"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0f366233ac9fcee90"
      },
      x86 = {
        byol = "ami-0b48339bddd0f2c6e"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-027afddd7e95537f5"
      },
      x86 = {
        byol = "ami-0ff72e30fd4366cd5"
      }
    }
  }
}

// AMIs 
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
