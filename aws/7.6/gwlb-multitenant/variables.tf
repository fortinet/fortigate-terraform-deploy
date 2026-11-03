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

// AMIs for FGTVM-7.6.8
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-0d195100d2015dd00"
      },
      x86 = {
        byol = "ami-076ec57e9d076ba4f"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0a5aa6c400d102df3"
      },
      x86 = {
        byol = "ami-00e830822cbd28963"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-064ebe3b9445a9bd3"
      },
      x86 = {
        byol = "ami-009cd02ce7491647b"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0657d287b365dcfb1"
      },
      x86 = {
        byol = "ami-017a0876d0bcecc2c"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0299706da44245f13"
      },
      x86 = {
        byol = "ami-0c5914c110b979b6b"
      }
    },
    p-northeast-3 = {
      arm = {
        byol = "ami-0efd0e146e83a2412"
      },
      x86 = {
        byol = "ami-055deaff0ac41c9bd"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0ff5f5e161949e39b"
      },
      x86 = {
        byol = "ami-0b31e9a33b820c178"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-07a571d424e7b7b38"
      },
      x86 = {
        byol = "ami-01b8d021862c4e05a"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0764f33a6e161ab90"
      },
      x86 = {
        byol = "ami-0b06651cbc42dd8f5"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-062fa97d3b2a8677b"
      },
      x86 = {
        byol = "ami-0307e92651877dd57"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-086a8731f8fb8ee3c"
      },
      x86 = {
        byol = "ami-08a2736ea57f3725e"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0a6e5f8369dcfbda7"
      },
      x86 = {
        byol = "ami-00de982cde1d24d70"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0b16f974135c5fa7a"
      },
      x86 = {
        byol = "ami-0f646d2410caa1c8b"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-08f05039368f651d1"
      },
      x86 = {
        byol = "ami-0bf0c3ac8c2195ab3"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0800b373a774ada5b"
      },
      x86 = {
        byol = "ami-0a931b1256345dd43"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-07c3c9fcc7953b084"
      },
      x86 = {
        byol = "ami-0fca31ca8c4ca084b"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0da168f472a163577"
      },
      x86 = {
        byol = "ami-0b709f29b72256e28"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0416eebe469e1428a"
      },
      x86 = {
        byol = "ami-0504bd5b5d3aa05bf"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-081076e3a5a3ab6fc"
      },
      x86 = {
        byol = "ami-0184bd19128b32f8f"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-054208e9b307cc215"
      },
      x86 = {
        byol = "ami-0083ff30e562f9bd7"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0cef2989d7040b7ba"
      },
      x86 = {
        byol = "ami-01412c1dbd2f54615"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0812c194a92f55975"
      },
      x86 = {
        byol = "ami-085ac221184efe484"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0682f30a6d9fa0223"
      },
      x86 = {
        byol = "ami-01faf894a4325de60"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0153b2c85c812a243"
      },
      x86 = {
        byol = "ami-01997e277ec3d2e2e"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-010f4af1e7c570e44"
      },
      x86 = {
        byol = "ami-020171cca475b83a6"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-00319a82eea130bd7"
      },
      x86 = {
        byol = "ami-0a32ac25cfc45ab78"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-08d357ef7681b3c21"
      },
      x86 = {
        byol = "ami-0f0d4745334d1d6ae"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-04ff85f5adabe6cb4"
      },
      x86 = {
        byol = "ami-03e801faa05a5e1ce"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0ebab1eced4990a32"
      },
      x86 = {
        byol = "ami-08be5557203480c12"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0d886c5e3067edf0e"
      },
      x86 = {
        byol = "ami-01261ba5b147f7ffc"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0484ba617077880c3"
      },
      x86 = {
        byol = "ami-0f5f84e62b2970e99"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0f02b5720fdd2fa40"
      },
      x86 = {
        byol = "ami-0c72dc71e9dd8a287"
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
