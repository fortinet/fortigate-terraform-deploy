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

variable "attachcidraz1" {
  default = "10.1.2.0/24"
}

variable "gwlbcidraz1" {
  default = "10.1.3.0/24"
}

variable "publiccidraz2" {
  default = "10.1.4.0/24"
}

variable "privatecidraz2" {
  default = "10.1.5.0/24"
}

variable "attachcidraz2" {
  default = "10.1.6.0/24"
}

variable "gwlbcidraz2" {
  default = "10.1.7.0/24"
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
  default = "30.1.0.0/16"
}

variable "cs2publiccidraz1" {
  default = "30.1.0.0/24"
}

variable "cs2privatecidraz1" {
  default = "30.1.1.0/24"
}


variable "cs2publiccidraz2" {
  default = "30.1.2.0/24"
}

variable "cs2privatecidraz2" {
  default = "30.1.3.0/24"
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


// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}


// AMIs for FGTVM-7.2.6
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0afaf2dafb7266d5f"
        byol = "ami-0871857100fc81ab1"
      },
      x86 = {
        payg = "ami-0e479e0dee42ce576"
        byol = "ami-0cdc9a8504cafb915"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-004041edb997bf2a6"
        byol = "ami-0802189f0e33e4520"
      },
      x86 = {
        payg = "ami-0bc6b124762292ad3"
        byol = "ami-0fbf322acaf83b2ef"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0c9e0ced3c2d4b6bf"
        byol = "ami-065d5233ca0041616"
      },
      x86 = {
        payg = "ami-0df235b48e59a6256"
        byol = "ami-030e1a9531587961e"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-086a289bf181429c5"
        byol = "ami-0eeda905f669b21ab"
      },
      x86 = {
        payg = "ami-0acc8f844641b2eeb"
        byol = "ami-037c4b0e4727a88d0"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-01973d42019f49487"
        byol = "ami-02d55ff21b1527c0f"
      },
      x86 = {
        payg = "ami-04907597a8c096402"
        byol = "ami-06fa54cf77868b310"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0a5c2d38f46202674"
        byol = "ami-0906c55258220d934"
      },
      x86 = {
        payg = "ami-064037a2dba3ca247"
        byol = "ami-00592fb0a3ef66225"
      }
    },
     ap-south-2 = {
      arm = {
        payg = "ami-07e6ed8cbfabdee55"
        byol = "ami-0b125c1a60792614d"
      },
      x86 = {
        payg = "ami-02e2c77dcb1999e5c"
        byol = "ami-078f26c0cb2e918be"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0f76aaadb4c7be27a"
        byol = "ami-088d8d87aca24e5ed"
      },
      x86 = {
        payg = "ami-01975bd36d540ab8a"
        byol = "ami-0978dab0a76ad9fd5"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-02d128271d0b8fa34"
        byol = "ami-0558a37db5d74a332"
      },
      x86 = {
        payg = "ami-02a822d719bc22eea"
        byol = "ami-0cd8b92e698cb12fa"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-07d4b161e804f9dc2"
        byol = "ami-026aff07e6fa949d0"
      },
      x86 = {
        payg = "ami-0f767b08d6660a025"
        byol = "ami-0d034c35ee64d402b"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-011de8fc2ab98bc8e"
        byol = "ami-0e47a6e60581afdf5"
      },
      x86 = {
        payg = "ami-0dec61302ae0c018d"
        byol = "ami-0bf0af456a29b999b"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0184819d27f4b7eb9"
        byol = "ami-0eeebdea4d9fb91eb"
      },
      x86 = {
        payg = "ami-06a4711845981ae20"
        byol = "ami-037d8c8ca55cec3c3"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-04b92047dfe30df54"
        byol = "ami-0773f912f83a71c5a"
      },
      x86 = {
        payg = "ami-06009727ea038e06f"
        byol = "ami-0c69efc4acf02b459"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0d05c4bf7c13c076a"
        byol = "ami-019b2a6a310e340c6"
      },
      x86 = {
        payg = "ami-02152a950c6162756"
        byol = "ami-0ed920a7f9317f3ca"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0281831d8f733d7d9"
        byol = "ami-0918eb8a8241859e3"
      },
      x86 = {
        payg = "ami-08353b65cad093dcf"
        byol = "ami-0995eef46edeabfe3"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0775b23a332858db6"
        byol = "ami-0c234aac9b99a1769"
      },
      x86 = {
        payg = "ami-085a3c7d21fe9fd68"
        byol = "ami-09ed4da5cf4d7f263"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0f8f9907f7781b808"
        byol = "ami-01ef53b85b9b93525"
      },
      x86 = {
        payg = "ami-0abdea3d450cbb451"
        byol = "ami-0a41fcafade74e0c4"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-00ec5a4f43faefa61"
        byol = "ami-0d5f25146852ef9c4"
      },
      x86 = {
        payg = "ami-08543bae29d70325e"
        byol = "ami-09f76e1a1ada23d65"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-01306d971ee29468b"
        byol = "ami-038fc19aa05c4a149"
      },
      x86 = {
        payg = "ami-04afad39d9deab4b6"
        byol = "ami-016a725c3e8d4f3ce"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0217ed0ca6144d89a"
        byol = "ami-0565c573063f35f76"
      },
      x86 = {
        payg = "ami-05b68d5d764c48db4"
        byol = "ami-0d92a1dbfe24a64be"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-08b0fe2a7db5fd7d6"
        byol = "ami-0229a03bbc859e264"
      },
      x86 = {
        payg = "ami-08bfe47f92bd343aa"
        byol = "ami-0db46491bc62a208a"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-076cb0b7bb3aa5c14"
        byol = "ami-0480869d215bb4ef4"
      },
      x86 = {
        payg = "ami-0b0b511a8af3d62be"
        byol = "ami-0de25989bd7b82089"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-02922c9c74673564f"
        byol = "ami-0c766499884f472d0"
      },
      x86 = {
        payg = "ami-0570ef6bbc78d0ebf"
        byol = "ami-0b142cce02cff97b7"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-03f18def94c29fb10"
        byol = "ami-0aab83cd5c97fbb1e"
      },
      x86 = {
        payg = "ami-0b1d2e6427c899650"
        byol = "ami-03d2b90cb72a07ac2"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0192768552a14eb9d"
        byol = "ami-0c0f3e199c7d976fd"
      },
      x86 = {
        payg = "ami-0a5657d14d6704961"
        byol = "ami-09d8a16bda0d7acc6"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-012f8ec27963b879a"
        byol = "ami-0c679427dbcf3ae75"
      },
      x86 = {
        payg = "ami-09d957d63153e1fcb"
        byol = "ami-01493a5360c5dcbfc"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0ea231d777203eace"
        byol = "ami-003ba7af90ef6b564"
      },
      x86 = {
        payg = "ami-0a21039a6264f39d9"
        byol = "ami-044ccbdeba881a211"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0cf9094f421862d09"
        byol = "ami-0d0d2111a6f54d46f"
      },
      x86 = {
        payg = "ami-0d2e292d5d32ce85b"
        byol = "ami-0e083eeb9a32a3844"
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

variable "bootstrap-fgtvm2" {
  // Change to your own path
  type    = string
  default = "fgtvm2.conf"
}

// license file for the fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the fgt 2
variable "license2" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license2.lic"
}
