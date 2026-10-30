//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

variable "az" {
  default = "eu-west-1a"
}

variable "vpcid" {
  description = "VPC ID"
  default     = "vpc-xxxxx"
}

variable "publiccidrid" {
  description = "Public Subnet ID"
  default     = "subnet-xxxxx"
}

variable "privatecidrid" {
  description = "Private Subnet ID"
  default     = "subnet-xxxxx"
}

variable "hasynccidrid" {
  description = "HASYNC Subnet ID"
  default     = "subnet-xxxxx"
}

variable "hamgmtcidrid" {
  description = "HAMGMT Subnet 1 AZ1 ID"
  default     = "subnet-xxxx"
}

variable "publicrttableid" {
  description = "FGTVM Public Route Table ID"
  default     = "rtb-xxxx"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, file.
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
// Either arm or x86
variable "arch" {
  default = "arm"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c6g.xlarge"
}

// AMIs for FGTVM-7.6.8
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        payg = "ami-0bc0aa67ac1aa125b"
        byol = "ami-0d195100d2015dd00"
      },
      x86 = {
        byol = "ami-076ec57e9d076ba4f"
        payg = "ami-0e2ce1f1e56971aff"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0a5aa6c400d102df3"
        payg = "ami-0e2d454a5b43218cd"
      },
      x86 = {
        byol = "ami-00e830822cbd28963"
        payg = "ami-01befa477e45374e7"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-064ebe3b9445a9bd3"
        payg = "ami-0fb8f6f01a14ba66a"
      },
      x86 = {
        byol = "ami-009cd02ce7491647b"
        payg = "ami-07a032d8cb5d6aaaa"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-00f1d7d25cd1e97c7"
        byol = "ami-0657d287b365dcfb1"
      },
      x86 = {
        payg = "ami-01262474951fbc075"
        byol = "ami-017a0876d0bcecc2c"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0299706da44245f13"
        payg = "ami-037cec4ba137695e0"
      },
      x86 = {
        payg = "ami-0834b93a3783922d0"
        byol = "ami-0c5914c110b979b6b"
      }
    },
    p-northeast-3 = {
      arm = {
        payg = "ami-05fca66ff429feaf5"
        byol = "ami-0efd0e146e83a2412"
      },
      x86 = {
        byol = "ami-055deaff0ac41c9bd"
        payg = "ami-0aab7e6c9bd559882"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-052a3cb5f1e866898"
        byol = "ami-0ff5f5e161949e39b"
      },
      x86 = {
        byol = "ami-0b31e9a33b820c178"
        payg = "ami-0d01f0893ec579469"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-07a571d424e7b7b38"
        payg = "ami-0b8b53e4bb9b05fc4"
      },
      x86 = {
        byol = "ami-01b8d021862c4e05a"
        payg = "ami-0e3050e86592a348b"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-03910d898031db4f0"
        byol = "ami-0764f33a6e161ab90"
      },
      x86 = {
        byol = "ami-0b06651cbc42dd8f5"
        payg = "ami-0dcdedc0fe3fa2c5a"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-062fa97d3b2a8677b"
        payg = "ami-0c45ca026321ec6aa"
      },
      x86 = {
        byol = "ami-0307e92651877dd57"
        payg = "ami-0624c980b0063dde6"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-086a8731f8fb8ee3c"
        payg = "ami-0e7224a3ad6e29834"
      },
      x86 = {
        byol = "ami-08a2736ea57f3725e"
        payg = "ami-0a7705bcc31470485"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-01e18fb9b5a336293"
        byol = "ami-0a6e5f8369dcfbda7"
      },
      x86 = {
        byol = "ami-00de982cde1d24d70"
        payg = "ami-027e0eb2755dff32a"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0b16f974135c5fa7a"
        payg = "ami-0fc6a558ec2ac4700"
      },
      x86 = {
        payg = "ami-08d08819a4f45ce95"
        byol = "ami-0f646d2410caa1c8b"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-08f05039368f651d1"
        payg = "ami-0a1b688dd4d8ede62"
      },
      x86 = {
        payg = "ami-0c0d9a522922876ec"
        byol = "ami-0bf0c3ac8c2195ab3"
      }
    },
    ap-southeast-7 = {
      arm = {
        payg = "ami-05d1d701ca498e1c5"
        byol = "ami-0800b373a774ada5b"
      },
      x86 = {
        payg = "ami-09de75832a0a5de35"
        byol = "ami-0a931b1256345dd43"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0525c95ff0efc6777"
        byol = "ami-07c3c9fcc7953b084"
      },
      x86 = {
        payg = "ami-01ae0c32cbeddcba6"
        byol = "ami-0fca31ca8c4ca084b"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-015e03cf4230d6faa"
        byol = "ami-0da168f472a163577"
      },
      x86 = {
        byol = "ami-0b709f29b72256e28"
        payg = "ami-0f942bdbb6fda36fb"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0416eebe469e1428a"
        payg = "ami-0cda66066d996ca53"
      },
      x86 = {
        byol = "ami-0504bd5b5d3aa05bf"
        payg = "ami-0af97f1b468332210"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-045693e7259ed6060"
        byol = "ami-081076e3a5a3ab6fc"
      },
      x86 = {
        payg = "ami-003b8ca2a6fc76480"
        byol = "ami-0184bd19128b32f8f"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-054208e9b307cc215"
        payg = "ami-0781918956c29f712"
      },
      x86 = {
        byol = "ami-0083ff30e562f9bd7"
        payg = "ami-0de00f83d0b0bb164"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-06d6b821991a06f6e"
        byol = "ami-0cef2989d7040b7ba"
      },
      x86 = {
        byol = "ami-01412c1dbd2f54615"
        payg = "ami-0b6877ef23a2d0483"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0812c194a92f55975"
        payg = "ami-0e62ff4c6033d00a6"
      },
      x86 = {
        payg = "ami-006d8bea1e5a44930"
        byol = "ami-085ac221184efe484"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0474fbc3c69b888d2"
        byol = "ami-0682f30a6d9fa0223"
      },
      x86 = {
        byol = "ami-01faf894a4325de60"
        payg = "ami-0ac487ed986f5c7f5"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0153b2c85c812a243"
        payg = "ami-04245418b6b942ccb"
      },
      x86 = {
        byol = "ami-01997e277ec3d2e2e"
        payg = "ami-01addb5362236c556"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-010f4af1e7c570e44"
        payg = "ami-0b805ba68174e6a68"
      },
      x86 = {
        byol = "ami-020171cca475b83a6"
        payg = "ami-06965cb600b5e31e4"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-00319a82eea130bd7"
        payg = "ami-0f331d5cc31461b17"
      },
      x86 = {
        payg = "ami-098f7a9c461e9e640"
        byol = "ami-0a32ac25cfc45ab78"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-08d357ef7681b3c21"
        payg = "ami-0b61f1117a8a90ca3"
      },
      x86 = {
        payg = "ami-06b2cff00da09bb53"
        byol = "ami-0f0d4745334d1d6ae"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-027775deb1895279d"
        byol = "ami-04ff85f5adabe6cb4"
      },
      x86 = {
        payg = "ami-0254514616b593730"
        byol = "ami-03e801faa05a5e1ce"
      }
    },
    us-east-1 = {
      arm = {
        payg = "ami-079d8be0287224781"
        byol = "ami-0ebab1eced4990a32"
      },
      x86 = {
        payg = "ami-0865b02333597a42d"
        byol = "ami-08be5557203480c12"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0b87254f7d5f02e18"
        byol = "ami-0d886c5e3067edf0e"
      },
      x86 = {
        byol = "ami-01261ba5b147f7ffc"
        payg = "ami-0c77d3acbf8d6e226"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-01031a649fc224236"
        byol = "ami-0484ba617077880c3"
      },
      x86 = {
        payg = "ami-015af1df6c3a3c132"
        byol = "ami-0f5f84e62b2970e99"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-02e8b52d037e16d61"
        byol = "ami-0f02b5720fdd2fa40"
      },
      x86 = {
        payg = "ami-0069d7e2042242835"
        byol = "ami-0c72dc71e9dd8a287"
      }
    }
  }
}



//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY>"
}

// HTTPS access port
variable "adminsport" {
  default = "8443"
}

variable "activeport1" {
  default = "20.1.0.10"
}

variable "activeport1float" {
  default = "20.1.0.12"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "20.1.1.10"
}

variable "activeport2float" {
  default = "20.1.1.12"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  default = "20.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "activeport4" {
  default = "20.1.3.10"
}

variable "activeport4mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  default = "20.1.0.11"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  default = "20.1.1.11"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  default = "20.1.2.11"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  default = "20.1.3.11"
}

variable "passiveport4mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "20.1.0.1"
}

variable "activeport4gateway" {
  default = "20.1.3.1"
}

variable "passiveport1gateway" {
  default = "20.1.0.1"
}

variable "passiveport4gateway" {
  default = "20.1.3.1"
}


variable "bootstrap-active" {
  // Change to your own path
  type    = string
  default = "config-active.conf"
}

variable "bootstrap-passive" {
  // Change to your own path
  type    = string
  default = "config-passive.conf"
}

//license files for the two fgts
variable "licenses" {
  // Change to your own byol license files
  type    = list(string)
  default = ["license.lic", "license2.lic"]
}

