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
// Either: x86 or arm
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.2.8
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-09fba4bb0b5e69adc"
      },
      x86 = {
        byol = "ami-0e519e0da7b839873"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0420612d4cd8882ae"
      },
      x86 = {
        byol = "ami-025af43b8340b6561"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-066be194c79a30d32"
      },
      x86 = {
        byol = "ami-00506f3e81e57932c"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-02647568f25208e1c"
      },
      x86 = {
        byol = "ami-0d98256a44f88b774"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-0ef747f54eb0b692d"
      },
      x86 = {
        byol = "ami-075256abc1a2db9ff"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-012289f54c083a3f2"
      },
      x86 = {
        byol = "ami-0eef8ffb3101b63a3"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0887eff38f220d7ff"
      },
      x86 = {
        byol = "ami-0683dc5b5ce37b67b"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0bd8664674df87aeb"
      },
      x86 = {
        byol = "ami-011af6e69b3da7593"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-09c6015f71a982046"
      },
      x86 = {
        byol = "ami-05d34b7e2e1f04513"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-017d3f7a0701f4e0b"
      },
      x86 = {
        byol = "ami-09c663cb68e139f0d"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-0e2ee9b6074c76546"
      },
      x86 = {
        byol = "ami-0378425a96c13ef82"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-01e50797c07aef877"
      },
      x86 = {
        byol = "ami-0388e5b33d3773d77"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0551b8b53a0af80b9"
      },
      x86 = {
        byol = "ami-0a2f6999f088e585a"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0bcbb96f5b9e21b9c"
      },
      x86 = {
        byol = "ami-0ee174d3fd728ab2c"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-06cfcf40ae5b5d191"
      },
      x86 = {
        byol = "ami-0aa2f14b67ac9b19f"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-028befd01d74a96c8"
      },
      x86 = {
        byol = "ami-05e93951a2ff59a75"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-035031c00a2947343"
      },
      x86 = {
        byol = "ami-0b1b18150eecc57d9"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0f97aa6c75f5f6510"
      },
      x86 = {
        byol = "ami-00bd0fffa29d6cc90"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0bf70e5798434aa18"
      },
      x86 = {
        byol = "ami-030fb9f76a7b3ac21"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-00879d5b0b452b949"
      },
      x86 = {
        byol = "ami-084bcd56298e56ea6"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0a3b00947baf18cd9"
      },
      x86 = {
        byol = "ami-09d4fe147cf371b33"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0b952defb07af3529"
      },
      x86 = {
        byol = "ami-0e9138af5565c6ea0"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0f2c0908bf2c53aa7"
      },
      x86 = {
        byol = "ami-05a95fa0de5fdf6cb"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-07e83622f9e759cd1"
      },
      x86 = {
        byol = "ami-05e39be5fea2558a4"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0fdaa6bd15280c2f5"
      },
      x86 = {
        byol = "ami-070d6cb6c46162061"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0b78eff35456b5e7e"
      },
      x86 = {
        byol = "ami-0c3f0dd22ed5269c8"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-02e5184bd7a24224e"
      },
      x86 = {
        byol = "ami-0cdc38e344c90a0bd"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-03cd9a112aef2c450"
      },
      x86 = {
        byol = "ami-08521dc678ab9d350"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0c68927f137f861b6"
      },
      x86 = {
        byol = "ami-0622ba714d226c8e3"
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
