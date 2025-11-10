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
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.0.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-on-aws-between-multiple-zones
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

variable "hasyncmgmtcidraz1" {
  default = "20.1.2.0/24"
}

variable "publiccidraz2" {
  default = "20.1.10.0/24"
}

variable "privatecidraz2" {
  default = "20.1.11.0/24"
}

variable "hasyncmgmtcidraz2" {
  default = "20.1.12.0/24"
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
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.0.17
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-009d7d285c6ae55a2"
        payg = "ami-0fee24de9a875ef8c"
      },
      x86 = {
        byol = "ami-0a622967a8f987161"
        payg = "ami-0f8b504cec1bccd68"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-048cc8480c25ae35d"
        payg = "ami-0acdc7c3e4c287921"
      },
      x86 = {
        byol = "ami-0885c0c966271422a"
        payg = "ami-0b0a800f5a3450988"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-054a71408867a9f20"
        byol = "ami-0ac961e41d08909b0"
      },
      x86 = {
        byol = "ami-0464ebc53d463e781"
        payg = "ami-0bfc01f6d69e6da9f"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0b2d10d3ccd075b94"
        payg = "ami-0f1a9d1065d96f4d2"
      },
      x86 = {
        payg = "ami-0b2906cfbbaa9deef"
        byol = "ami-0f7b1bac890d71442"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-04acd95e10c05d931"
        payg = "ami-0e640bf070c157b7f"
      },
      x86 = {
        byol = "ami-09a837857ca3fd994"
        payg = "ami-0a0696c0606cb61c0"
      }
    },
    p-south-1 = {
      arm = {
        byol = "ami-02285bd34991e3c7f"
        payg = "ami-0da9828b2b5af1093"
      },
      x86 = {
        byol = "ami-05ab097d5220dd3ae"
        payg = "ami-095491f19cc181680"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0067ba4d1cb71b0b8"
        payg = "ami-070ebfd3eb270c4c8"
      },
      x86 = {
        payg = "ami-063f30e4e71209e7a"
        byol = "ami-0c36f1547319d9cbf"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-081a940dba323e239"
        payg = "ami-0b5474c7332599811"
      },
      x86 = {
        byol = "ami-0068c8ccf43740736"
        payg = "ami-0a9a07568d37299fc"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-01aa4b7407470e005"
        payg = "ami-07e9f818f374e8c5d"
      },
      x86 = {
        byol = "ami-0970d1be3dc5930f4"
        payg = "ami-0dee136136a31f2af"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0682aac7cee8c762b"
        payg = "ami-08888b3493f7f7860"
      },
      x86 = {
        payg = "ami-0e95933a21a628859"
        byol = "ami-0f379d4c8156583d4"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-06263fb612ad41995"
        payg = "ami-07b313ec2177d929b"
      },
      x86 = {
        byol = "ami-026a527d6381faaef"
        payg = "ami-0a6be4b0d27885c52"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-01f17ef0a3f582394"
        payg = "ami-0f92eb33887cfbabe"
      },
      x86 = {
        payg = "ami-009ffe8c37c20fb50"
        byol = "ami-027a4e9de9359d93a"
      }
    },
    ap-southeast-7 = {
      arm = {
        payg = "ami-07373105e58581094"
        byol = "ami-0af2f0de88d96bdb4"
      },
      x86 = {
        payg = "ami-0b0ca68d64dc94a9d"
        byol = "ami-0b889208c3417c6ec"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-04c612975318ec929"
        payg = "ami-0bd7fc076cb3d29f9"
      },
      x86 = {
        byol = "ami-0ae5d7dd2f8e54ce8"
        payg = "ami-0bf5485cf1b71fd55"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0a1f3bb036526ccee"
        byol = "ami-0c6a6cac810882d10"
      },
      x86 = {
        payg = "ami-03625525d71128e90"
        byol = "ami-053a21995db3feae6"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0707c645836e456c3"
        payg = "ami-0c1791db18c68b2a5"
      },
      x86 = {
        byol = "ami-05704340d16566148"
        payg = "ami-05bbe56a3c7ddaa67"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-001cb82d67bb6753a"
        byol = "ami-041712c6a87b0eca4"
      },
      x86 = {
        payg = "ami-018c3253f7eb7e533"
        byol = "ami-09e924a897d574643"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-00ac741e12437e3cd"
        byol = "ami-00a6c74e6b5b26d80"
      },
      x86 = {
        byol = "ami-07d003b9b106b461e"
        payg = "ami-0d049773a5d596f63"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-028a1175a323b2145"
        byol = "ami-0e64fc33db73e936a"
      },
      x86 = {
        byol = "ami-045ba0f2bc251b3ce"
        payg = "ami-06fd8462bbca00a60"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-028363ebf78fa48b3"
        byol = "ami-0887c448d53c4d25a"
      },
      x86 = {
        payg = "ami-0474a0cef52114418"
        byol = "ami-0a98ecb1bc1597684"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0c5333d72472e339a"
        byol = "ami-0f3301182367a4a67"
      },
      x86 = {
        byol = "ami-063da1ae37f3368bc"
        payg = "ami-09a1ea0ae6ed77ddb"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0d5be26af85312223"
        byol = "ami-0e55788e9e630b4af"
      },
      x86 = {
        payg = "ami-02d12f1af98e472d7"
        byol = "ami-0f15f10eee4a9d195"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0d08d166f3909b8bf"
        byol = "ami-0fe5e417746951670"
      },
      x86 = {
        byol = "ami-00eb6194cca8c2b28"
        payg = "ami-0708a13b60ab4d175"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-08d621758a7d8a120"
        byol = "ami-0a29de944a01b5961"
      },
      x86 = {
        byol = "ami-092253233f913fce5"
        payg = "ami-0a9ead638f6cdd8f8"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-055000c5893cb0447"
        byol = "ami-0be7a1689c671f043"
      },
      x86 = {
        byol = "ami-061ceaea7fcc13220"
        payg = "ami-0726c52691cee763b"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0370393250fa00ba0"
        payg = "ami-0c8304dabde301f8b"
      },
      x86 = {
        payg = "ami-0422562fe1600e4ac"
        byol = "ami-06f4539478d55758a"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-00751ed27387224ba"
        payg = "ami-0bd6cfa892609e896"
      },
      x86 = {
        payg = "ami-049bb81bc60a3f48c"
        byol = "ami-0bc3c0cdb1593ca88"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-08617c9210bd1f54f"
        payg = "ami-0d1d5e1a51fd1e84b"
      },
      x86 = {
        payg = "ami-046c38efd9c49de62"
        byol = "ami-0fa331ea8f296e103"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-00bbe5e75d859f43a"
        payg = "ami-042f28c953af1433b"
      },
      x86 = {
        payg = "ami-0a62f99147bd78791"
        byol = "ami-0fb172362b6f3a637"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0d39f9e278d633e08"
        byol = "ami-0e95815669623fb4a"
      },
      x86 = {
        byol = "ami-070efdcbceeffb4c2"
        payg = "ami-0ab5223646e80f0c3"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-06b170bbcde353055"
        byol = "ami-0f3708dd454eecb7d"
      },
      x86 = {
        payg = "ami-070941d56118a07ac"
        byol = "ami-0ff7ab3f5b1b20946"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-006ee83d23d1f6ab6"
        payg = "ami-080cd68911786b3f6"
      },
      x86 = {
        byol = "ami-01e8d141bfcf12089"
        payg = "ami-0d82b72e8f96c6ae7"
      }
    }
  }
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY name>"
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

variable "activeport1gateway" {
  default = "20.1.0.1"
}

variable "activeport2gateway" {
  default = "20.1.1.1"
}

variable "activeport3gateway" {
  default = "20.1.2.1"
}

variable "passiveport1gateway" {
  default = "20.1.10.1"
}

variable "passiveport2gateway" {
  default = "20.1.11.1"
}

variable "passiveport3gateway" {
  default = "20.1.12.1"
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

