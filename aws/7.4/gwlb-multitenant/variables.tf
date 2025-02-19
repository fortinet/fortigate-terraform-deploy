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

// AMIs for FGTVM-7.4.7
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-0bd84b0f416715ebd"
      },
      x86 = {
        byol = "ami-039bac10b2acd9396"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-09dcbdcf976e866d0"
      },
      x86 = {
        byol = "ami-0e79c5898c134cfac"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0788b29446ee49641"
      },
      x86 = {
        byol = "ami-08da4442c22bb35aa"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0c03fd8241d427575"
      },
      x86 = {
        byol = "ami-01c60f5f20149202c"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-0979a6878b5774a31"
      },
      x86 = {
        byol = "ami-07be2ec61b3448992"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-091180312106c0796"
      },
      x86 = {
        byol = "ami-0826d0f6f376f515d"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0292f9191a3adc509"
      },
      x86 = {
        byol = "ami-04e35f47a110d764b"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0955a0c6e73fe4dd8"
      },
      x86 = {
        byol = "ami-0753eacc3f2e4449c"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0b5e7174bd2d05a36"
      },
      x86 = {
        byol = "ami-027b2df23926e91da"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-00e9680a7c7f5bf75"
      },
      x86 = {
        byol = "ami-09f7e46c3693feb5d"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0890d34309251efc3"
      },
      x86 = {
        byol = "ami-0f773f6afe60479c9"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-0b596e808d95af8a5"
      },
      x86 = {
        byol = "ami-041460262b23af7c4"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-03d0dcd96d5244d16"
      },
      x86 = {
        byol = "ami-0df272b797f94cc5c"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0364bfbe68f9e1651"
      },
      x86 = {
        byol = "ami-0000c8d304edf4697"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-064d7507c6280a308"
      },
      x86 = {
        byol = "ami-0e4e71cec08bc21ab"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0fd4e2d70e88eae8b"
      },
      x86 = {
        byol = "ami-0b8527bcead066265"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-01c42a6127a4c4b9b"
      },
      x86 = {
        byol = "ami-0005cdd6c729588bd"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0d7438e2b79613141"
      },
      x86 = {
        byol = "ami-0248a69c0afa7c2e5"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0b03c068f0af89bff"
      },
      x86 = {
        byol = "ami-014e9d84ff94d7937"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0e519a985110abd46"
      },
      x86 = {
        byol = "ami-0b271dd174263574c"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-02595ba0680c67cb0"
      },
      x86 = {
        byol = "ami-01e4c3cef50e486aa"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0fb3ef105d3919e25"
      },
      x86 = {
        byol = "ami-0066c052ad5865ce6"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-03f538df0dd0d163e"
      },
      x86 = {
        byol = "ami-00e09ae9532c6d8a4"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-02262ca02c1e4f5f0"
      },
      x86 = {
        byol = "ami-0421f160a085678da"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0b3cb8e68da11fe2c"
      },
      x86 = {
        byol = "ami-0cc670db734faaaa5"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0080e2582b2d35411"
      },
      x86 = {
        byol = "ami-05c6ceba4f447a0c3"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-085d977a649ecb0e6"
      },
      x86 = {
        byol = "ami-03e15ffcdc6039c95"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-01596703716b936a1"
      },
      x86 = {
        byol = "ami-013b7f71dec219d50"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0003920db723d430c"
      },
      x86 = {
        byol = "ami-04ec669fc69e86210"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0d9bf16589c550b59"
      },
      x86 = {
        byol = "ami-06246e80854aeacc3"
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
