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


// AMIs for FGTVM-7.2.12
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-074a1f5b9bd02172b"
      },
      x86 = {
        byol = "ami-0aed93b400753d7e3"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0dd106666d4b2e39a"
      },
      x86 = {
        byol = "ami-09d58329b513e6e68"
      }
    },
    ap-east-2 = {
      x86 = {
        byol = "ami-055c190ab5b34db8a"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-00a47d6a580e4b080"
      },
      x86 = {
        byol = "ami-01535f46ab1cc5e43"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0714d1fb4c2af760e"
      },
      x86 = {
        byol = "ami-0188ddc1101c2f6c3"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-09e29cfe8a03f9b9b"
      },
      x86 = {
        byol = "ami-0bfdfb68af07b0c7e"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0166cc99293951654"
      },
      x86 = {
        byol = "ami-0fa3376d0cb33f571"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0c4b14f9e7ad7c8cb"
      },
      x86 = {
        byol = "ami-0d36dd21c69b4655a"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0d6e584f19dc39d9b"
      },
      x86 = {
        byol = "ami-06983ffc1d9019411"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0ca8ae45bfdadf8fe"
      },
      x86 = {
        byol = "ami-0d574d4b3f97d5613"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0427a31c2fee7efea"
      },
      x86 = {
        byol = "ami-08a58151c8af5cf59"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0566c6ef2baabfc9f"
      },
      x86 = {
        byol = "ami-0f2d8b1a5deacf185"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-02a72a1788b8f4d03"
      },
      x86 = {
        byol = "ami-02b382c8f65447194"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0e565f0b3e8fb61ed"
      },
      x86 = {
        byol = "ami-0b871935c3bd26d71"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0ab91d07d044e79fb"
      },
      x86 = {
        byol = "ami-00c9853ec01d47635"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0a132173f3405d9b0"
      },
      x86 = {
        byol = "ami-08bf2dd749fa30c0e"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0f1bd25f8199522b1"
      },
      x86 = {
        byol = "ami-05104736ac13a4a2b"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0c6fee2733d41623a"
      },
      x86 = {
        byol = "ami-073f01412aa45d50e"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-00051d13b61364f8b"
      },
      x86 = {
        byol = "ami-0ab741e6c8da9719e"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0df9ac51863952a68"
      },
      x86 = {
        byol = "ami-055f1032a4f15d658"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-05a473a01f32be3a2"
      },
      x86 = {
        byol = "ami-094b5d25e1f0d7814"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0331b886175f7b8b1"
      },
      x86 = {
        byol = "ami-02853888560bc5ca6"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0c0c5d9d40ea84c97"
      },
      x86 = {
        byol = "ami-0eae497372638407e"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0f59d4f4ae144c2b2"
      },
      x86 = {
        byol = "ami-0153d66b2ead50f64"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0776b9c1de91c3a2b"
      },
      x86 = {
        byol = "ami-0c4e2884534c70e32"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0a8859718dbec9a48"
      },
      x86 = {
        byol = "ami-0413f253d2046823e"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-02544b37973a38e08"
      },
      x86 = {
        byol = "ami-0af1fb4179c4727de"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-095258e485a2d2516"
      },
      x86 = {
        byol = "ami-08f0aea301729c00c"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0eed7ca9edaf7463b"
      },
      x86 = {
        byol = "ami-00a099af78643465d"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0d5d2ad4d3265ec20"
      },
      x86 = {
        byol = "ami-07e15cc3a9b57cb42"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0e9bcb12861d5a2a3"
      },
      x86 = {
        byol = "ami-0dd35e851a17a7f9a"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-080ef43a31cb7abf6"
      },
      x86 = {
        byol = "ami-0be7f236c8807dd0f"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-03ad034b07feaa16e"
      },
      x86 = {
        byol = "ami-0603e7a4dd7966cad"
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
