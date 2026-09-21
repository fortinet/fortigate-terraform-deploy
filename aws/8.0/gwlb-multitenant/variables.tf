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

// AMIs for FGTVM-8.0.1
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-0e89187837b9e9a8d"
      },
      x86 = {
        byol = "ami-0e1600cf6972d3525"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-05af3ff7425dcbb13"
      },
      x86 = {
        byol = "ami-0f16ee7cd1ad2c2ae"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-0a7a7d498ca4ac488"
      },
      x86 = {
        byol = "ami-05179a927864cec72"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0f9a51adda05836e9"
      },
      x86 = {
        byol = "ami-078d73c702f5902a6"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-03a3246c27a6186ec"
      },
      x86 = {
        byol = "ami-03f3cbbac8554789b"
      }
    },
    p-northeast-3 = {
      arm = {
        byol = "ami-0630fc3bb3ea2ddf1"
      },
      x86 = {
        byol = "ami-003b0651f64ab5b83"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0ebbbb412c7f3ffd2"
      },
      x86 = {
        byol = "ami-00ada06b433931198"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0798c2b69360d3ca4"
      },
      x86 = {
        byol = "ami-0c1fb655529f4e8cb"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0de5fa992ec77a7ff"
      },
      x86 = {
        byol = "ami-0496363ee7fd96119"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0dedaee02dee12645"
      },
      x86 = {
        byol = "ami-0f93222ae6f155a5f"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0d862b571bb46ca87"
      },
      x86 = {
        byol = "ami-083555343cd37805e"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-03eee956933380058"
      },
      x86 = {
        byol = "ami-0c740625ba2f3d517"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0165495c13627613e"
      },
      x86 = {
        byol = "ami-07916f2c28e0e62f1"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-0996297dff1d5694b"
      },
      x86 = {
        byol = "ami-0a3743778a9dfead0"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0d0134269b87de9a3"
      },
      x86 = {
        byol = "ami-0a93c0eb235a5f090"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0ea2ae8a23c838d59"
      },
      x86 = {
        byol = "ami-0210e681eeb5e4013"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-03df45afd4840e5f0"
      },
      x86 = {
        byol = "ami-057ff6e05a5e4c02c"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-03355374290f17764"
      },
      x86 = {
        byol = "ami-00eba787f74ed527e"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-08a8ace2c8e0d1569"
      },
      x86 = {
        byol = "ami-075cf9e9eeb238caa"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0a773588e99685428"
      },
      x86 = {
        byol = "ami-0d44c00c1cdb7e239"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0f4b0525265086e09"
      },
      x86 = {
        byol = "ami-09717bc479fb4e980"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0522ffdbb236ec8f3"
      },
      x86 = {
        byol = "ami-0a6c96cba65a6ede7"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0e40955e651c4f3c9"
      },
      x86 = {
        byol = "ami-0d89c7ca2f26c0cac"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-04c1bea3f043b9a7b"
      },
      x86 = {
        byol = "ami-08b2f986c78bafb1a"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-06056d0edf5c11ac3"
      },
      x86 = {
        byol = "ami-0a5fe904767d79f32"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-00f9c7974bbab17f7"
      },
      x86 = {
        byol = "ami-0edba153086057b63"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-066675560f15417a2"
      },
      x86 = {
        byol = "ami-03409dfad64c27199"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0a1a1968274086a1d"
      },
      x86 = {
        byol = "ami-0790c78a6e45a41bf"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-088f43827d63c1a6b"
      },
      x86 = {
        byol = "ami-017cda21dca915ee7"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0c8a4eccf96121cf2"
      },
      x86 = {
        byol = "ami-0c65495a083e345ea"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0a37e491b3502432f"
      },
      x86 = {
        byol = "ami-0943bfe56512b747d"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0dc7361544d6c3062"
      },
      x86 = {
        byol = "ami-057eec70818313753"
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
