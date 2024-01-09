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

// AMIs for FGTVM-7.4.2
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-04ce66e78ff5a4ef6"
      },
      x86 = {
        byol = "ami-023b1987e16a18b60"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0a1e00c98ae19897c"
      },
      x86 = {
        byol = "ami-025c7ab2a8a1dfa49"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-00c571443372aa6a8"
      },
      x86 = {
        byol = "ami-0124eb8ef6e5c283a"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0e3a7847a9aa624eb"
      },
      x86 = {
        byol = "ami-0d777364299515223"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-0b1c5f6533484a70c"
      },
      x86 = {
        byol = "ami-0f97cab8731ce41f3"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-04a7bc962fdd19bbf"
      },
      x86 = {
        byol = "ami-0afa71336fdf0e681"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0bdce6887321db07f"
      },
      x86 = {
        byol = "ami-0b08d78d60fa4cd71"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-01830e93b72325481"
      },
      x86 = {
        byol = "ami-0823a3569f30af8f8"
      }
    },
    ap-south-4 = {
      arm = {
        byol = "ami-0cbcf8f2ad29b2de8"
      },
      x86 = {
        byol = "ami-0920a1b3d41bc8f71"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-09df150b12917a755"
      },
      x86 = {
        byol = "ami-0afcb1664e5e8c725"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-08128b71709e6992f"
      },
      x86 = {
        byol = "ami-0acc5c073ded421e6"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-099aaf5111a810d59"
      },
      x86 = {
        byol = "ami-0ab05da220c15bcf0"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0b712c3adff6167d3"
      },
      x86 = {
        byol = "ami-0c3f47755ba6939f2"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0984b76f236478424"
      },
      x86 = {
        byol = "ami-0d31fcf38f166e16d"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0884d6ac05818ebe7"
      },
      x86 = {
        byol = "ami-018f653c813584b08"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0a2849369784ec679"
      },
      x86 = {
        byol = "ami-0cd2ce40017e2f5a2"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-06cdbd403c84d9149"
      },
      x86 = {
        byol = "ami-006569d5876e72b08"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-09d8f034dadcd3df1"
      },
      x86 = {
        byol = "ami-06b664d1b3aca5a87"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0a43904906c39bb05"
      },
      x86 = {
        byol = "ami-0b8481a08fe6afec4"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0a3088f8ae59f7b28"
      },
      x86 = {
        byol = "ami-0aec89d42c6e6e761"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-07dc962d73c169e1f"
      },
      x86 = {
        byol = "ami-05e0c4faa4d24ab58"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-046525f54a600dce5"
      },
      x86 = {
        byol = "ami-097a6056577d66e68"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-034bd7dabae6b987b"
      },
      x86 = {
        byol = "ami-0eca84214d4cf6895"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-059f3eba3e7c63246"
      },
      x86 = {
        byol = "ami-0b90d9316ce0daab9"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-00c00a9179f50cf0b"
      },
      x86 = {
        byol = "ami-040739f3f9479feb8"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-03444391e8842e6b2"
      },
      x86 = {
        byol = "ami-08c67d0c55223ebf9"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-04feba963372af61e"
      },
      x86 = {
        byol = "ami-085188e1ddbe43125"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-065d91967c9bd6a5d"
      },
      x86 = {
        byol = "ami-0f64e989009f155f4"
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
