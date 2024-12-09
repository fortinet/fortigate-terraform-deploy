//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

// Availability zone 1 for the region
variable "az1" {
  default = "eu-west-1a"
}

// Availability zone 2 for the region
variable "az2" {
  default = "eu-west-1c"
}

variable "vpccidr" {
  default = "20.1.0.0/16"
}

variable "publiccidraz1" {
  default = "20.1.0.0/24"
}

variable "privatecidraz1" {
  default = "20.1.1.0/24"
}

variable "hasynccidraz1" {
  default = "20.1.2.0/24"
}

variable "hamgmtcidraz1" {
  default = "20.1.3.0/24"
}

variable "publiccidraz2" {
  default = "20.1.10.0/24"
}

variable "privatecidraz2" {
  default = "20.1.11.0/24"
}

variable "hasynccidraz2" {
  default = "20.1.12.0/24"
}

variable "hamgmtcidraz2" {
  default = "20.1.13.0/24"
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
  default = "x86"
}

// instance type needs to match the architect
// c5.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5.xlarge"
}

// AMIs for FGTVM-7.6.1
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0fcc3c864914a6bbd"
        byol = "ami-015d206cf4d0248c0"
      },
      x86 = {
        payg = "ami-0337c73411330e400"
        byol = "ami-08af434d4f7a67d23"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0434460c7f4069fff"
        byol = "ami-0e88f00ba85e75d60"
      },
      x86 = {
        payg = "ami-02b90a51345912dfb"
        byol = "ami-00379d5a1deba1773"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0ebe64d481b6b1bcd"
        byol = "ami-0851e6495ad3a405d"
      },
      x86 = {
        payg = "ami-03399b9e23f7b7108"
        byol = "ami-0f2bd186b60ffdc2f"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-00723df2b4dcd60a7"
        byol = "ami-0b744cfb916ded4dd"
      },
      x86 = {
        payg = "ami-087be46f183decec8"
        byol = "ami-061dc9e399349b5a5"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-016e583fde4b7797a"
        byol = "ami-0f71b38cc401b685d"
      },
      x86 = {
        payg = "ami-0718c5ad0cea5a533"
        byol = "ami-0f593a212bab92986"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-06fb41341d9ba5777"
        byol = "ami-0da484568d0134063"
      },
      x86 = {
        payg = "ami-0dac382b584da8605"
        byol = "ami-0b843a15dace180ca"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-07c61146f2a3acef0"
        byol = "ami-088d7dd6e52c17aaf"
      },
      x86 = {
        payg = "ami-028dfff2220a6da89"
        byol = "ami-05c58c82a0a7b1d45"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-06db65fda59bef060"
        byol = "ami-05a3b5f830c5d36f4"
      },
      x86 = {
        payg = "ami-0ebb6ccb3f87e191b"
        byol = "ami-0b15fecb31d798054"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-011c3c145e0757160"
        byol = "ami-0697ce022c29a2f0a"
      },
      x86 = {
        payg = "ami-00e7ed377a3c199bc"
        byol = "ami-04848e4a858c61a2c"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0418fb158dc779ae6"
        byol = "ami-0a459284aca7bd873"
      },
      x86 = {
        payg = "ami-02eef288808156c61"
        byol = "ami-03dbfe66309796971"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-00b36ad720a2cdc02"
        byol = "ami-03c1a3ffd4e470e0e"
      },
      x86 = {
        payg = "ami-0075b5bffc0d84616"
        byol = "ami-010cf5073c1d9fa55"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-078c0c1fa46de04af"
        byol = "ami-00161f77cdd45ac44"
      },
      x86 = {
        payg = "ami-0b3879c34b3ec86eb"
        byol = "ami-0414e8998ef138de7"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-05a1132acf7956559"
        byol = "ami-0f22e9998e5ba593b"
      },
      x86 = {
        payg = "ami-0c6403eed927f6827"
        byol = "ami-0ebe5ecbfd0bf7821"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0f263f1600bbb5276"
        byol = "ami-0097c1fc138aa69ba"
      },
      x86 = {
        payg = "ami-048ba8efb0ba823c0"
        byol = "ami-0dac030dd3f362225"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-012e6dca15dcf4e1e"
        byol = "ami-0b92dae2e95cfe666"
      },
     x86 = {
        payg = "ami-01695cca9b575fe00"
        byol = "ami-0b539fd4301b13bd9"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-023175f24d2821af0"
        byol = "ami-0cc83ec7d19ec55d8"
      },
      x86 = {
        payg = "ami-0544910a68d55b795"
        byol = "ami-043e38d0b2fe1b424"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0381f55f35aecc97d"
        byol = "ami-0f70c42cf44cabc5f"
      },
      x86 = {
        payg = "ami-0959a18d9d8856544"
        byol = "ami-001f3c7653f62014c"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-02a159ac34f23c47e"
        byol = "ami-024f0f49dfb49188c"
      },
      x86 = {
        payg = "ami-00cd8e332fc79f24c"
        byol = "ami-0ba75afb849c6acab"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-040864a82c55c05ed"
        byol = "ami-059314d32be53f7b3"
      },
      x86 = {
        payg = "ami-08b330fc195783ede"
        byol = "ami-00e56c7dd9a530a9e"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-04f7025189d163685"
        byol = "ami-0969e520ab5d295a0"
      },
      x86 = {
        payg = "ami-079d298c01abcc909"
        byol = "ami-098b1172a88f3937c"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-071fd864f7d7734a3"
        byol = "ami-0b2380d71a0f2278c"
      },
      x86 = {
        payg = "ami-09b61ccd62f535a32"
        byol = "ami-03eafc3546870d115"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-07ffcb95e9cd77045"
        byol = "ami-08005bc6393bc7ba1"
      },
      x86 = {
        payg = "ami-09ea4f17a5cc66046"
        byol = "ami-056bcf822545a4817"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0c8e1145d77a803b8"
        byol = "ami-0d3d4be66f18007b2"
      },
      x86 = {
        payg = "ami-06eae2bdb8e8509ee"
        byol = "ami-04e011cc5c8327ff3"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-0e000b33131254655"
        byol = "ami-059a21dc68956c192"
      },
      x86 = {
        payg = "ami-06680dd8a90622296"
        byol = "ami-0bc6b4afe7e6f6c71"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-004c1b32a8019d96f"
        byol = "ami-0a5a9d97afcb2d7ca"
      },
      x86 = {
        payg = "ami-019207a9eb8479648"
        byol = "ami-043ca4b94aba11d35"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0b8e34a34288da70a"
        byol = "ami-06a81b0d0e7f2b392"
      },
      x86 = {
        payg = "ami-0e66e61d9b46546d6"
        byol = "ami-069ae4b787dd51ba3"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0a697e97acd47d49f"
        byol = "ami-0be2a076c8a6db884"
      },
      x86 = {
        payg = "ami-0a761365177c1daff"
        byol = "ami-062e4de767375245d"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0db99cbbc078980d2"
        byol = "ami-0ff7dd67d270fb847"
      },
      x86 = {
        payg = "ami-03544578146afd343"
        byol = "ami-0bf14aeb9991049df"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0b6502a990e285e0c"
        byol = "ami-06f79574cb34962f5"
      },
      x86 = {
        payg = "ami-066f9b0b5d1cdf423"
        byol = "ami-0b599ccbf7708fd4a"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-00a9c0a50718b02bb"
        byol = "ami-06f666395ac3b7908"
      },
      x86 = {
        payg = "ami-07d5eacb6b33f97f0"
        byol = "ami-0c83a4becd17d27c8"
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

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "20.1.1.10"
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
  default = "20.1.10.10"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  default = "20.1.11.10"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  default = "20.1.12.10"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  default = "20.1.13.10"
}

variable "passiveport4mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "20.1.0.1"
}

variable "activeport2gateway" {
  default = "20.1.1.1"
}

variable "activeport4gateway" {
  default = "20.1.3.1"
}

variable "passiveport1gateway" {
  default = "20.1.10.1"
}

variable "passiveport2gateway" {
  default = "20.1.11.1"
}

variable "passiveport4gateway" {
  default = "20.1.13.1"
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

