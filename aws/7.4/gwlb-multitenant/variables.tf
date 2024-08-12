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

// AMIs for FGTVM-7.4.4
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-051109a33edc50a75"
      },
      x86 = {
        byol = "ami-0e4847279c5283aa2"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-095ed8e3a5f1ed3b5"
      },
      x86 = {
        byol = "ami-0701eb9a6d43b66dd"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-02db608924c9194f9"
      },
      x86 = {
        byol = "ami-089fe1ce20c057ba4"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0af4177d4cf113639"
      },
      x86 = {
        byol = "ami-043f32731c051ef30"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-021a7464e2ad1ed66"
      },
      x86 = {
        byol = "ami-004471032ea59250a"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0d7a06d425800c113"
      },
      x86 = {
        byol = "ami-077865546a21b9b96"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0e95c6a644ac341d1"
      },
      x86 = {
        byol = "ami-0e000e5e14f809201"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-06b56ab6a9d531ce7"
      },
      x86 = {
        byol = "ami-082b1066ebf456a11"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0d0cf7dcf555ede51"
      },
      x86 = {
        byol = "ami-06892800639a5d6f7"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0f11f0b1d16a69e39"
      },
      x86 = {
        byol = "ami-0fd5961d925548d98"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-096f57146543924e2"
      },
      x86 = {
        byol = "ami-0b259db60fd5f061f"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-009cb0f5d623c6326"
      },
      x86 = {
        byol = "ami-039554a1af48f8ee5"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-07fdc65a1a571179a"
      },
      x86 = {
        byol = "ami-0eb8820bd46e0765a"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-04a9c6f43b3cb7d0a"
      },
      x86 = {
        byol = "ami-0dbe1fa7d24a74263"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0ffe00e1164b37144"
      },
      x86 = {
        byol = "ami-05906e2828255bade"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-005af7ff39cf00576"
      },
      x86 = {
        byol = "ami-0c3163cc35c83c8ff"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0eb16cc0fac9174a8"
      },
      x86 = {
        byol = "ami-06f2d6119e152ba4e"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-02fde47bd7b94a280"
      },
      x86 = {
        byol = "ami-04e4ffecb22527420"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-09d5652c5fdbb1c31"
      },
      x86 = {
        byol = "ami-05ad9966a950de71b"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0f74e8ba3b5bafa46"
      },
      x86 = {
        byol = "ami-0dfefd514a7331cce"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0f85dd0f8550a7769"
      },
      x86 = {
        byol = "ami-0e92f5c29b121c2c8"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0f693e7d1bf908095"
      },
      x86 = {
        byol = "ami-0be9af3b721f8c959"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-01b81d365b334e298"
      },
      x86 = {
        byol = "ami-05eff062612d6d191"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0de89c6b16d8ba760"
      },
      x86 = {
        byol = "ami-0586c7ea6a8b2a5b5"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-08a6af34d97a1d345"
      },
      x86 = {
        byol = "ami-053853a9c88f69298"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0dfa267484fd1ed56"
      },
      x86 = {
        byol = "ami-0117fe58866dcdfef"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-05c25bd2865a5270e"
      },
      x86 = {
        byol = "ami-03f4a133efea58bdb"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-01042692389b3ce89"
      },
      x86 = {
        byol = "ami-06a63ee02b6a9069e"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0c642f033805183c3"
      },
      x86 = {
        byol = "ami-03b2da92bd1e10472"
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
