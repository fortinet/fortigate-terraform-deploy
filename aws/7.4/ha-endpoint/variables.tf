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
  default = "arm"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c6g.xlarge"
}

// AMIs for FGTVM-7.4.6
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-040aaf09a6de4b086"
        byol = "ami-0a65d516df5789266"
      },
      x86 = {
        payg = "ami-039592fdb85a7379d"
        byol = "ami-04a25db97c0ca0826"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0451d5082a0d2bd31"
        byol = "ami-0dca0399791d5b786"
      },
      x86 = {
        payg = "ami-0abe4c1920128a47f"
        byol = "ami-0dd8c5f7eea08b1dc"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-091e3e6a4d8e5c4a5"
        byol = "ami-0300125887b042c6e"
      },
      x86 = {
        payg = "ami-0e115412a4c8f1e3f"
        byol = "ami-07594d44a4106e02b"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0edca627d886ca285"
        byol = "ami-0923e5e36c2ebd07d"
      },
      x86 = {
        payg = "ami-02dd8df355ec0c394"
        byol = "ami-00855c5a6fb818920"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-027ed0f0433bbac0e"
        byol = "ami-0fe8969afacd332a2"
      },
      x86 = {
        payg = "ami-01a1c42c77042a258"
        byol = "ami-0b5a693d843cbc8a7"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0ff9e103e6b94de47"
        byol = "ami-0d8b0acf4ed7381c1"
      },
      x86 = {
        payg = "ami-0caaf01008ce473e0"
        byol = "ami-066a8c1d6aa9a4622"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0821913ade4b68f37"
        byol = "ami-0eafaa211a83d7580"
      },
      x86 = {
        payg = "ami-09b4b6791daf8d38f"
        byol = "ami-0d9d0c2b1140720bf"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0ac3556630bdb2852"
        byol = "ami-0d1ec1bd9991994de"
      },
      x86 = {
        payg = "ami-052f6fce390f48697"
        byol = "ami-04bf7b29351a6e424"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-01275def0e1238e17"
        byol = "ami-03a983c8a7e3ec15b"
      },
      x86 = {
        payg = "ami-08323d6e751fe6385"
        byol = "ami-0082c7bcf1f0c075f"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0bebedb077b4c19fb"
        byol = "ami-039044441cd700da2"
      },
      x86 = {
        payg = "ami-031a44cd4b6f44f1b"
        byol = "ami-0456f2abe95073f47"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0539f494231d07e8b"
        byol = "ami-052e761a2b194df99"
      },
      x86 = {
        payg = "ami-0d33679c10f3ad567"
        byol = "ami-09a5ea2c1b63c8b61"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0eddf8f10c0bb903d"
        byol = "ami-040f7d2b59d025826"
      },
      x86 = {
        payg = "ami-0a09d009f4c39d25b"
        byol = "ami-0d33679c10f3ad567"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0b3c7f736ac866c07"
        byol = "ami-01bfec63375a86b07"
      },
      x86 = {
        payg = "ami-007cad54955b2bc38"
        byol = "ami-0fbbaf6901984daef"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0a01778596840696d"
        byol = "ami-0f8467d0b11feda0d"
      },
      x86 = {
        payg = "ami-0161c6cb798f25837"
        byol = "ami-08d8b16d206181ce4"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0ee50a42bde6d00b4"
        byol = "ami-09f9b70772c2e68fa"
      },
      x86 = {
        payg = "ami-0b7ceb9a6ddf45300"
        byol = "ami-03854cc16f8bf9c63"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-068072644e26ba96d"
        byol = "ami-0d7b9b5d3ecd30a5a"
      },
      x86 = {
        payg = "ami-0e6ff23eb68fbff15"
        byol = "ami-06b27e653108b2da3"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-07f8fd25ae9515090"
        byol = "ami-013156d1ceac8e295"
      },
      x86 = {
        payg = "ami-013156d1ceac8e295"
        byol = "ami-0d02b915c3bfd3beb"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0dd1c7255ef4f6680"
        byol = "ami-0b63afdc4915e8b68"
      },
      x86 = {
        payg = "ami-0629c77199091c928"
        byol = "ami-0af73ff09e37581e6"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-00b6ef1f828d974fc"
        byol = "ami-072449858bf433f33"
      },
      x86 = {
        payg = "ami-0c5b516bc9d2b3f2c"
        byol = "ami-041ab60c7d321566a"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0c7334eb22219b440"
        byol = "ami-059e7c0239d0865cc"
      },
      x86 = {
        payg = "ami-06400bd9e8f1776be"
        byol = "ami-013bc359e3b45e2c0"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0d297b577b34cdc3e"
        byol = "ami-09ca0699596d056cc"
      },
      x86 = {
        payg = "ami-04830d1bd9a92a506"
        byol = "ami-07463647ebc282a26"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-07913b98ca86282a5"
        byol = "ami-0e9f592991a3300c2"
      },
      x86 = {
        payg = "ami-0a8be6096a3533148"
        byol = "ami-0f44b75f6e866d36e"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-01e0d1e76706ee734"
        byol = "ami-0f66bbfbc90dfa81a"
      },
      x86 = {
        payg = "ami-0bf8581bdb10083d1"
        byol = "ami-0140ea76e4f2e0462"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-023601cd0829924db"
        byol = "ami-09419ff58357d89a2"
      },
      x86 = {
        payg = "ami-00dc7dbc10c6a984b"
        byol = "ami-078ef82a72ba41dfc"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0a18005085a057114"
        byol = "ami-018528391930e0cc5"
      },
      x86 = {
        payg = "ami-064d879248a45d5cc"
        byol = "ami-0494839e2d53d5ee7"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0abef922e95d078a2"
        byol = "ami-0f7105d871af1684e"
      },
      x86 = {
        payg = "ami-0458289fe0d26aad4"
        byol = "ami-05e4df939932a2f4a"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0a550213f9179d0ab"
        byol = "ami-036a587a16b23aa09"
      },
      x86 = {
        payg = "ami-073e676eba2233bca"
        byol = "ami-085bcd2263233d5b9"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-08ee431081cce9dd7"
        byol = "ami-04ed753623c37bb99"
      },
      x86 = {
        payg = "ami-005d77189e6790e09"
        byol = "ami-03dd8486de1eb22fa"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-044f737ec341eb02a"
        byol = "ami-0c06733917f9d3e19"
      },
      x86 = {
        payg = "ami-066a89ac3ba7d6b3c"
        byol = "ami-0c970738a0abe5bb2"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-07c36be0efacf8ad3"
        byol = "ami-02462aa70981e954b"
      },
      x86 = {
        payg = "ami-037133802caac3957"
        byol = "ami-037225948b8cc664a"
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
