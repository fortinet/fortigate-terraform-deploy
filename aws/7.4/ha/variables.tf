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

// IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>"    //Put in the IAM Role name created
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

// instance architect
// Either arm or x86
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.4.0
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-06e3c91359990ffe7"
        byol = "ami-021b56da1d6c1aeec"
      },
      x86 = {
        payg = "ami-059d36a8887155edb"
        byol = "ami-0b8f59ecef2c7b3c7"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-08da0f3f241a08578"
        byol = "ami-0d5ea61acd6bf9476"
      },
      x86 = {
        payg = "ami-06bc98ab2e7292d62"
        byol = "ami-010ad23a69290d22a"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0661f905965b2ca5c"
        byol = "ami-03026d4235ca1e41a"
      },
      x86 = {
        payg = "ami-033d3e55ad5786e8c"
        byol = "ami-0e0094632333747a6"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0157bfb8acffa1e52"
        byol = "ami-0b67089acc9803c34"
      },
      x86 = {
        payg = "ami-0e9df54e982f0b95d"
        byol = "ami-03dc44741f19fd88e"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-044e4193e5cb4ed70"
        byol = "ami-0b10880ac9c0555dd"
      },
      x86 = {
        payg = "ami-00bcb8cd55791dfc5"
        byol = "ami-0f4e7b8f1aea63878"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-02e2f06d1eab65399"
        byol = "ami-08907cc7df7db463c"
      },
      x86 = {
        payg = "ami-0bae5f6ab54664346"
        byol = "ami-08e7e30ecee87be1c"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-006f1bc99dbe0698f"
        byol = "ami-073ef556a7a10d643"
      },
      x86 = {
        payg = "ami-0a7257dfd23ba55f5"
        byol = "ami-0633e3f18ac7ae987"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0399c1c042bfb2854"
        byol = "ami-05abd2db8a87bdb96"
      },
      x86 = {
        payg = "ami-02f3189a4ec9e039e"
        byol = "ami-0db6f58e41efd0676"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-050b1765c5b4d514c"
        byol = "ami-02d8c15340e4a9aec"
      },
      x86 = {
        payg = "ami-033f084fdc040d3ae"
        byol = "ami-085b34927e5b0d0c6"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0434af6cabfebd5fe"
        byol = "ami-05bc309c2506b1835"
      },
      x86 = {
        payg = "ami-0de094fd2bb682123"
        byol = "ami-0316c604deee5a7a5"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0433f9a734dfb3de4"
        byol = "ami-048426aa09b9b68a4"
      },
      x86 = {
        payg = "ami-017d7dadcac8a5c9f"
        byol = "ami-0404384f7eb043430"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0429f2bf5343882ec"
        byol = "ami-019ecd4ccd2781385"
      },
      x86 = {
        payg = "ami-09692eb6064201eec"
        byol = "ami-070ebf1937d82dabb"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-07f087774e86fec56"
        byol = "ami-0a78aca6670615572"
      },
      x86 = {
        payg = "ami-04add78aafe386147"
        byol = "ami-02ec01d79dc0539aa"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-09565d6692820e71f"
        byol = "ami-0680f32ad167fe326"
      },
      x86 = {
        payg = "ami-08aa1f3d6b6c43747"
        byol = "ami-0972a5dadb4c5fb1c"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-050377efa504afc99"
        byol = "ami-0d8b5c3ceb8712640"
      },
      x86 = {
        payg = "ami-031e9298bdda5f59c"
        byol = "ami-0475f5b8ebc18cc54"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-032bc2ec2bce29f9b"
        byol = "ami-0f7d6d35ad2b76568"
      },
      x86 = {
        payg = "ami-0c323826438c86a3b"
        byol = "ami-081cf57cdce2c31b6"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-02e72345a5fc48438"
        byol = "ami-0bbb1793298b8e32a"
      },
      x86 = {
        payg = "ami-0f5b16ee38c416d3e"
        byol = "ami-0030106809410fb04"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-087abdeefe46659af"
        byol = "ami-0e74fbbd997fa49c1"
      },
      x86 = {
        payg = "ami-0af1c9f9828e0ac50"
        byol = "ami-05fd0b2ae18beaeb9"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0b8c3ad56ebc15eaa"
        byol = "ami-0b12844236013fd01"
      },
      x86 = {
        payg = "ami-02ea27a269dbf0d88"
        byol = "ami-0756cb6100f26c7e8"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-015e8f0c23d38327f"
        byol = "ami-053e35644c7f233d9"
      },
      x86 = {
        payg = "ami-02769e9ccad124389"
        byol = "ami-08395b4eafe53a06a"
      }
    },
     me-south-1 = {
      arm = {
        payg = "ami-0863759c8b872a2d2"
        byol = "ami-048b46d03fadb2b17"
      },
      x86 = {
        payg = "ami-028b61ba0586b59ff"
        byol = "ami-022969d6e39067bd8"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-063d7c9b21af7969a"
        byol = "ami-0926da1f5b01f18fa"
      },
      x86 = {
        payg = "ami-0df6461e983f0f521"
        byol = "ami-0363b7f2f7c436e61"
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

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the passive fgt
variable "license2" {
  // Change to your own byol license file, license2.lic
  type    = string
  default = "license2.lic"
}

