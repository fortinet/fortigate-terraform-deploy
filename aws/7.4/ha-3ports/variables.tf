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
  default = "byol"
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

// AMIs for FGTVM-7.4.13
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-00787afb1f2e4a9de"
        payg = "ami-09d91ea049c7ada51"
      },
      x86 = {
        byol = "ami-00eb568fa511a35f6"
        payg = "ami-038704896e3a5e389"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-00de750de3b372258"
        payg = "ami-0fb8cfab5cb662b4b"
      },
      x86 = {
        payg = "ami-05df7e7c1396cd69b"
        byol = "ami-0b7f0ad8078cd11d1"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-0821e2fbd05cf42b3"
        payg = "ami-0d900b15fbbfeb55b"
      },
      x86 = {
        payg = "ami-0743c1ad589f8a5ab"
        byol = "ami-0cfaf9ffd4c7ffe56"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-043894b23d4f30e0d"
        byol = "ami-0e2b99aaa46285ad0"
      },
      x86 = {
        byol = "ami-0667ed2427f829a7c"
        payg = "ami-0e3e97030e058f9bd"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0030257f36cec868c"
        byol = "ami-01e36214fc91d9c51"
      },
      x86 = {
        byol = "ami-07ac664e715dfb7ab"
        payg = "ami-07f2a180b6b4734be"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-06ff45f97b9df2f0a"
        payg = "ami-09fa221d89ef82c11"
      },
      x86 = {
        payg = "ami-0371e87b0d1f06666"
        byol = "ami-0d5e8b308c0e34b61"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-032fab99230e76901"
        byol = "ami-0f5c45857b2514158"
      },
      x86 = {
        byol = "ami-00bb9b5e8a27528c5"
        payg = "ami-0581a3d20fbb75367"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-08b44acbcd9bb58ae"
        byol = "ami-096159218f797e7f2"
      },
      x86 = {
        byol = "ami-072bfc081cf532485"
        payg = "ami-0b131e8d65086762f"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0140e44268f905a53"
        byol = "ami-0f7e396c8beba091b"
      },
      x86 = {
        byol = "ami-00cf0bfb82863ae09"
        payg = "ami-060836461bd6d7cbd"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-05666bd1cdbd53a52"
        payg = "ami-0a1b50186ad7b3451"
      },
      x86 = {
        payg = "ami-01871b9adef251a71"
        byol = "ami-0b3d952d6613ba3bf"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0444a168ac006bbee"
        byol = "ami-085740e06b5f7c826"
      },
      x86 = {
        payg = "ami-06b54b8742506cd5c"
        byol = "ami-0ac66d2169510669e"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0453aaa9d76577b64"
        byol = "ami-098ee5fbbe4b1adc6"
      },
      x86 = {
        byol = "ami-0028bc2ad9c49dd8e"
        payg = "ami-02c3ebe2c15275589"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-00d2c62cf741a138e"
        byol = "ami-09c9f6d02f9f7a6e1"
      },
      x86 = {
        payg = "ami-082f3ffba5fd577a6"
        byol = "ami-079fec7760e9935cc"
      }
    },
    ap-southeast-6 = {
      arm = {
        payg = "ami-01a5ea0ae7b0e80a8"
        byol = "ami-0a9951ef0b89f99d9"
      },
      x86 = {
        payg = "ami-0951ab5a216c07ed2"
        byol = "ami-0e1cffe64df2ea5e1"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-06fc47388e3698b05"
        payg = "ami-0989590109a9368bc"
      },
      x86 = {
        payg = "ami-070f8a1dcb2b02a79"
        byol = "ami-0d3db1bb52b4aceb7"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-025aa56b1f6d55c75"
        byol = "ami-055243c482a2086f1"
      },
      x86 = {
        byol = "ami-0ae2b64456b740c84"
        payg = "ami-0b364162236c5a2a0"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-019eee320cd70fbb9"
        byol = "ami-0586e4775c171533c"
      },
      x86 = {
        byol = "ami-02cfba9fb6be50b3f"
        payg = "ami-06f01f10754b4dafa"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-03c144fbfccb30867"
        byol = "ami-0feb745c93786e2a1"
      },
      x86 = {
        byol = "ami-07a0a1111f3adc300"
        payg = "ami-0e2aed6964e96c728"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-04e91ad141297853e"
        byol = "ami-0c38c5d3f960805c7"
      },
      x86 = {
        byol = "ami-0e52ff3ae62511328"
        payg = "ami-0fcbac4ae73ee044a"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-046ad9b39da34c8f0"
        payg = "ami-0ee6d96bff320cab0"
      },
      x86 = {
        byol = "ami-0252bb479b1146b93"
        payg = "ami-0782ad7aeaa1af081"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0086cad47bcbbb0a7"
        byol = "ami-0a89154da73679124"
      },
      x86 = {
        payg = "ami-08c3d9cb1964814a5"
        byol = "ami-0d8ed398b325515d0"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-001429af4b95c2314"
        payg = "ami-01b88402da22d9afa"
      },
      x86 = {
        payg = "ami-0128514ee4c902d08"
        byol = "ami-0e3a1240e87038809"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-051eaf788ba0c8402"
        byol = "ami-0a2428c216dc50040"
      },
      x86 = {
        payg = "ami-0489975b42ba46e8d"
        byol = "ami-044a4bed0a17a9d02"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-03a41c23eaa58bb7b"
        payg = "ami-076fe18002bc6d017"
      },
      x86 = {
        byol = "ami-03d9215014ac2fb68"
        payg = "ami-09b651076c09b6f4c"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0136d9b9aff55e881"
        payg = "ami-022d84a5e8528566e"
      },
      x86 = {
        byol = "ami-07719eb63c3debca1"
        payg = "ami-0fefaa77db9c688c0"
      }
    },
    l-central-1 = {
      arm = {
        payg = "ami-0148c27988d1e3a79"
        byol = "ami-08197139517546f2c"
      },
      x86 = {
        byol = "ami-0a5ca9b59c9981627"
        payg = "ami-09f0328894b7634dd"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-0403d66fbef99ca7e"
        payg = "ami-0d71d618dc9237cb7"
      },
      x86 = {
        byol = "ami-0608965cd824d4de2"
        payg = "ami-0e86cc27b17eee65d"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-036080d6bba065b2f"
        payg = "ami-078f75b46d26ca878"
      },
      x86 = {
        payg = "ami-074251d24bfc176d7"
        byol = "ami-08cb6dd9f5803d249"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0404fc505e249249b"
        payg = "ami-0f834c2391c9a2039"
      },
      x86 = {
        payg = "ami-024dd3d15405babfa"
        byol = "ami-084fb0688c96803b9"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-08d1352d495cecb76"
        byol = "ami-09f66d73c018c3f7f"
      },
      x86 = {
        payg = "ami-0431722907856b98e"
        byol = "ami-0912190489f9d6695"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-03dac66d3b88ed686"
        byol = "ami-0ef8c3e4eb29f6974"
      },
      x86 = {
        payg = "ami-007b3ed9044797537"
        byol = "ami-0a8094e43330c08c2"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-01c8fa3f47a7ea191"
        byol = "ami-0e292ea9477e3859c"
      },
      x86 = {
        payg = "ami-01752a368158800ba"
        byol = "ami-0c7ae838d9790a210"
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

//license files for the two fgts
variable "licenses" {
  // Change to your own byol license files
  type    = list(string)
  default = ["license.lic", "license2.lic"]
}

