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
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>"    //Put in the IAM Role name created
}

variable "vpcid" {
  description = "VPC ID"
  default     = "vpc-xxxxx"
}

variable "vpccidr" {
  default = "20.1.0.0/16"
}

variable "publiccidraz1id" {
  description = "Public Subnet 1 AZ1 ID"
  default     = "subnet-xxxxx"
}

variable "privatecidraz1id" {
  description = "Private Subnet 1 AZ1 ID"
  default     = "subnet-xxxxx"
}

variable "hasynccidraz1id" {
  description = "HASYNC Subnet 1 AZ1 ID"
  default     = "subnet-xxxxx"
}

variable "hamgmtcidraz1id" {
  description = "HAMGMT Subnet 1 AZ1 ID"
  default     = "subnet-xxxxx"
}

variable "publiccidraz2id" {
  description = "Public Subnet 1 AZ2 ID"
  default     = "subnet-xxxxx"
}

variable "privatecidraz2id" {
  description = "Private Subnet 1 AZ2 ID"
  default     = "subnet-xxxxx"
}

variable "hasyncidraz2id" {
  description = "HASYNC Subnet 1 AZ2 ID"
  default     = "subnet-xxxxx"
}

variable "hamgmtidraz2id" {
  description = "HAMGMT Subnet 1 AZ2 ID"
  default     = "subnet-xxxxx"
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
  default = "arm"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c6g.xlarge"
}

// AMIs for FGTVM-7.2.2
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-05ddad7562730d881"
        byol = "ami-02bc959220d7fed46"
      },
      x86 = {
        payg = "ami-0cd6ef98ec787702b"
        byol = "ami-0b3319db6548e6ba9"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0f4d011ac605fb1d5"
        byol = "ami-0cedf9de28ee378f4"
      },
      x86 = {
        payg = "ami-0311d5e799e37bc0a"
        byol = "ami-06a058dbebecb20ba"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-01ca8e78817d3583a"
        byol = "ami-0d7752b345380b98c"
      },
      x86 = {
        payg = "ami-0b107a3fa2ea40b90"
        byol = "ami-088f6e6cd7e2d1e80"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-011c25d5a757821e3"
        byol = "ami-05cb67b4f52d9f755"
      },
      x86 = {
        payg = "ami-0a70f5380706e13ac"
        byol = "ami-0eaa5af24f037c62f"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-08b47964008fb9470"
        byol = "ami-0fe19ee36cc6b6f67"
      },
      x86 = {
        payg = "ami-0b435d1cf16aa90e7"
        byol = "ami-01218edaf747f9d1d"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-07eea7e44e4ffccbb"
        byol = "ami-09ec2dd8a0a2f20fd"
      },
      x86 = {
        payg = "ami-06c01d5bc4b43dc06"
        byol = "ami-07364323dc297ad03"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-06633716cb65a2286"
        byol = "ami-05df14ea2738d8897"
      },
      x86 = {
        payg = "ami-033647feb863a9186"
        byol = "ami-07eea7e44e4ffccbb"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0828d2d8027d6740c"
        byol = "ami-05d44e6c403771d12"
      },
      x86 = {
        payg = "ami-024311ffde39d2c03"
        byol = "ami-0209d99105fdb7698"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-03d13b179f289bc73"
        byol = "ami-068255e24bfd0b3a0"
      },
      x86 = {
        payg = "ami-024cf678856ba0c03"
        byol = "ami-069b0c703ea29d83e"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-04d998e433cb829c3"
        byol = "ami-041906466ef2c23b1"
      },
      x86 = {
        payg = "ami-0b9054cc488c2d27f"
        byol = "ami-0b70c933cd19ea860"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0f99f666216b6eeb5"
        byol = "ami-004323b02aa50c222"
      },
      x86 = {
        payg = "ami-0e88fb5c5083105d0"
        byol = "ami-0fd47fb54f2930d82"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0e712314ace779e2c"
        byol = "ami-097380167308d1f47"
      },
      x86 = {
        payg = "ami-0e61c467e7f353497"
        byol = "ami-0eb58e93476e4cc4d"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0a8aa1ce42e329593"
        byol = "ami-0dfd887d4e31c2eec"
      },
      x86 = {
        payg = "ami-08479d0bce02ca48b"
        byol = "ami-08092592378d8d6ec"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-024ee02a9dd8383ab"
        byol = "ami-0a905dc12c3cb100e"
      },
      x86 = {
        payg = "ami-0036e95e21ec5a86b"
        byol = "ami-056f5286aafab5205"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0ae7de812e7cb1a31"
        byol = "ami-00c06c054fa7a4624"
      },
      x86 = {
        payg = "ami-09694024ef925305f"
        byol = "ami-037f93ac7ef8ce5bd"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-062974225d56eee60"
        byol = "ami-0ca916fbc4980518b"
      },
      x86 = {
        payg = "ami-08128bac5135f4515"
        byol = "ami-0b7c2f464c014fcf8"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-055b51e58fb6d35e3"
        byol = "ami-07750093f606f8822"
      },
      x86 = {
        payg = "ami-010a33c56a41769be"
        byol = "ami-058b5a72d11f1d273"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0a1fc1a743e2816de"
        byol = "ami-0d8d6621080959b71"
      },
      x86 = {
        payg = "ami-0f99c3f1f118ec33b"
        byol = "ami-03e98ed7e18e42a0b"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0c05cf621d626bf17"
        byol = "ami-020f9d727484bb0b7"
      },
      x86 = {
        payg = "ami-054bd339074d2f4f2"
        byol = "ami-02c432f95b9fd7751"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-068ab3619a56075a3"
        byol = "ami-0ace6a7d90c968830"
      },
      x86 = {
        payg = "ami-092c7f33e96a66602"
        byol = "ami-068d7475d3b1be847"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-03d2e50d15f874171"
        byol = "ami-0826784d2c057296e"
      },
      x86 = {
        payg = "ami-0234ecd760256557f"
        byol = "ami-070a27dae920ae9b0"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-054464894ca2063f1"
        byol = "ami-0ee858a7a971f377d"
      },
      x86 = {
        payg = "ami-0f812ef9070aba55b"
        byol = "ami-06b457a922e700066"
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

