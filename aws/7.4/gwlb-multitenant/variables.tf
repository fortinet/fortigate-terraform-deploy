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


// AMIs for FGTVM-7.4.9
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-0c8580a13fecccdb4"
      },
      x86 = {
        byol = "ami-0b67e6860d0d34207"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-06e3b5d0f99b9b855"
      },
      x86 = {
        byol = "ami-0260af42fd44e4251"
      }
    },
    ap-east-2 = {
      x86 = {
        byol = "ami-086b3a05a82b74f7f"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0ad61f355589d00c7"
      },
      x86 = {
        byol = "ami-0ab0ef077df1aa516"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-029d4695c7379070c"
      },
      x86 = {
        byol = "ami-009831aacfc70ea14"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-02da92c4d07ca0c74"
      },
      x86 = {
        byol = "ami-098fcf990e2da63ee"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-056a42051a036989a"
      },
      x86 = {
        byol = "ami-04ec734255a05eaf1"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0c9c02576957e17d0"
      },
      x86 = {
        byol = "ami-002178864cf7735e3"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-01e11aa479c55a757"
      },
      x86 = {
        byol = "ami-0fbde8b130256ee0e"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0219d3c0b0cb30afc"
      },
      x86 = {
        byol = "ami-05c3c3afaea686162"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-004e0250218fcd52b"
      },
      x86 = {
        byol = "ami-0b1a113ab75ece700"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-01c312645343a60b9"
      },
      x86 = {
        byol = "ami-05387ac148ee54651"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-07c59a05fd91581b8"
      },
      x86 = {
        byol = "ami-033b0839507c7cdf7"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0a8b0c15ab06da914"
      },
      x86 = {
        byol = "ami-0866526d31ba54fb3"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0378dd88af181307c"
      },
      x86 = {
        byol = "ami-007b2b2911e81dac3"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-09f607a4eef844475"
      },
      x86 = {
        byol = "ami-003270b02e8f20b66"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-05be8e87879789bb4"
      },
      x86 = {
        byol = "ami-00e14eafd811c0e54"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-09a36bc5f100df01d"
      },
      x86 = {
        byol = "ami-0baeec8ccbc2d3429"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-05e5fd3e5dac0caaf"
      },
      x86 = {
        byol = "ami-0fb32798971cf9b56"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-070fc8ec0f46549dd"
      },
      x86 = {
        byol = "ami-03f349526bfcbd842"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-078f624848cff9df2"
      },
      x86 = {
        byol = "ami-03d49d4a401eb6850"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0d2a0824adb2a5063"
      },
      x86 = {
        byol = "ami-0830f8b7291362d86"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0a6541f758f6a6bbb"
      },
      x86 = {
        byol = "ami-072242b9cd52fc16f"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-04cefe3898d79280b"
      },
      x86 = {
        byol = "ami-0601a3b3897610172"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-01619afbf31ce9eb6"
      },
      x86 = {
        byol = "ami-0a53fc4061366f0be"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-07aa407b41611f52c"
      },
      x86 = {
        byol = "ami-04ff6f4037d640032"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-036cfb2cdd7b7f881"
      },
      x86 = {
        byol = "ami-02f9aca24f42dab3a"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-069264c1fd250ffcd"
      },
      x86 = {
        byol = "ami-00459a468239ab770"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-088e4121c35946728"
      },
      x86 = {
        byol = "ami-002b1a346af0b380b"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-03e4958557fbc6a8e"
      },
      x86 = {
        byol = "ami-0d8ab3309f7946a19"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-008b51b7b30fa6373"
      },
      x86 = {
        byol = "ami-049f7cdccbc1982fa"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0c17fe23f93099656"
      },
      x86 = {
        byol = "ami-0e2502ae241354ddf"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-08aff92aeae6e8ac4"
      },
      x86 = {
        byol = "ami-0abc447e75506a62a"
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
