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

// AMIs for FGTVM-7.6.7
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-061c6cea1dbc91bbf"
      },
      x86 = {
        byol = "ami-0ee9b44e4ec1bfdc0"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-052b547469cf5c5b9"
      },
      x86 = {
        byol = "ami-002abb0c1a5e36534"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-01072181889dc2142"
      },
      x86 = {
        byol = "ami-02def78b29c1493dc"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-054af3435c841ffcb"
      },
      x86 = {
        byol = "ami-0bfe018b23b03115f"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0d0dbd071a5cc4f1b"
      },
      x86 = {
        byol = "ami-0df95c014402984ee"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-034bbedf6f41b3500"
      },
      x86 = {
        byol = "ami-004ebcb6de62846e9"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-000e3622708f7662b"
      },
      x86 = {
        byol = "ami-01fd6f2e969e9bf87"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-090c6d675f5e73e58"
      },
      x86 = {
        byol = "ami-098062df796dd3fdd"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-01a0364907cb53faf"
        byol = "ami-0f8beab3e14825928"
      },
      x86 = {
        byol = "ami-06081b4788006017f"
      }
    },
    ap-southeast-2 = {
        byol = "ami-0ed3647d8430f38eb"
      },
      x86 = {
        byol = "ami-0451629a1bd0d971e"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-014b65e14128df96b"
      },
      x86 = {
        byol = "ami-0fab4fbd350e69b00"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-00d949c94e0ca8991"
      },
      x86 = {
        byol = "ami-041d58c8593d02a7c"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0f592e6ba8dbbd3d2"
      },
      x86 = {
        byol = "ami-0d66ada48bb5f6b3a"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-0fa74a08e4f5a4921"
      },
      x86 = {
        byol = "ami-0ffab948d945fa9fe"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0aec254d994c6134b"
      },
      x86 = {
        byol = "ami-0f950be3f245faf2d"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-073846093cb7ef246"
      },
      x86 = {
        byol = "ami-0e0b2ef56e1003e6b"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0d00a4335e0fe046e"
      },
      x86 = {
        byol = "ami-08c620242e8615d6b"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0691f492b8aabed16"
      },
      x86 = {
        byol = "ami-08f6b4a95c4dc816b"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0f78eaa7f72ee0acb"
      },
      x86 = {
        byol = "ami-043858c596709fe1a"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0f7ca05d25a7df3fc"
      },
      x86 = {
        byol = "ami-0546ad7b7f07f8788"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-071b74db8c68f2eb3"
      },
      x86 = {
        byol = "ami-0d41963bfa1d197e2"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-027073bc80bfd55fe"
      },
      x86 = {
        byol = "ami-00754d3493eee3efd"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-048cf952b69294bb2"
      },
      x86 = {
        byol = "ami-0a384d1748bf21e70"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-087fcf0ff9a5f504d"
      },
      x86 = {
        byol = "ami-0c439ff75a7838a13"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-00ab0b4d24f8dacf2"
      },
      x86 = {
        byol = "ami-0afc698fe61d0d7fa"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0e3a916cc8de0e90e"
      },
      x86 = {
        byol = "ami-030d7eeff68167332"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-07d09c5b8df90be41"
      },
      x86 = {
        byol = "ami-09d3b0f7e95d8bd1a"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0f533b5f844360273"
      },
      x86 = {
        byol = "ami-0ba2f033294524226"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0938d5f314e1496a5"
      },
      x86 = {
        byol = "ami-0b10f99ddb71cacda"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-07ae0b385479fcff2"
      },
      x86 = {
        byol = "ami-097289a2e1b0b2b45"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0c64e14ed328b3f19"
      },
      x86 = {
        byol = "ami-03d7def66d7017003"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-097e5da546553d170"
      },
      x86 = {
        byol = "ami-058d68276defbe7b5"
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
