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
// Either x86
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.2.3
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-05b4423af4da62202"
        byol = "ami-0e336a837d96589e7"
      },
      x86 = {
        payg = "ami-0a90787e45394d6a3"
        byol = "ami-0b7f92a0925f255d1"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0a65fcf7ff53b24c9"
        byol = "ami-00e6b18b3fbe97cc6"
      },
      x86 = {
        payg = "ami-0498a9364c3b7cb77"
        byol = "ami-0c7872032bd7dab67"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0e45bd739c3acc7da"
        byol = "ami-08817974a8c6dc6f3"
      },
      x86 = {
        payg = "ami-000db587ef3d35447"
        byol = "ami-097e89f77dde9b7bd"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0af38b79946ee9181"
        byol = "ami-08ef609bfa5a7fa90"
      },
      x86 = {
        payg = "ami-0b3a9dbce4f4ff1b0"
        byol = "ami-0cb65128e5fbe4772"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-008d383e1bac3ef49"
        byol = "ami-0e7bd0e68d0e322fa"
      },
      x86 = {
        payg = "ami-06353c284a8ce1721"
        byol = "ami-07dd6ed89fb5739e0"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0ebc2b24a66d5ba3c"
        byol = "ami-0d40d2f30c3adfffb"
      },
      x86 = {
        payg = "ami-0b8dfae08067acdad"
        byol = "ami-00e1c266bc194c900"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-08b00ba2d391fdf6c"
        byol = "ami-0c64c4b4de89ea07a"
      },
      x86 = {
        payg = "ami-0a423117c2f585a41"
        byol = "ami-0bf290b6cbcdd5cc5"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-030b599b1946794b7"
        byol = "ami-0189ae16c26ce17a8"
      },
      x86 = {
        payg = "ami-03b3ee6e35c8ec4ca"
        byol = "ami-04752c9e6c29e31ec"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0de73599552397fde"
        byol = "ami-0df115204736c914a"
      },
      x86 = {
        payg = "ami-07277a4b7cd874be0"
        byol = "ami-030d2a2514796112d"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0fcd08eb0603694c1"
        byol = "ami-0e0453203ea6c1709"
      },
      x86 = {
        payg = "ami-0453a6b4bcdde92e6"
        byol = "ami-04a837b6c18f831b2"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0955837d14744a878"
        byol = "ami-04d4154ed6c45f3c5"
      },
      x86 = {
        payg = "ami-0c1fb2b5f6cd63373"
        byol = "ami-0bc024ab057b9c420"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-00e31084ed4c6bb4f"
        byol = "ami-050fe5cf6b6c7ce57"
      },
      x86 = {
        payg = "ami-0115d006c0c4bf75a"
        byol = "ami-03e4d0f51fe53e698"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-08cd6115e71b7f376"
        byol = "ami-0d8c2ada103a8b6d6"
      },
      x86 = {
        payg = "ami-044ad1e9a0655822c"
        byol = "ami-07480128cc4852a68"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0f47ae8a049debbca"
        byol = "ami-0f923d7726c4f3b16"
      },
      x86 = {
        payg = "ami-03c1ca58095f053ac"
        byol = "ami-0efa3f7c2ad9e96f5"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-078c2c0ec5270d139"
        byol = "ami-0e597d4ccdc90e15c"
      },
      x86 = {
        payg = "ami-01ae0421a1137eb4a"
        byol = "ami-08c0acbcf14569aa0"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0977429a90f5a3642"
        byol = "ami-0564b1a80052f61b7"
      },
      x86 = {
        payg = "ami-0cb49778c9484e291"
        byol = "ami-0b8f8362dd5951104"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-036b25acf96eb3f84"
        byol = "ami-0a8d6bf390391aa22"
      },
      x86 = {
        payg = "ami-0cf32751817ec5915"
        byol = "ami-0b14302a4bc11b458"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0e6ad4e028f354730"
        byol = "ami-0fc8572f730279857"
      },
      x86 = {
        payg = "ami-07ddecb23030655e9"
        byol = "ami-0108980d248398b15"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0f3fc53af23ee09f1"
        byol = "ami-0635aa86cf73f0b4d"
      },
      x86 = {
        payg = "ami-0dd5777adef9dafe3"
        byol = "ami-092d61822e4c6b7bb"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-035ae451491d5585c"
        byol = "ami-08a7d2a30f93e06b7"
      },
      x86 = {
        payg = "ami-0dba058f267b1d293"
        byol = "ami-0f79b72dba5a5cc71"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-011c3a88abc11acf5"
        byol = "ami-0dcc138ac5c5b2bcc"
      },
      x86 = {
        payg = "ami-0666b16163d2d27b5"
        byol = "ami-08e945b555ba8613e"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0bd0bd2c84b6fe8f4"
        byol = "ami-09a8e1c5a5095c14b"
      },
      x86 = {
        payg = "ami-0dcc449f9ffb92bb2"
        byol = "ami-09f9b3f1ec10c92d4"
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
