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
  default = "eu-west-1b"
}

// IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.0.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-on-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>"    //Put in the IAM Role name created
}

variable "vpcid" {
  description = "VPC ID"
  default     = "vpc-xxxxxxx"
}

variable "vpccidr" {
  default = "20.1.0.0/16"
}

variable "publiccidraz1id" {
  description = "Public Subnet 1 AZ1 ID"
  default     = "subnet-xxxxxxx"
}

variable "privatecidraz1id" {
  description = "Private Subnet 1 AZ1 ID"
  default     = "subnet-xxxxxxx"
}

variable "hasynccidraz1id" {
  description = "HASYNC Subnet 1 AZ1 ID"
  default     = "subnet-xxxxxxx"
}

variable "hamgmtcidraz1id" {
  description = "HAMGMT Subnet 1 AZ1 ID"
  default     = "subnet-xxxxxx"
}

variable "publiccidraz2id" {
  description = "Public Subnet 1 AZ2 ID"
  default     = "subnet-xxxxxx"
}

variable "privatecidraz2id" {
  description = "Private Subnet 1 AZ2 ID"
  default     = "subnet-xxxxxxx"
}

variable "hasyncidraz2id" {
  description = "HASYNC Subnet 1 AZ2 ID"
  default     = "subnet-xxxxxxx"
}

variable "hamgmtidraz2id" {
  description = "HAMGMT Subnet 1 AZ2 ID"
  default     = "subnet-xxxxxx"
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

// AMIs for FGTVM-7.0.9
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0cb77c60ba71972de"
        byol = "ami-07df7e29cde684c4e"
      },
      x86 = {
        payg = "ami-0ffcff5f5cca7156f"
        byol = "ami-09b9aeeeccd53e7d9"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0af095d725f3b2f98"
        byol = "ami-087c4d61073b79e6b"
      },
      x86 = {
        payg = "ami-06f45c6c2d0de1c65"
        byol = "ami-0b3431734e3741aab"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0ce6933688b796833"
        byol = "ami-0441390b2c62507f2"
      },
      x86 = {
        payg = "ami-08867de508c04b8dc"
        byol = "ami-073f984c792224cb1"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0ff3a30a615121222"
        byol = "ami-0917f43a38f3402c0"
      },
      x86 = {
        payg = "ami-0488139b699eda431"
        byol = "ami-06f28d61efc76a1e1"
      }
    },
    af-south-1 = {
     arm = {
        payg = "ami-05c6328c2e57ea33d"
        byol = "ami-02e3aefecfec63bdd"
     },
     x86 = {
        payg = "ami-07af6cc53438e7aae"
        byol = "ami-0ebf60c8dc712f492"
     }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0d1ff7cc955b238a4"
        byol = "ami-00e09d16e0262329f"
      },
      x86 = {
        payg = "ami-0852d92d7f9416ab5"
        byol = "ami-07e97763b95ea38a2"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0abf6cee1701a78d4"
        byol = "ami-01d3d694f75ee2cd7"
      },
      x86 = {
        payg = "ami-0ae526325ef34df2b"
        byol = "ami-00b661d7d5b3f51a3"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-02ea681f6ed826857"
        byol = "ami-04f5604d0728ac28d"
      },
      x86 = {
        payg = "ami-022e8b3bb1e468f0e"
        byol = "ami-020639884a83a08fc"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-01de77df13a2ae734"
        byol = "ami-0c66f13f4390ef2e8"
      },
      x86 = {
        payg = "ami-066bd451e7c141bca"
        byol = "ami-00e5412cb43de19aa"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0ef19362fcb6625b6"
        byol = "ami-08f0c127806f82078"
      },
      x86 = {
        payg = "ami-0f000a360718ed040"
        byol = "ami-06386c4f8a28aa7c5"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0bc77f3d060d9abf0"
        byol = "ami-0e7f8936f10db28fc"
      },
      x86 = {
        payg = "ami-0350156af752df089"
        byol = "ami-0b10bc1f109ad85a0"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-037d6b3469e05cb1e"
        byol = "ami-0b16464942e1a82c0"
      },
      x86 = {
        payg = "ami-06916242969fbddd1"
        byol = "ami-0a4519e9c4ac8c65e"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0cc04597944dfd7ba"
        byol = "ami-090cf95389be2ff95"
      },
      x86 = {
        payg = "ami-0f34b9459b589033a"
        byol = "ami-009f8521acd32d3bf"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0fee49c75ee3d0253"
        byol = "ami-0c273f7bca7e87261"
      },
      x86 = {
        payg = "ami-040674c9f723e9d66"
        byol = "ami-075f45e2c06affe69"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0932cbe200ddf1945"
        byol = "ami-0fa6cf52631374e16"
      },
      x86 = {
        payg = "ami-06726f7e711704c99"
        byol = "ami-051856dcc711f2d7c"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0bede5e354b6e57ae"
        byol = "ami-08ad0df6ba872a59c"
      },
      x86 = {
        payg = "ami-0a9110ea1f7f3381e"
        byol = "ami-0f7f28fd093da3d30"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-033910b4f6e3dbc24"
        byol = "ami-0c323742499ac5f58"
      },
      x86 = {
        payg = "ami-0d79f64f8fa958ef9"
        byol = "ami-084bb4482ab27bd7c"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0b40bbcb33aa94522"
        byol = "ami-089a65f817e7fdb1a"
      },
      x86 = {
        payg = "ami-07ec5c7671b7f8df4"
        byol = "ami-01efefa7ac60806f9"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-05791052223eb1bcd"
        byol = "ami-082cd04f639806c1a"
      },
      x86 = {
        payg = "ami-0c8f88ca5dbb269e5"
        byol = "ami-0460264212c580084"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0360d6a2a770c235b"
        byol = "ami-0a2aa2d8edd35cf3b"
      },
      x86 = {
        payg = "ami-08d77e6cbd441a706"
        byol = "ami-0067192cda088924a"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-006e1f521b7bc809d"
        byol = "ami-0b5e30f12ee672f4d"
      },
      x86 = {
        payg = "ami-097fd1d3207a1eba0"
        byol = "ami-08f1ef91bed6d282f"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0f2799cb926d728f8"
        byol = "ami-06e110d468491faf0"
      },
      x86 = {
        payg = "ami-0096b81449ab446a6"
        byol = "ami-0ea1d3518f8eb57ae"
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
  description = "Active FGT port1 ip address, needs to be same subnet as Public Subnet in AZ1"
  default     = "20.1.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  description = "Active FGT port2 ip address, needs to be same subnet as Private Subnet in AZ1"
  default     = "20.1.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  description = "Active FGT port3 ip address, needs to be same subnet as HASYNC Subnet in AZ1"
  default     = "20.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "activeport4" {
  description = "Active FGT port4 ip address, needs to be same subnet as HAMGMT Subnet in AZ1"
  default     = "20.1.3.10"
}

variable "activeport4mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  description = "Passive FGT port1 ip address, needs to be same subnet as Public Subnet in AZ2"
  default     = "20.1.10.10"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  description = "Passive FGT port2 ip address, needs to be same subnet as Private Subnet in AZ2"
  default     = "20.1.11.10"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  description = "Passive FGT port3 ip address, needs to be same subnet as HASYNC Subnet in AZ2"
  default     = "20.1.12.10"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  description = "Passive FGT port4 ip address, needs to be same subnet as HAMGMT Subnet in AZ2"
  default     = "20.1.13.10"
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

