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

// AMIs for FGTVM-7.4.13
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-00787afb1f2e4a9de"
      },
      x86 = {
        byol = "ami-00eb568fa511a35f6"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-00de750de3b372258"
      },
      x86 = {
        byol = "ami-0b7f0ad8078cd11d1"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-0821e2fbd05cf42b3"
      },
      x86 = {
        byol = "ami-0cfaf9ffd4c7ffe56"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0e2b99aaa46285ad0"
      },
      x86 = {
        byol = "ami-0667ed2427f829a7c"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-01e36214fc91d9c51"
      },
      x86 = {
        byol = "ami-07ac664e715dfb7ab"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-06ff45f97b9df2f0a"
      },
      x86 = {
        byol = "ami-0d5e8b308c0e34b61"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0f5c45857b2514158"
      },
      x86 = {
        byol = "ami-00bb9b5e8a27528c5"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-096159218f797e7f2"
      },
      x86 = {
        byol = "ami-072bfc081cf532485"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0f7e396c8beba091b"
      },
      x86 = {
        byol = "ami-00cf0bfb82863ae09"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-05666bd1cdbd53a52"
      },
      x86 = {
        byol = "ami-0b3d952d6613ba3bf"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-085740e06b5f7c826"
      },
      x86 = {
        byol = "ami-0ac66d2169510669e"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-098ee5fbbe4b1adc6"
      },
      x86 = {
        byol = "ami-0028bc2ad9c49dd8e"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-09c9f6d02f9f7a6e1"
      },
      x86 = {
        byol = "ami-079fec7760e9935cc"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-0a9951ef0b89f99d9"
      },
      x86 = {
        byol = "ami-0e1cffe64df2ea5e1"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-06fc47388e3698b05"
      },
      x86 = {
        byol = "ami-0d3db1bb52b4aceb7"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-055243c482a2086f1"
      },
      x86 = {
        byol = "ami-0ae2b64456b740c84"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0586e4775c171533c"
      },
      x86 = {
        byol = "ami-02cfba9fb6be50b3f"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0feb745c93786e2a1"
      },
      x86 = {
        byol = "ami-07a0a1111f3adc300"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0c38c5d3f960805c7"
      },
      x86 = {
        byol = "ami-0e52ff3ae62511328"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-046ad9b39da34c8f0"
      },
      x86 = {
        byol = "ami-0252bb479b1146b93"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0a89154da73679124"
      },
      x86 = {
        byol = "ami-0d8ed398b325515d0"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-001429af4b95c2314"
      },
      x86 = {
        byol = "ami-0e3a1240e87038809"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0a2428c216dc50040"
      },
      x86 = {
        byol = "ami-044a4bed0a17a9d02"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-03a41c23eaa58bb7b"
      },
      x86 = {
        byol = "ami-03d9215014ac2fb68"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0136d9b9aff55e881"
      },
      x86 = {
        byol = "ami-07719eb63c3debca1"
      }
    },
    l-central-1 = {
      arm = {
        byol = "ami-08197139517546f2c"
      },
      x86 = {
        byol = "ami-0a5ca9b59c9981627"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-0403d66fbef99ca7e"
      },
      x86 = {
        byol = "ami-0608965cd824d4de2"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-036080d6bba065b2f"
      },
      x86 = {
        byol = "ami-08cb6dd9f5803d249"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0404fc505e249249b"
      },
      x86 = {
        byol = "ami-084fb0688c96803b9"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-09f66d73c018c3f7f"
      },
      x86 = {
        byol = "ami-0912190489f9d6695"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0ef8c3e4eb29f6974"
      },
      x86 = {
        byol = "ami-0a8094e43330c08c2"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0e292ea9477e3859c"
      },
      x86 = {
        byol = "ami-0c7ae838d9790a210"
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
