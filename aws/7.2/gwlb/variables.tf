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

// AMIs for FGTVM-7.2.1
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0bd076b8953c99e26"
        byol = "ami-001397d428ce9cc3e"
      },
      x86 = {
        payg = "ami-088a648de0cf2a8d0"
        byol = "ami-04a997b43f50bd2e8"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0e0f3d673abf4f445"
        byol = "ami-0b259d645b8c0e599"
      },
      x86 = {
        payg = "ami-081522f5e5c6464ac"
        byol = "ami-044408b80d602fd14"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-099625514b754f741"
        byol = "ami-09cc5339c79e5824b"
      },
      x86 = {
        payg = "ami-002828408925ee484"
        byol = "ami-084283cfda81157b5"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0f9edd5ed9dad3435"
        byol = "ami-0f18d3c78f90dccef"
      },
      x86 = {
        payg = "ami-0e9f40ac7253a4689"
        byol = "ami-0f323f6cddf382b3c"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-067af6c0fd3680fcc"
        byol = "ami-0f895436fd6284744"
      },
      x86 = {
        payg = "ami-02a335d85bbacb1ee"
        byol = "ami-0708eb366fe788d48"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0b5dad49591e66128"
        byol = "ami-0d62dc1f0f698c309"
      },
      x86 = {
        payg = "ami-0dc8de840415f3336"
        byol = "ami-033d430c9c34b9568"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-03b79f12338fba167"
      },
      x86 = {
        payg = "ami-0a2d1535fdc0f67ad"
        byol = "ami-0dd9467e480184f48"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0c32ec1bfce15ade7"
        byol = "ami-044e88c174ae9c598"
      },
      x86 = {
        payg = "ami-0549369768f687d54"
        byol = "ami-0482181325cfb5fc5"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0d86028f426e9a576"
        byol = "ami-05255380654b8eeca"
      },
      x86 = {
        payg = "ami-00344c85607641e14"
        byol = "ami-0e3a167f16247b5de"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-01bd639e7ea8357e6"
        byol = "ami-0329769f28e914c4f"
      },
      x86 = {
        payg = "ami-0bdea1802f93b4ee8"
        byol = "ami-09986d3a2221c3d7f"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-095503081f948be59"
        byol = "ami-0f5305090bb31ee2d"
      },
      x86 = {
        payg = "ami-052f4d53266eb4aef"
        byol = "ami-076f7b6b3a597d1b4"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0ca606846ff05b803"
        byol = "ami-0df77dd9ded7872bb"
      },
      x86 = {
        payg = "ami-0345b2e4ad338d622"
        byol = "ami-0b3e0e0a0e65ac32c"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0d906511eb326055f"
        byol = "ami-0e2936ee1742c1b3b"
      },
      x86 = {
        payg = "ami-007f505b0a7bcad76"
        byol = "ami-06bc1ba12b6f3676a"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0051c15559b4f49d6"
        byol = "ami-0f6d3ed2d1c37894b"
      },
      x86 = {
        payg = "ami-05c0fd18673a4d06b"
        byol = "ami-0adb50cbbca913d5d"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0c78639242cea418a"
        byol = "ami-04cfb8ef0c9720842"
      },
      x86 = {
        payg = "ami-004186c2ec8a32998"
        byol = "ami-031da2ed752eb2481"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-00722992ce2aa1b95"
        byol = "ami-019140d0430339bc8"
      },
      x86 = {
        payg = "ami-0230d7f3a27a4b312"
        byol = "ami-0b4e1809774cb7b1d"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0ddc5d30f165e6c0f"
        byol = "ami-08039c3cf7fc82d0f"
      },
      x86 = {
        payg = "ami-07b71197286f82ce2"
        byol = "ami-0182a6e569579d1a0"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-07a650888d4326e46"
        byol = "ami-061162035b41f8313"
      },
      x86 = {
        payg = "ami-03de21f74b767d59f"
        byol = "ami-01a43fc8a276d2343"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-028cca1ef2aa11dd1"
        byol = "ami-00d6c55e4da9a8cc0"
      },
      x86 = {
        payg = "ami-0fb094f83a92ee77d"
        byol = "ami-0a2a273a1afce11a6"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0b24fa46b1aa9e907"
        byol = "ami-07e564bc9fd7b9904"
      },
      x86 = {
        payg = "ami-083f055f53e54a627"
        byol = "ami-0f4157d75891a3d2e"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0e98f253f56a42836"
        byol = "ami-06de38c9be5d4e3a2"
      },
      x86 = {
        payg = "ami-066d505430ad345a0"
        byol = "ami-017380833397261cf"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0856d2ea89181e104"
        byol = "ami-0b25de6e0f537a8b6"
      },
      x86 = {
        payg = "ami-078010c2bb8331dac"
        byol = "ami-0f5062c1f266f9c30"
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
