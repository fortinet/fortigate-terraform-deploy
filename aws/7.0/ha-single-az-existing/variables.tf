//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

variable "az" {
  default = "eu-west-1a"
}

// IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.0.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-on-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>" //Put in the IAM Role name created
}

variable "vpcid" {
  description = "VPC ID"
  default     = "vpc-xxxxxxx"
}

variable "publiccidrid" {
  description = "Public Subnet ID"
  default     = "subnet-xxxxxxx"
}

variable "privatecidrid" {
  description = "Private Subnet ID"
  default     = "subnet-xxxxxxx"
}

variable "hasynccidrid" {
  description = "HASYNC Subnet ID"
  default     = "subnet-xxxxxxx"
}

variable "hamgmtcidrid" {
  description = "HAMGMT Subnet ID"
  default     = "subnet-xxxxxxx"
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

// AMIs for FGTVM-7.0.15
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-087fb86dafec2287a"
        byol = "ami-017fdd5b744f7b596"
      },
      x86 = {
        payg = "ami-077aa9bb30484796e"
        byol = "ami-0cf4da00e6c7981f5"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-07841bfe0b09d2539"
        byol = "ami-064dacda322c7d3d5"
      },
      x86 = {
        payg = "ami-0a94587a6458f61ca"
        byol = "ami-0355bbd71bf41293e"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-017985964ffe19d19"
        byol = "ami-007895cf491179ae7"
      },
      x86 = {
        payg = "ami-0057559da9413ff5f"
        byol = "ami-01021906e0b7efc9c"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0633158591a156cec"
        byol = "ami-05e1672eb06935b3f"
      },
      x86 = {
        payg = "ami-0899975bd749acc8f"
        byol = "ami-0df8d57ccc86795db"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-03b33c4529d20ba74"
        byol = "ami-02bb4f280edf31436"
      },
      x86 = {
        payg = "ami-04fcdeab80a8a16c9"
        byol = "ami-0dd7436478f8c5c87"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0e85d6c2b2eb966a7"
        byol = "ami-0981b8d174935deca"
      },
      x86 = {
        payg = "ami-09de119145375e045"
        byol = "ami-09c8ea65f78af6616"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-016e2c635f72020bf"
        byol = "ami-08a2e48f9543620df"
      },
      x86 = {
        payg = "ami-0e9deeec75758aa54"
        byol = "ami-0079f8fdff5ed0aa6"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-03ae06fa79027a585"
        byol = "ami-084e357c0015a0e65"
      },
      x86 = {
        payg = "ami-08ae61cea29d68102"
        byol = "ami-0c11f10682ff634f7"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0be4d5117c27b5020"
        byol = "ami-09d439a15eb21a10d"
      },
      x86 = {
        payg = "ami-0684be5b41f00636a"
        byol = "ami-02dd572389b92ff46"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0f6489300f741fc2c"
        byol = "ami-0211ef09b47012b1f"
      },
      x86 = {
        payg = "ami-05a51e9f70ccc7752"
        byol = "ami-0b7a826c8e9e461df"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-03e7d9af2be625096"
        byol = "ami-09d9b33bcb588e0d7"
      },
      x86 = {
        payg = "ami-07352c606f3a5e7bd"
        byol = "ami-069f1555a8ec5b42b"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0a671f97d7a4c8ad3"
        byol = "ami-0a4dc2d305222a9a4"
      },
      x86 = {
        payg = "ami-08bb767094b4ea482"
        byol = "ami-0541518f2bb0e15ef"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0c7365f1a9eff3660"
        byol = "ami-092392eb688799e87"
      },
      x86 = {
        payg = "ami-0168f32707083a981"
        byol = "ami-00f69c2682e1fb5aa"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0182a83df29dbadbe"
        byol = "ami-01bb6ade503356be7"
      },
      x86 = {
        payg = "ami-0a2c53d655b2283b7"
        byol = "ami-0124f63f3e8ebba97"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0826878ca4ea05881"
        byol = "ami-0764af37630fb24ab"
      },
      x86 = {
        payg = "ami-0afef288065c91273"
        byol = "ami-0bd04063dfb4ea7d4"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-04dc973d7a662c400"
        byol = "ami-0dc199d37e5fd6afa"
      },
      x86 = {
        payg = "ami-02dba78fc242ccf9e"
        byol = "ami-0fd6304ab2bfb031b"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-051cc57dbed425186"
        byol = "ami-005b75cc7bde3992d"
      },
      x86 = {
        payg = "ami-0da397696774471f7"
        byol = "ami-07964839ab1c83f43"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-086874811a187d525"
        byol = "ami-07efc90dea7988906"
      },
      x86 = {
        payg = "ami-0aec018025eaed370"
        byol = "ami-0adbfbac0a35e4857"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-098df7b41ab48e242"
        byol = "ami-0302c0aa6af4a1842"
      },
      x86 = {
        payg = "ami-0299c83a397f71cda"
        byol = "ami-0cb19d69cb9b266ec"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-077f9368aac7d49a6"
        byol = "ami-07ab2ba8aff2ee513"
      },
      x86 = {
        payg = "ami-0bc455e71a89b4f35"
        byol = "ami-06675667e0d34c587"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0b2a843efdbe0f618"
        byol = "ami-0e1481783b7d25a2e"
      },
      x86 = {
        payg = "ami-06e568d0bc9d69c98"
        byol = "ami-08243a13373989784"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-073a13d59fc66bd65"
        byol = "ami-03c09b0222bf446af"
      },
      x86 = {
        payg = "ami-094508cd7322ca716"
        byol = "ami-0f92800bf0cd1262e"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-05c2ac4787ae6e997"
        byol = "ami-0c4724798dd6181ef"
      },
      x86 = {
        payg = "ami-0f4d2c9ec4363b68f"
        byol = "ami-0c05b2e53cdc361ce"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-03d81e8549bb545ae"
        byol = "ami-057b2862cc59ef132"
      },
      x86 = {
        payg = "ami-0a344e899b7a4976c"
        byol = "ami-0d6faf140817db196"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0776f1af78d841e4b"
        byol = "ami-084ad72601eb08976"
      },
      x86 = {
        payg = "ami-03ac97e06e7e03f63"
        byol = "ami-081f7fc445057a7ba"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0f296244f8aac71af"
        byol = "ami-02bebb549c730491c"
      },
      x86 = {
        payg = "ami-0bde145625b8328e2"
        byol = "ami-05e9caafa2a5a0912"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-04b645b0fe5dc43d5"
        byol = "ami-0c3823ee043b8ca90"
      },
      x86 = {
        payg = "ami-0cd04222ed0728e4b"
        byol = "ami-00c36835fc521ead1"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-063a6f711cec91ddf"
        byol = "ami-00d57d2dae491b191"
      },
      x86 = {
        payg = "ami-09fe6329cc483c99c"
        byol = "ami-09c138aeefd50c46f"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-046ff1534c625faa1"
        byol = "ami-0e1f12a44c4cb9c67"
      },
      x86 = {
        payg = "ami-0e6526d2c85237eda"
        byol = "ami-06d16ccc9c346557b"
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

