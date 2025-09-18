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

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
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

// AMIs for FGTVM-7.2.12
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-074a1f5b9bd02172b"
        payg = "ami-0d43f8b7e65ff47e5"
      },
      x86 = {
        byol = "ami-0aed93b400753d7e3"
        payg = "ami-0f5bdc5e827fbc3a1"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-05780bb3c4f158090"
        byol = "ami-0dd106666d4b2e39a"
      },
      x86 = {
        byol = "ami-09d58329b513e6e68"
        payg = "ami-0b285cae866c30704"
      }
    },
    ap-east-2 = {
      x86 = {
        payg = "ami-01bde2fd7286c92a1"
        byol = "ami-055c190ab5b34db8a"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-00a47d6a580e4b080"
        payg = "ami-0ac0a02e629d26acc"
      },
      x86 = {
        byol = "ami-01535f46ab1cc5e43"
        payg = "ami-0473795d91d87d57a"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-024bdbe60ad6ed319"
        byol = "ami-0714d1fb4c2af760e"
      },
      x86 = {
        byol = "ami-0188ddc1101c2f6c3"
        payg = "ami-0e14abaaa63a1c5c7"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0045fb4f05d5f0554"
        byol = "ami-09e29cfe8a03f9b9b"
      },
      x86 = {
        payg = "ami-05c42037cef26efbe"
        byol = "ami-0bfdfb68af07b0c7e"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0166cc99293951654"
        payg = "ami-0cc3891085b28b232"
      },
      x86 = {
        payg = "ami-0c4e7c692caed9bc4"
        byol = "ami-0fa3376d0cb33f571"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0087959b96f5aa195"
        byol = "ami-0c4b14f9e7ad7c8cb"
      },
      x86 = {
        payg = "ami-0ce26829e1f306c7c"
        byol = "ami-0d36dd21c69b4655a"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0d6e584f19dc39d9b"
        payg = "ami-0f6a2ab0e1e35ebfd"
      },
      x86 = {
        byol = "ami-06983ffc1d9019411"
        payg = "ami-07c98f91ea9a48414"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-06f3dedb0827839c7"
        byol = "ami-0ca8ae45bfdadf8fe"
      },
      x86 = {
        payg = "ami-0831a79328062c3d9"
        byol = "ami-0d574d4b3f97d5613"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0427a31c2fee7efea"
        payg = "ami-0b781c92f06d950a6"
      },
      x86 = {
        byol = "ami-08a58151c8af5cf59"
        payg = "ami-0d3467aacafaa1136"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0566c6ef2baabfc9f"
        payg = "ami-0e841868b10164b20"
      },
      x86 = {
        payg = "ami-06ffa39e627c23484"
        byol = "ami-0f2d8b1a5deacf185"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-01fa21a08110cc71e"
        byol = "ami-02a72a1788b8f4d03"
      },
      x86 = {
        byol = "ami-02b382c8f65447194"
        payg = "ami-04f3bec5e5f293444"
      }
    },
    ap-southeast-7 = {
      arm = {
        payg = "ami-0dacc82cf722eef47"
        byol = "ami-0e565f0b3e8fb61ed"
      },
      x86 = {
        payg = "ami-09e2c02f91eb0653f"
        byol = "ami-0b871935c3bd26d71"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0162a5e3d496a1d2f"
        byol = "ami-0ab91d07d044e79fb"
      },
      x86 = {
        byol = "ami-00c9853ec01d47635"
        payg = "ami-023642a231735d3d4"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-09d719bdf823606dc"
        byol = "ami-0a132173f3405d9b0"
      },
      x86 = {
        payg = "ami-039d9cb6cbf6a839b"
        byol = "ami-08bf2dd749fa30c0e"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0a59dda327a6726dd"
        byol = "ami-0f1bd25f8199522b1"
      },
      x86 = {
        payg = "ami-032102034e947a4c7"
        byol = "ami-05104736ac13a4a2b"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0967d0dacab7f8781"
        byol = "ami-0c6fee2733d41623a"
      },
      x86 = {
        byol = "ami-073f01412aa45d50e"
        payg = "ami-09695bdbc8b7aaa31"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-00051d13b61364f8b"
        payg = "ami-06b739156e6d6fa1b"
      },
      x86 = {
        payg = "ami-08d39645346b67497"
        byol = "ami-0ab741e6c8da9719e"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-024f2525949b583c2"
        byol = "ami-0df9ac51863952a68"
      },
      x86 = {
        byol = "ami-055f1032a4f15d658"
        payg = "ami-0e87c7ba842030399"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-0333ebc02abaee33a"
        byol = "ami-05a473a01f32be3a2"
      },
      x86 = {
        byol = "ami-094b5d25e1f0d7814"
        payg = "ami-0fdf2448b66429d0d"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0331b886175f7b8b1"
        payg = "ami-09c769dba8ef8d7a9"
      },
      x86 = {
        byol = "ami-02853888560bc5ca6"
        payg = "ami-0c8cee185ef2df310"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0b6b2716070b6e206"
        byol = "ami-0c0c5d9d40ea84c97"
      },
      x86 = {
        payg = "ami-0e171892379a019f9"
        byol = "ami-0eae497372638407e"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-06853b0931a2ee9bd"
        byol = "ami-0f59d4f4ae144c2b2"
      },
      x86 = {
        byol = "ami-0153d66b2ead50f64"
        payg = "ami-08499e41cc2626e29"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0776b9c1de91c3a2b"
        payg = "ami-0818808f5222a061e"
      },
      x86 = {
        payg = "ami-05d74eb25ceb4af35"
        byol = "ami-0c4e2884534c70e32"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0954237e771d0a4b4"
        byol = "ami-0a8859718dbec9a48"
      },
      x86 = {
        byol = "ami-0413f253d2046823e"
        payg = "ami-053156cbac340f981"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-02544b37973a38e08"
        payg = "ami-046e6afec2e5f7aa5"
      },
      x86 = {
        payg = "ami-0283a2681997b592c"
        byol = "ami-0af1fb4179c4727de"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-095258e485a2d2516"
        payg = "ami-0bdb066eb50d0f21d"
      },
      x86 = {
        payg = "ami-07427810cc466fa59"
        byol = "ami-08f0aea301729c00c"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0eed0096b6d582638"
        byol = "ami-0eed7ca9edaf7463b"
      },
      x86 = {
        byol = "ami-00a099af78643465d"
        payg = "ami-00fe7c5b3f0bac8b5"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0d5d2ad4d3265ec20"
        payg = "ami-0f309c949368fd1b6"
      },
      x86 = {
        payg = "ami-064a767bb262b3a52"
        byol = "ami-07e15cc3a9b57cb42"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-03f564e55ffabacbd"
        byol = "ami-0e9bcb12861d5a2a3"
      },
      x86 = {
        byol = "ami-0dd35e851a17a7f9a"
        payg = "ami-0ec138130d7e00150"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0091931a8dc98d9ad"
        byol = "ami-080ef43a31cb7abf6"
      },
      x86 = {
        payg = "ami-0af3ef91327208fe7"
        byol = "ami-0be7f236c8807dd0f"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-03ad034b07feaa16e"
        payg = "ami-07859040caa7cbe4b"
      },
      x86 = {
        byol = "ami-0603e7a4dd7966cad"
        payg = "ami-09f521e73645af0e7"
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

