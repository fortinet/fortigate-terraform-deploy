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


// AMIs for FGTVM-7.4.1
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-003c670ea14ca1ddd"
      },
      x86 = {
        byol = "ami-099d4a104989ffc30"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-08761a2fa9123398d"
      },
      x86 = {
        byol = "ami-06d82c2a5a0f7ba5c"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0e73e415493c851fc"
      },
      x86 = {
        byol = "ami-0bb6c638f427dc4ee"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0e36a1fb1ee12a870"
      },
      x86 = {
        byol = "ami-0eb3cf4f68aef5893"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-0b67d4660743e5671"
      },
      x86 = {
        byol = "ami-0e3f98c56d6e38095"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-05920a92b85d29e89"
      },
      x86 = {
        byol = "ami-024602eacf11a8f32"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0d765ce635b884a97"
      },
      x86 = {
        byol = "ami-0a8e79fc82a565193"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-05250bd663412091e"
      },
      x86 = {
        byol = "ami-04f569df951f85dd8"
      }
    },
    ap-south-4 = {
      arm = {
        byol = "ami-0d850a046a82aac65"
      },
      x86 = {
        byol = "ami-0de1c161cea9d07aa"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-023350efda02b00b7"
      },
      x86 = {
        byol = "ami-0f8d9dbbff66aa759"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-0e0e6cede811be00d"
      },
      x86 = {
        byol = "ami-02dfe655aaa678a8f"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-00964b9388981cc6f"
      },
      x86 = {
        byol = "ami-0cbc006e2efe79fd2"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-045cb53d446427af0"
      },
      x86 = {
        byol = "ami-090038ec6bb5ff8a5"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-05ded2192c9400322"
      },
      x86 = {
        byol = "ami-0717c04b59312c955"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0e87b198f90fc0888"
      },
      x86 = {
        byol = "ami-07147354f59e13667"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-03137e7b37894614a"
      },
      x86 = {
        byol = "ami-0916a499d613b6c14"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0b70af841e7c3737c"
      },
      x86 = {
        byol = "ami-0730a57b4eba00239"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0d68c6720c07a4209"
      },
      x86 = {
        byol = "ami-0bf160b007a77d3f9"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-022010f7f67d09534"
      },
      x86 = {
        byol = "ami-0df0a1100a7b5a14c"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-090e2c1f4e290a8cf"
      },
      x86 = {
        byol = "ami-0f6d7a43197432b64"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0f710101fec4e5a58"
      },
      x86 = {
        byol = "ami-0dec21d30709b60d6"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0d72300644f194742"
      },
      x86 = {
        byol = "ami-03fdde9ae6d061e09"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-09f8a55a60ddecd28"
      },
      x86 = {
        byol = "ami-02c718d89de742b97"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0314a5393c5839ee4"
      },
      x86 = {
        byol = "ami-0468b0af8a31ad2f7"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0a7e78877b6b4930e"
      },
      x86 = {
        byol = "ami-0420673c9cc89184b"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0892a7d3197f12e25"
      },
      x86 = {
        byol = "ami-04070dcc5dc2de453"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-06b60f82efbc723a1"
      },
      x86 = {
        byol = "ami-08c337b705abbd0d5"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0776f337102e26996"
      },
      x86 = {
        byol = "ami-0f60ad809291f9eb4"
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
