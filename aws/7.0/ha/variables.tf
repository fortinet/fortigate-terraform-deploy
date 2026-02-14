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
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}


// AMIs for FGTVM-7.0.19
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-04352fb33d362d3e8"
        payg = "ami-0638d46d727423508"
      },
      x86 = {
        byol = "ami-05d76ed9dfc6518fc"
        payg = "ami-0c0acede2cac35d88"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-002920caf195ea2e8"
        byol = "ami-03260b1232312e5be"
      },
      x86 = {
        payg = "ami-0252ad724d48f3284"
        byol = "ami-09a1f074a6a2c48e3"
      }
    },
    ap-east-2 = {
      arm = {
        payg = "ami-0d5e146353d77e150"
        byol = "ami-0e1c84caa2983c61d"
      },
      x86 = {
        payg = "ami-09ba6931e165ea96b"
        byol = "ami-0d4797f12a8fcbaf4"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0540fda113e512b15"
        byol = "ami-0a1edf9eb91312b4a"
      },
      x86 = {
        payg = "ami-01cf67f77a6e91917"
        byol = "ami-0f52b99566c926895"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0cf7939b846e0c91a"
        payg = "ami-0dcf715afe892eb27"
      },
      x86 = {
        byol = "ami-0653196c9c981ff87"
        payg = "ami-06fc34594566fb03a"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-07123754f82d81de0"
        payg = "ami-0fe24822ba350fabd"
      },
      x86 = {
        byol = "ami-02dc82dfe656dbfaf"
        payg = "ami-0dc8f4761ca3eca32"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0c88ef710f2dcf672"
        payg = "ami-0c58e74b9b05eb426"
      },
      x86 = {
        payg = "ami-0239d68eccfe07e11"
        byol = "ami-02e3667090ce1671c"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-05ca54757eb5ab07e"
        payg = "ami-0be8f068fbdbdb1be"
      },
      x86 = {
        byol = "ami-01ef23248a893959a"
        payg = "ami-06eb0459d8ca5f712"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-00cbf5473878d9667"
        byol = "ami-08b71a9b4e9635137"
      },
      x86 = {
        payg = "ami-094edcc5079d82bb8"
        byol = "ami-0a7c047620b52dd5f"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-09a8a51d7d060fc7c"
        byol = "ami-0b1d5731f95dcd3e5"
      },
      x86 = {
        byol = "ami-01213f26d851455ec"
        payg = "ami-0144b4483c9668a30"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-08e3216286b180c66"
        payg = "ami-0ddacce2ef55d38fb"
      },
      x86 = {
        byol = "ami-06b18c9c189446145"
        payg = "ami-0c47eb375e354de4f"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-00ad8a51c038b15d4"
        payg = "ami-02650988f1eed8e59"
      },
      x86 = {
        payg = "ami-00b342650de1f2a1d"
        byol = "ami-00cbf8f23cbb7d4df"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-0736b3034ecafcd0f"
        byol = "ami-0c9f8b093db2448f7"
      },
      x86 = {
        byol = "ami-06b28ae3a2986c7c1"
        payg = "ami-067f0b73980314ccd"
      }
    },
    ap-southeast-6 = {
      x86 = {
        byol = "ami-093540ac8f6f4e038"
        payg = "ami-0e4ea1e6675755d6e"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-01757ecd9c3000c10"
        payg = "ami-059d6f7c3db3ae7fa"
      },
      x86 = {
        byol = "ami-0a62f90b487944d1d"
        payg = "ami-0ca05499120f148ca"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0e0bb131a146355e0"
        byol = "ami-0f5ced639b5a64824"
      },
      x86 = {
        byol = "ami-094fbd6f41f70db3d"
        payg = "ami-0c39c3cb85558ab1e"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0039ace2fb8050f49"
        payg = "ami-0a141f99798cc03b1"
      },
      x86 = {
        byol = "ami-087c80797bb9b7898"
        payg = "ami-0cd8c360f058d20f4"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-01d52b0b9ae0be4d0"
        payg = "ami-097699cc77a6618ab"
      },
      x86 = {
        byol = "ami-04075908b0d482c35"
        payg = "ami-0c172d37e58fedac4"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-011ee94a11c3cf156"
        payg = "ami-081f047e425f04430"
      },
      x86 = {
        payg = "ami-0114c9c88edc03aca"
        byol = "ami-0c7112b64ea159cd6"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-07ffb041418ed4dfc"
        byol = "ami-0f2aaa786e9b72ddd"
      },
      x86 = {
        byol = "ami-087f66dbecba0c06f"
        payg = "ami-0ad81efa863f56ee7"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-057fe113e1063fdd0"
        byol = "ami-0c9d0ec566c02c3ba"
      },
      x86 = {
        payg = "ami-01eba5bbb0127c415"
        byol = "ami-05ddb49946e9c0fc1"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-08e9180c0c711b3a7"
        payg = "ami-0de93b4dd184725f7"
      },
      x86 = {
        byol = "ami-07b543ad246c2f12f"
        payg = "ami-0f1ee1b22c9f462e2"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-05216b34d1ffe9a6d"
        byol = "ami-0b597f5e16a8799da"
      },
      x86 = {
        payg = "ami-0341068a703a09f65"
        byol = "ami-0f751b883e68cc31b"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-07be0ed6f10c54f52"
        payg = "ami-08537d6f5a2f8a213"
      },
      x86 = {
        payg = "ami-040e929ce10b24c97"
        byol = "ami-068d8a6dcb38f42e5"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-009641cad360466d6"
        payg = "ami-05b941540b4d035fc"
      },
      x86 = {
        payg = "ami-068f683d6eb8b445e"
        byol = "ami-0970a435ccbcdff23"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-06cc022251865c49b"
        byol = "ami-074b0ef9a4fd288a7"
      },
      x86 = {
        byol = "ami-01dbc091144837fe8"
        payg = "ami-0cfc285821aa92376"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0e0a13c476ee698f4"
        byol = "ami-0f5f3a63518bcb24f"
      },
      x86 = {
        byol = "ami-0175b4c2fbfe16568"
        payg = "ami-05aa693cbfa6d2a81"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-06fc164cddd116687"
        byol = "ami-0f0461ffce66f64cc"
      },
      x86 = {
        byol = "ami-043bd753f73070332"
        payg = "ami-059ee459101dc17ec"
      }
    },
    mx-central-1 = {
      arm = {
        payg = "ami-020fb72d32d70741b"
        byol = "ami-02b6ffce9303d1eee"
      },
      x86 = {
        payg = "ami-09b129db8e6fea450"
        byol = "ami-0db306a1ed4c4eb4f"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-07361223accdbd801"
        byol = "ami-09224788401921a00"
      },
      x86 = {
        payg = "ami-0429892ffebb93a5c"
        byol = "ami-0a3a8f744392aa28a"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-06a71763fcab4025c"
        payg = "ami-095cce9c959746f83"
      },
      x86 = {
        byol = "ami-01ef45036853f5b0a"
        payg = "ami-02dcfe1aee3b8ccad"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-01ef351a0009195fd"
        byol = "ami-06df737aa08e7aae0"
      },
      x86 = {
        payg = "ami-0dad438d7975026ea"
        byol = "ami-0ee04acf6fd00dd74"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-00dadf4c51b10b065"
        byol = "ami-0da60326942586e98"
      },
      x86 = {
        byol = "ami-010a8486a6db0d2f4"
        payg = "ami-0dc3d36fbce469850"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0805d7d56defa8a66"
        byol = "ami-0bf12a2d6468014e8"
      },
      x86 = {
        byol = "ami-0a7e447aa1c51e45c"
        payg = "ami-0d6339c5414e18bc0"
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

