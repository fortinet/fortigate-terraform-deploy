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
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>" //Put in the IAM Role name created
}

variable "vpccidr" {
  default = "10.1.0.0/16"
}

variable "publiccidr" {
  default = "10.1.0.0/24"
}

variable "privatecidr" {
  default = "10.1.1.0/24"
}

variable "hasynccidr" {
  default = "10.1.2.0/24"
}

variable "hamgmtcidr" {
  default = "10.1.3.0/24"
}

// Preshare key for autoscale
variable "presharekey" {
  default = "Test123#"
}

// Load Balancer Listen rules for forwarding the traffic
variable "test_forwarding_config" {
  default = {
    80  = "TCP"
    443 = "TCP"
  }
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "byol"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "token"
}

// instance architect
// x86 or arm
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

// AMIs for FGTVM-7.4.11
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-02310b2cc7728ff44"
        payg = "ami-0a24adc0ecb657186"
      },
      x86 = {
        byol = "ami-0a1305d2eba7d4e76"
        payg = "ami-0aa2d1ede08d81594"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-048ba0788502aa213"
        byol = "ami-0cdecbfcc78bda528"
      },
      x86 = {
        payg = "ami-0da7d5d4823169e80"
        byol = "ami-0fb1993aefe65e62d"
      }
    },
    ap-east-2 = {
      arm = {
        payg = "ami-0607e53fc0d8211f9"
        byol = "ami-0b72cad51e941e444"
      },
      x86 = {
        payg = "ami-03c940df99a6b7574"
        byol = "ami-0c1e5a6a5425e8db8"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-018aac0103c45d923"
        byol = "ami-02e0047843882213d"
      },
      x86 = {
        payg = "ami-007727b63cc94f702"
        byol = "ami-084b747a673265bf0"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-047f49ce060af9fe9"
        byol = "ami-0d0d07659aaed6b12"
      },
      x86 = {
        payg = "ami-03cd651eb48f414d8"
        byol = "ami-0aa5ba6aa42c18c51"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-02bb1ca19fa8f82ea"
        byol = "ami-02ad669a12e425586"
      },
      x86 = {
        payg = "ami-08677df86060390d4"
        byol = "ami-098d4e2a32d3bcf1f"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-02dd4f68ae3cd50f6"
        byol = "ami-078146772bd9be546"
      },
      x86 = {
        byol = "ami-021216c21c396b8a0"
        payg = "ami-0ea7440e5e942cc46"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-03b845ccff76eacb1"
        byol = "ami-0ee0b2064ebaf6f24"
      },
      x86 = {
        payg = "ami-065504ab75c9dae75"
        byol = "ami-0b845b263ef004f28"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-01bcd080888b4422c"
        byol = "ami-02f89cde7c4fee6d8"
      },
      x86 = {
        payg = "ami-0558dc5a0c3040055"
        byol = "ami-065318bd4e6b654c6"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-065a485fbc6f1c911"
        payg = "ami-088a9fcd82888ee1b"
      },
      x86 = {
        byol = "ami-05e6c4e4fcd4f6707"
        payg = "ami-0ea0b02d52497dd66"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-067bad9536077a954"
        payg = "ami-0bda3296fccff8f1c"
      },
      x86 = {
        payg = "ami-0d964398915e15fae"
        byol = "ami-0fcda4c8edec4ed9f"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-02672f36583d31100"
        byol = "ami-0dcad085c17a7fa2c"
      },
      x86 = {
        payg = "ami-007d3559fae2ca00e"
        byol = "ami-064334d89f981fce8"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-0adb3b2e3bf590b80"
        byol = "ami-0e100b9e9e57c87cd"
      },
      x86 = {
        byol = "ami-01103d80b4d459435"
        payg = "ami-02e09fd4f6da3d75b"
      }
    },
    ap-southeast-6 = {
      x86 = {
        byol = "ami-0cc2be0f02a37a617"
        payg = "ami-0d0e867adbd01b36e"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-04142f8f5ac1b5f7f"
        payg = "ami-0bd7cb8120afa9afd"
      },
      x86 = {
        payg = "ami-04f53cb958fd37a91"
        byol = "ami-095e531a48f4bdbc8"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-00f420159b323aa38"
        byol = "ami-04668c363f1017b6c"
      },
      x86 = {
        payg = "ami-0290d82e0b2232009"
        byol = "ami-074ab884a9937736a"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-06162a4affd46cca3"
        byol = "ami-066cda828ddb1b24a"
      },
      x86 = {
        payg = "ami-029486cf2df8b18b2"
        byol = "ami-0c3a2c63e96ccdedc"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-03fa13fa52896d807"
        payg = "ami-0e96286cf18ad3bec"
      },
      x86 = {
        byol = "ami-068f28332d7ded5d9"
        payg = "ami-0ab0867403a39d8ff"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-00ccbb16f04fd8ae8"
        payg = "ami-00d56d204ce6abc3d"
      },
      x86 = {
        payg = "ami-02e61c2d62969dadc"
        byol = "ami-081849ebacff123eb"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-03f548556a62aa8cf"
        payg = "ami-0fe10b0c4c9c91e2d"
      },
      x86 = {
        payg = "ami-036cf8cb195b7c6bb"
        byol = "ami-0c0f2674714ee0bcc"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-04bd08919cd7f641e"
        byol = "ami-0eec02280ebfe7572"
      },
      x86 = {
        byol = "ami-093ae55a8b903b239"
        payg = "ami-0bf11aa9e4939c4e9"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-016d8dc385afb0d3a"
        byol = "ami-08cd8f6bd4c14acb4"
      },
      x86 = {
        byol = "ami-08e1e7dad15b48fa1"
        payg = "ami-0aee2b69130022c1c"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-01c63c742acae42cc"
        byol = "ami-0e77c9b106f6017b2"
      },
      x86 = {
        payg = "ami-09a29996e186bb2b6"
        byol = "ami-0e6556ca4849429ef"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0db62b5dfa9ba6f48"
        payg = "ami-0dfc2bda6f37e70e9"
      },
      x86 = {
        byol = "ami-08018b80d99d6e09e"
        payg = "ami-0a8ba2cfdfe8d46ec"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-02f270bd96ed62951"
        byol = "ami-0b170b63f694b5e81"
      },
      x86 = {
        byol = "ami-0039de58e6f01667c"
        payg = "ami-0fbb1bfc35345ea6e"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-01291155dda61ce19"
        payg = "ami-056889b570bca46f7"
      },
      x86 = {
        byol = "ami-08f6953e672d33770"
        payg = "ami-0fec715db451dcd46"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0c93f61b6244c8592"
        byol = "ami-0f1d1a1f7ce86d047"
      },
      x86 = {
        payg = "ami-0a9e49209a037c57b"
        byol = "ami-0c0c5fb9366c4c0e2"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-00f6e8cf93d0a8e50"
        byol = "ami-0a0b4c39ecb9ad0be"
      },
      x86 = {
        byol = "ami-05446c15b1d27e065"
        payg = "ami-0d34449f1e16a9f0c"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-08e867e86d9544608"
        payg = "ami-0ad46480df1a38015"
      },
      x86 = {
        byol = "ami-065cb68fb1b65a184"
        payg = "ami-08acec54c6e438f66"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0a4d7655c9d7e18d0"
        byol = "ami-0c46c8361943be32f"
      },
      x86 = {
        payg = "ami-020e7aa45b419ee7a"
        byol = "ami-05892129fba1bc5c1"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-04917f87a9dbd3f62"
        payg = "ami-067469b2c7067f4f7"
      },
      x86 = {
        payg = "ami-0a868b222f973e16b"
        byol = "ami-0e866d657b9f12bf7"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-02d090d5aacd4e3e2"
        byol = "ami-0d73af5563681a84b"
      },
      x86 = {
        byol = "ami-050e358da33f5811e"
        payg = "ami-08c3c7468f6f1650a"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0a1a9abaf7e0c4727"
        byol = "ami-0c9a90b9a344abecc"
      },
      x86 = {
        payg = "ami-0c332814de22c13d6"
        byol = "ami-0d75254a69d9f6c02"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-076727243c67e383d"
        payg = "ami-0dc6b4ddf4170fd9f"
      },
      x86 = {
        payg = "ami-05204f0a9f59cf9d0"
        byol = "ami-0cc3ea1f1bbf9a56f"
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
  default = "10.1.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "10.1.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  default = "10.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "activeport4" {
  default = "10.1.3.10"
}

variable "activeport4mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  default = "10.1.0.11"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  default = "10.1.1.11"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  default = "10.1.2.11"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  default = "10.1.3.11"
}

variable "passiveport4mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "10.1.0.1"
}

variable "activeport4gateway" {
  default = "10.1.3.1"
}

variable "passiveport1gateway" {
  default = "10.1.0.1"
}

variable "passiveport4gateway" {
  default = "10.1.3.1"
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

