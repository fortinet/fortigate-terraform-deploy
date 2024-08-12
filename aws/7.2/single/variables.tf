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

variable "vpccidr" {
  default = "10.1.0.0/16"
}

variable "publiccidraz1" {
  default = "10.1.0.0/24"
}

variable "privatecidraz1" {
  default = "10.1.1.0/24"
}


// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "token"
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

// AMIs for FGTVM-7.2.8
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0b301c66588be827f"
        byol = "ami-09fba4bb0b5e69adc"
      },
      x86 = {
        payg = "ami-006201ea0514a4f6b"
        byol = "ami-0e519e0da7b839873"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0b1898c320c386e4f"
        byol = "ami-0420612d4cd8882ae"
      },
      x86 = {
        payg = "ami-0e753ef82750c6ef1"
        byol = "ami-025af43b8340b6561"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-075ba811eac994da7"
        byol = "ami-066be194c79a30d32"
      },
      x86 = {
        payg = "ami-0f9b1d3d341c5fac2"
        byol = "ami-00506f3e81e57932c"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0ec4cbf427a39cfa7"
        byol = "ami-02647568f25208e1c"
      },
      x86 = {
        payg = "ami-01ad1964ec7ad89f1"
        byol = "ami-0d98256a44f88b774"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-06cd6e569ff883d49"
        byol = "ami-0ef747f54eb0b692d"
      },
      x86 = {
        payg = "ami-0d8f731c1a3ce4932"
        byol = "ami-075256abc1a2db9ff"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-01a9b0070d377dbd9"
        byol = "ami-012289f54c083a3f2"
      },
      x86 = {
        payg = "ami-0d0a855171f923890"
        byol = "ami-0eef8ffb3101b63a3"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-05c8ab0a8941dd872"
        byol = "ami-0887eff38f220d7ff"
      },
      x86 = {
        payg = "ami-0f78729a2d238328e"
        byol = "ami-0683dc5b5ce37b67b"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-04eff0d3efc8a85a2"
        byol = "ami-0bd8664674df87aeb"
      },
      x86 = {
        payg = "ami-0ce9c655c3b50683c"
        byol = "ami-011af6e69b3da7593"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0514b63944828032a"
        byol = "ami-09c6015f71a982046"
      },
      x86 = {
        payg = "ami-0f264351ff99c8537"
        byol = "ami-05d34b7e2e1f04513"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-07154dc4d034eff42"
        byol = "ami-017d3f7a0701f4e0b"
      },
      x86 = {
        payg = "ami-0b727213cfa5769e8"
        byol = "ami-09c663cb68e139f0d"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-03d90c307c506d124"
        byol = "ami-0e2ee9b6074c76546"
      },
      x86 = {
        payg = "ami-002b188f791127a51"
        byol = "ami-0378425a96c13ef82"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0fea3da6eabc009af"
        byol = "ami-01e50797c07aef877"
      },
      x86 = {
        payg = "ami-0d082615b1cfbef35"
        byol = "ami-0388e5b33d3773d77"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-002b4c2a9c49d27b9"
        byol = "ami-0551b8b53a0af80b9"
      },
      x86 = {
        payg = "ami-07b43cfd88a11800a"
        byol = "ami-0a2f6999f088e585a"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-06fa4b366cc39fc02"
        byol = "ami-0bcbb96f5b9e21b9c"
      },
      x86 = {
        payg = "ami-0ed84bf7a9b78d7f0"
        byol = "ami-0ee174d3fd728ab2c"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0346bb787ff1fb591"
        byol = "ami-06cfcf40ae5b5d191"
      },
      x86 = {
        payg = "ami-02dca1f70b8830bd3"
        byol = "ami-0aa2f14b67ac9b19f"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0235a987d4df77c89"
        byol = "ami-028befd01d74a96c8"
      },
      x86 = {
        payg = "ami-0d7ae6e8b42e04938"
        byol = "ami-05e93951a2ff59a75"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0ca1b02d27d8c8e04"
        byol = "ami-035031c00a2947343"
      },
      x86 = {
        payg = "ami-0b040e5b1995b446f"
        byol = "ami-0b1b18150eecc57d9"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0e3634ec9c35f0dd1"
        byol = "ami-0f97aa6c75f5f6510"
      },
      x86 = {
        payg = "ami-0f3d8f2dfd61fbef7"
        byol = "ami-00bd0fffa29d6cc90"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0b88aeb30a0ae3d70"
        byol = "ami-0bf70e5798434aa18"
      },
      x86 = {
        payg = "ami-0c241f520fe71355f"
        byol = "ami-030fb9f76a7b3ac21"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0661127fbcc416066"
        byol = "ami-00879d5b0b452b949"
      },
      x86 = {
        payg = "ami-08daefa69bbf9eb53"
        byol = "ami-084bcd56298e56ea6"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0e3c034d365e20377"
        byol = "ami-0a3b00947baf18cd9"
      },
      x86 = {
        payg = "ami-0457cb6297c28c57f"
        byol = "ami-09d4fe147cf371b33"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0b71674cd82a00588"
        byol = "ami-0b952defb07af3529"
      },
      x86 = {
        payg = "ami-06e74c467096f1c66"
        byol = "ami-0e9138af5565c6ea0"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-0e925aa3049ef8bad"
        byol = "ami-0f2c0908bf2c53aa7"
      },
      x86 = {
        payg = "ami-0511eceea71e07393"
        byol = "ami-05a95fa0de5fdf6cb"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0d355a104f918eccc"
        byol = "ami-07e83622f9e759cd1"
      },
      x86 = {
        payg = "ami-0f6828396bfd55588"
        byol = "ami-05e39be5fea2558a4"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-02d864e3231252d31"
        byol = "ami-0fdaa6bd15280c2f5"
      },
      x86 = {
        payg = "ami-04123086e009a6d16"
        byol = "ami-070d6cb6c46162061"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-04cb38c4964491610"
        byol = "ami-0b78eff35456b5e7e"
      },
      x86 = {
        payg = "ami-0e619f7418040cdc5"
        byol = "ami-0c3f0dd22ed5269c8"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0274c3dbe708893a9"
        byol = "ami-02e5184bd7a24224e"
      },
      x86 = {
        payg = "ami-06fd475f63a67a340"
        byol = "ami-0cdc38e344c90a0bd"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-03d86ff5bdeae35e0"
        byol = "ami-03cd9a112aef2c450"
      },
      x86 = {
        payg = "ami-033e4c6509d8591e6"
        byol = "ami-08521dc678ab9d350"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0ccd62c691bbede00"
        byol = "ami-0c68927f137f861b6"
      },
      x86 = {
        payg = "ami-0053eddc7e76bc583"
        byol = "ami-0622ba714d226c8e3"
      }
    }
  }
}


//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY>"
}

variable "adminsport" {
  default = "8443"
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
