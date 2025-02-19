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
  default = "<AWS IAM ROLE NAME>" //Put in the IAM Role name created
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
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "token"
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

// AMIs for FGTVM-7.4.7
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0c75aa2317d79188c"
        byol = "ami-0bd84b0f416715ebd"
      },
      x86 = {
        payg = "ami-0bb13418b95eb0b6f"
        byol = "ami-039bac10b2acd9396"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0577de86d41362ea3"
        byol = "ami-09dcbdcf976e866d0"
      },
      x86 = {
        payg = "ami-05d0267b6971d9de3"
        byol = "ami-0e79c5898c134cfac"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0132b2c7606ac832d"
        byol = "ami-0788b29446ee49641"
      },
      x86 = {
        payg = "ami-0d126e33de53c6261"
        byol = "ami-08da4442c22bb35aa"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-016f426c489c34815"
        byol = "ami-0c03fd8241d427575"
      },
      x86 = {
        payg = "ami-0437f38e24edbc4e1"
        byol = "ami-01c60f5f20149202c"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-097446a7b1ca2ffc9"
        byol = "ami-0979a6878b5774a31"
      },
      x86 = {
        payg = "ami-00c2fb226de2f52bd"
        byol = "ami-07be2ec61b3448992"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0761db8b9d0a7c5e7"
        byol = "ami-091180312106c0796"
      },
      x86 = {
        payg = "ami-0d22103f57f92de5e"
        byol = "ami-0826d0f6f376f515d"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0022fb90964e4f778"
        byol = "ami-0292f9191a3adc509"
      },
      x86 = {
        payg = "ami-0c02fc4754a37eecd"
        byol = "ami-04e35f47a110d764b"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-007de414bc10a92a8"
        byol = "ami-0955a0c6e73fe4dd8"
      },
      x86 = {
        payg = "ami-0e90dbd6d1e8e36e6"
        byol = "ami-0753eacc3f2e4449c"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-0a293308cd18b3406"
        byol = "ami-0b5e7174bd2d05a36"
      },
      x86 = {
        payg = "ami-0ce03c69db721e712"
        byol = "ami-027b2df23926e91da"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-07c8525d366e9d22d"
        byol = "ami-00e9680a7c7f5bf75"
      },
      x86 = {
        payg = "ami-0765dff3a2b2cdacd"
        byol = "ami-09f7e46c3693feb5d"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0cd64f9343338e6d6"
        byol = "ami-0890d34309251efc3"
      },
      x86 = {
        payg = "ami-0d244aab634f36a98"
        byol = "ami-0f773f6afe60479c9"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0ff6b7075474a2337"
        byol = "ami-0b596e808d95af8a5"
      },
      x86 = {
        payg = "ami-02c2c5e3230391c55"
        byol = "ami-041460262b23af7c4"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0581798b667041f97"
        byol = "ami-03d0dcd96d5244d16"
      },
      x86 = {
        payg = "ami-029b87864fc73e412"
        byol = "ami-0df272b797f94cc5c"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-011231696524b5e34"
        byol = "ami-0364bfbe68f9e1651"
      },
      x86 = {
        payg = "ami-05122eae6fbf872c3"
        byol = "ami-0000c8d304edf4697"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0c053d12c87a13d9f"
        byol = "ami-064d7507c6280a308"
      },
      x86 = {
        payg = "ami-0548d2654a773fd37"
        byol = "ami-0e4e71cec08bc21ab"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0dd74677be33e3ffd"
        byol = "ami-0fd4e2d70e88eae8b"
      },
      x86 = {
        payg = "ami-03679ae1df039b243"
        byol = "ami-0b8527bcead066265"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0e9508ac00bea8b96"
        byol = "ami-01c42a6127a4c4b9b"
      },
      x86 = {
        payg = "ami-0014bae9a642469e0"
        byol = "ami-0005cdd6c729588bd"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0257f67f15456d951"
        byol = "ami-0d7438e2b79613141"
      },
      x86 = {
        payg = "ami-012336e4cb471532c"
        byol = "ami-0248a69c0afa7c2e5"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-008c95d98ff06a327"
        byol = "ami-0b03c068f0af89bff"
      },
      x86 = {
        payg = "ami-0f0ce4d08b8b949c1"
        byol = "ami-014e9d84ff94d7937"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-011e65c1b695ba344"
        byol = "ami-0e519a985110abd46"
      },
      x86 = {
        payg = "ami-024c96e7dd87fdc6d"
        byol = "ami-0b271dd174263574c"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0c6f8f476bf7d7117"
        byol = "ami-02595ba0680c67cb0"
      },
      x86 = {
        payg = "ami-02969fef5c4e13f43"
        byol = "ami-01e4c3cef50e486aa"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0cae6b912e832c604"
        byol = "ami-0fb3ef105d3919e25"
      },
      x86 = {
        payg = "ami-02a7f354664cb6acf"
        byol = "ami-0066c052ad5865ce6"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0a4d4c59569bae2dc"
        byol = "ami-03f538df0dd0d163e"
      },
      x86 = {
        payg = "ami-0545aa613fbcfe83c"
        byol = "ami-00e09ae9532c6d8a4"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-0b996096fb6882cb5"
        byol = "ami-02262ca02c1e4f5f0"
      },
      x86 = {
        payg = "ami-0b7d1dbab70385220"
        byol = "ami-0421f160a085678da"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-07f688da3114c6254"
        byol = "ami-0b3cb8e68da11fe2c"
      },
      x86 = {
        payg = "ami-00dd7776d96599895"
        byol = "ami-0cc670db734faaaa5"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-039a22d85eba42db3"
        byol = "ami-0080e2582b2d35411"
      },
      x86 = {
        payg = "ami-0d1931ae94c1feaac"
        byol = "ami-05c6ceba4f447a0c3"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0f65179419a9b54de"
        byol = "ami-085d977a649ecb0e6"
      },
      x86 = {
        payg = "ami-09e839f5719228a99"
        byol = "ami-03e15ffcdc6039c95"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-03b6a9ba148325a1c"
        byol = "ami-01596703716b936a1"
      },
      x86 = {
        payg = "ami-00f556a4510772599"
        byol = "ami-013b7f71dec219d50"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0272c433f6b2b3598"
        byol = "ami-0003920db723d430c"
      },
      x86 = {
        payg = "ami-0f8fe8de99bb5bea6"
        byol = "ami-04ec669fc69e86210"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0c4283c2d6049c597"
        byol = "ami-0d9bf16589c550b59"
      },
      x86 = {
        payg = "ami-0846892c14c304128"
        byol = "ami-06246e80854aeacc3"
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

