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

// AMIs for FGTVM-7.4.11
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-02310b2cc7728ff44"
      },
      x86 = {
        byol = "ami-0a1305d2eba7d4e76"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0cdecbfcc78bda528"
      },
      x86 = {
        byol = "ami-0fb1993aefe65e62d"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-0b72cad51e941e444"
      },
      x86 = {
        byol = "ami-0c1e5a6a5425e8db8"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-02e0047843882213d"
      },
      x86 = {
        byol = "ami-084b747a673265bf0"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0d0d07659aaed6b12"
      },
      x86 = {
        byol = "ami-0aa5ba6aa42c18c51"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-02ad669a12e425586"
      },
      x86 = {
        byol = "ami-098d4e2a32d3bcf1f"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-078146772bd9be546"
      },
      x86 = {
        payg = "ami-0ea7440e5e942cc46"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0ee0b2064ebaf6f24"
      },
      x86 = {
        byol = "ami-0b845b263ef004f28"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-02f89cde7c4fee6d8"
      },
      x86 = {
        byol = "ami-065318bd4e6b654c6"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-065a485fbc6f1c911"
      },
      x86 = {
        byol = "ami-05e6c4e4fcd4f6707"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-067bad9536077a954"
      },
      x86 = {
        payg = "ami-0d964398915e15fae"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0dcad085c17a7fa2c"
      },
      x86 = {
        byol = "ami-064334d89f981fce8"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0e100b9e9e57c87cd"
      },
      x86 = {
        byol = "ami-01103d80b4d459435"
      }
    },
    ap-southeast-6 = {
      x86 = {
        byol = "ami-0cc2be0f02a37a617"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-04142f8f5ac1b5f7f"
      },
      x86 = {
        byol = "ami-095e531a48f4bdbc8"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-04668c363f1017b6c"
      },
      x86 = {
        byol = "ami-074ab884a9937736a"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-066cda828ddb1b24a"
      },
      x86 = {
        byol = "ami-0c3a2c63e96ccdedc"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-03fa13fa52896d807"
      },
      x86 = {
        byol = "ami-068f28332d7ded5d9"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-00ccbb16f04fd8ae8"
      },
      x86 = {
        byol = "ami-081849ebacff123eb"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-03f548556a62aa8cf"
      },
      x86 = {
        byol = "ami-0c0f2674714ee0bcc"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0eec02280ebfe7572"
      },
      x86 = {
        byol = "ami-093ae55a8b903b239"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-08cd8f6bd4c14acb4"
      },
      x86 = {
        byol = "ami-08e1e7dad15b48fa1"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0e77c9b106f6017b2"
      },
      x86 = {
        byol = "ami-0e6556ca4849429ef"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0db62b5dfa9ba6f48"
      },
      x86 = {
        byol = "ami-08018b80d99d6e09e"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0b170b63f694b5e81"
      },
      x86 = {
        byol = "ami-0039de58e6f01667c"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-01291155dda61ce19"
      },
      x86 = {
        byol = "ami-08f6953e672d33770"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0f1d1a1f7ce86d047"
      },
      x86 = {
        byol = "ami-0c0c5fb9366c4c0e2"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0a0b4c39ecb9ad0be"
      },
      x86 = {
        byol = "ami-05446c15b1d27e065"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-08e867e86d9544608"
      },
      x86 = {
        byol = "ami-065cb68fb1b65a184"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0c46c8361943be32f"
      },
      x86 = {
        byol = "ami-05892129fba1bc5c1"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-04917f87a9dbd3f62"
      },
      x86 = {
        byol = "ami-0e866d657b9f12bf7"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0d73af5563681a84b"
      },
      x86 = {
        byol = "ami-050e358da33f5811e"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0c9a90b9a344abecc"
      },
      x86 = {
        byol = "ami-0d75254a69d9f6c02"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-076727243c67e383d"
      },
      x86 = {
        byol = "ami-0cc3ea1f1bbf9a56f"
      }
    }
  }
}

// AMIs 
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
