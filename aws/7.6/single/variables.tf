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

variable "vpccidr" {
  default = "10.1.0.0/16"
}

variable "publiccidraz1" {
  default = "10.1.0.0/24"
}

variable "privatecidraz1" {
  default = "10.1.1.0/24"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "token"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// use s3 bucket for bootstrap
// Either true or false
//
variable "bucket" {
  type    = bool
  default = "false"
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

// AMIs for FGTVM-7.6.0
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-07e8be95a3e2569a6"
        byol = "ami-0e1b088dc9b1d440b"
      },
      x86 = {
        payg = "ami-0d33aefd9570ef336"
        byol = "ami-0337ef068426bf493"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0c026f8bc6cf899dd"
        byol = "ami-00208c4e97bd077be"
      },
      x86 = {
        payg = "ami-0b053e06e5318abce"
        byol = "ami-0102b7b136ffb414f"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-01f43ac869a4d3fc0"
        byol = "ami-004ecebd3b1c8b36b"
      },
      x86 = {
        payg = "ami-0069be80f06b506c9"
        byol = "ami-004ecebd3b1c8b36b"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-088e604329948f57f"
        byol = "ami-07e6523e7b4fd3bc8"
      },
      x86 = {
        payg = "ami-07ec0b6fea82ae098"
        byol = "ami-0c732b364a291db35"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-0f2f91ee24ebcf4a0"
        byol = "ami-083d6f8bb92eceee6"
      },
      x86 = {
        payg = "ami-0c40f01a8525b3b69"
        byol = "ami-0f1dc9e045374688a"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0d8493b97949af158"
        byol = "ami-0d2c5dbb45a9c101d"
      },
      x86 = {
        payg = "ami-0d73bd50ded25732d"
        byol = "ami-0b25539c461118c9d"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0f9ec3b3a505b52ea"
        byol = "ami-036d06e610b9291e5"
      },
      x86 = {
        payg = "ami-02cf0af64c7be1e6c"
        byol = "ami-09fe72340bb5dab1c"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0a4e411973fba62c6"
        byol = "ami-03291e5b0b4635029"
      },
      x86 = {
        payg = "ami-04cef1443cdae989e"
        byol = "ami-0fbb9838a8d140a68"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-02e3088d08a963925"
        byol = "ami-08affe4343719a53a"
      },
      x86 = {
        payg = "ami-04bf1aace02abd594"
        byol = "ami-07ed12b4355247eee"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-09f5713b3c0a82684"
        byol = "ami-04be38cbc9ce583b7"
      },
      x86 = {
        payg = "ami-0f8b2676593332390"
        byol = "ami-0142e4c6b1a46e8d3"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-03b4985a86a10a68a"
        byol = "ami-0ccc52988e402af00"
      },
      x86 = {
        payg = "ami-0733ee91adc66d61f"
        byol = "ami-05d883dbc4e4aa694"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-01cfe86ce2afc0b84"
        byol = "ami-0c9fdd47fb5b14e5e"
      },
      x86 = {
        payg = "ami-0762e7103decbbb7b"
        byol = "ami-00a88f9c51bf074e4"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0dad026f42b593eaf"
        byol = "ami-04990bfeecdcc6ab0"
      },
      x86 = {
        payg = "ami-01f9d734fc6091c5b"
        byol = "ami-007e33ac560c55144"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0a7159318f086358f"
        byol = "ami-07192d3458cf51a0e"
      },
      x86 = {
        payg = "ami-02e31d37ec350ccfa"
        byol = "ami-07dfe4c56d45564e5"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0ce0c2833ae9a735d"
        byol = "ami-006bada376b5cd572"
      },
      x86 = {
        payg = "ami-099f3e749ffa9d9d4"
        byol = "ami-01610d30e07cb80b2"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-089341baea9980243"
        byol = "ami-0c321e3eb69b366d8"
      },
      x86 = {
        payg = "ami-0ca07cbf810e30f13"
        byol = "ami-0b09782abdf7b5f4e"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0478f602da960da97"
        byol = "ami-012b6231b2a9e7d99"
      },
      x86 = {
        payg = "ami-019e091ca4248a630"
        byol = "ami-073419585fab4fc59"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-07685265a35910300"
        byol = "ami-0275d6d39c0535079"
      },
      x86 = {
        payg = "ami-0125a81a4377817fd"
        byol = "ami-0267504a99068558b"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-07b995756f80c98f7"
        byol = "ami-0f4964b5f55bbfff2"
      },
      x86 = {
        payg = "ami-0f3abbf1eb9a72238"
        byol = "ami-0df64208c8337c011"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0e4d3276835943499"
        byol = "ami-012314c25640e1423"
      },
      x86 = {
        payg = "ami-03e2195a11219eb43"
        byol = "ami-03b2e272c139e733f"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-059e94af31cd34edf"
        byol = "ami-0c34380e6f9325500"
      },
      x86 = {
        payg = "ami-04316e0850f1b16f3"
        byol = "ami-02b25623c3c519ccb"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-07feaa073a39a9bad"
        byol = "ami-0304e8eac2d36d476"
      },
      x86 = {
        payg = "ami-0e3c04ca95c5b3cc9"
        byol = "ami-06309b5534966541c"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-04b36131885199373"
        byol = "ami-06e1b2d75553beed5"
      },
      x86 = {
        payg = "ami-00b5b24a2e4960eac"
        byol = "ami-0a18b17b6a121f86d"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0fe219ff5e8bd30dd"
        byol = "ami-028f49522a0843eb1"
      },
      x86 = {
        payg = "ami-082dd35bf061b7adb"
        byol = "ami-0e76c5d757234efb5"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0c3b58e84e29a8edc"
        byol = "ami-08a9e7c3e3f00b3b9"
      },
      x86 = {
        payg = "ami-070c4ada0a108f20d"
        byol = "ami-005d69f65381be87e"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-09c21708d55032aab"
        byol = "ami-02eed2206da299277"
      },
      x86 = {
        payg = "ami-0002f460ebf0b2434"
        byol = "ami-02ca824d60ca023d1"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0c298a871fcd176b2"
        byol = "ami-02e5c81e4591747ab"
      },
      x86 = {
        payg = "ami-0ec192f3151c8a89f"
        byol = "ami-0b8b98bda12015b59"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-09755b902d7ca42e3"
        byol = "ami-0190a0f6c859b25b1"
      },
      x86 = {
        payg = "ami-04ebc2cdd1f4a7db6"
        byol = "ami-06fa1fb94240c3fae"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0e243f709206f4158"
        byol = "ami-0b2c7d36334ae5a67"
      },
      x86 = {
        payg = "ami-0a4b903757955b64e"
        byol = "ami-07ef1f07da7e6bb70"
      }
    }
  }
}


//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY>"
}

variable "adminsport" {
  default = "8443"
}

// FGTVM config in plaintext Format for S3 Bucket
variable "bootstrap-fgtvm" {
  // Change to your own path
  type    = string
  default = "fgtvm.conf"
}

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}
