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

variable "az2" {
  default = "eu-west-1b"
}

// VPC for FortiGate Security VPC
variable "vpccidr" {
  default = "10.1.0.0/16"
}

variable "publiccidraz1" {
  default = "10.1.0.0/24"
}

variable "privatecidraz1" {
  default = "10.1.1.0/24"
}


// VPC for Customer VPC
variable "csvpccidr" {
  default = "20.1.0.0/16"
}

variable "cspubliccidraz1" {
  default = "20.1.0.0/24"
}

variable "csprivatecidraz1" {
  default = "20.1.1.0/24"
}


variable "cspubliccidraz2" {
  default = "20.1.2.0/24"
}

variable "csprivatecidraz2" {
  default = "20.1.3.0/24"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, file.
variable "license_format" {
  default = "file"
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

// AMIs for FGTVM-7.6.5
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        byol = "ami-05b751428e646c4fd"
        payg = "ami-0a23c37468cbb4137"
      },
      x86 = {
        byol = "ami-09ac3417587185809"
        payg = "ami-0bbcef7d05300b761"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-067480c3fdd96ac32"
        byol = "ami-082ac0a9b8fb1f108"
      },
      x86 = {
        byol = "ami-04e537a07e0ac2927"
        payg = "ami-0d6fab3af31f14d45"
      }
    },
    ap-east-2 = {
      x86 = {
        byol = "ami-04070b132232de018"
        payg = "ami-0728d0c1bd1793d26"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0089619b381040985"
        payg = "ami-0724acaf713ea9db1"
      },
      x86 = {
        payg = "ami-0ac8e203289cec55c"
        byol = "ami-0a9835675dd41659b"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-009047740271a1179"
        payg = "ami-0cdd51500d67b2ad1"
      },
      x86 = {
        byol = "ami-0cf2cabb25e2a529c"
        payg = "ami-0e66dbe79b948dd09"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-037e4c9cd353ec7b7"
        byol = "ami-04bbff08c8e5135bd"
      },
      x86 = {
        byol = "ami-010b25d92ef70b375"
        payg = "ami-0cf21f046aa090bbd"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0a1bdadb10b381bb0"
        byol = "ami-0f194bbaa55a66905"
      },
      x86 = {
        payg = "ami-017c2f985b7e955e5"
        byol = "ami-06df4de7e16fc019b"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0f0a38d904107b063"
        payg = "ami-0f28afee488498ec2"
      },
      x86 = {
        byol = "ami-020cb803147409b14"
        payg = "ami-0c014f96b905f50ed"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-02b6662bcaa1eae43"
        byol = "ami-0e71c8e2617e02f79"
      },
      x86 = {
        byol = "ami-004187244eeae5e06"
        payg = "ami-08297c9fb6f9bee2a"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-00da3a839a3dd2943"
        payg = "ami-08a778a162a7969ce"
      },
      x86 = {
        payg = "ami-0a4d260117cdc86c8"
        byol = "ami-0b1f2d4a19bc46f44"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0387e8c0cf2ac3338"
        payg = "ami-0766e702ed0ebe941"
      },
      x86 = {
        payg = "ami-094cd605cc5585edd"
        byol = "ami-0cc22d5185f4ec734"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-02bb22ea904db0f23"
        byol = "ami-091135b73dce0b9bf"
      },
      x86 = {
        byol = "ami-050574e1d8131f535"
        payg = "ami-0a1b789a8cb4ff290"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-018fefc0504d048d0"
        payg = "ami-0294b08d2741f3337"
      },
      x86 = {
        byol = "ami-00c771c30bd2c5c59"
        payg = "ami-05896f11616569fd5"
      }
    },
    ap-southeast-6 = {
      x86 = {
        byol = "ami-0a461da3bb724620d"
        payg = "ami-09a69b4aa33de29fc"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-02b7e5055cf2297c9"
        payg = "ami-0b37f836c89031a18"
      },
      x86 = {
        byol = "ami-07f6cb18cc52e3b00"
        payg = "ami-0e23ceba128bab6f6"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0259cb582f5f5e717"
        payg = "ami-0cd30fe0d121ff782"
      },
      x86 = {
        payg = "ami-09a532a2f8c6b4ece"
        byol = "ami-0dac9c950711eeea5"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-05dcb790ff206a02e"
        payg = "ami-0f229e143ebcdc6d3"
      },
      x86 = {
        byol = "ami-044161a9861bb34a3"
        payg = "ami-0f9389e29adf6aea0"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-03eed5e35f1fc12d7"
        byol = "ami-0528bd38b9c512266"
      },
      x86 = {
        payg = "ami-00c340283e7e40825"
        byol = "ami-08c84542e9fa60d2c"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0d87bcac0be8eafb0"
        payg = "ami-0dee57812a6c437d3"
      },
      x86 = {
        byol = "ami-09ca25fb4916b2f25"
        payg = "ami-0bd4eb797d2442430"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0464743b6907b5bf9"
        byol = "ami-03e4fb16fdef4cde6"
      },
      x86 = {
        payg = "ami-066db7c3fa11294d0"
        byol = "ami-0ab0926e453ce2e7f"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0848e49792d27cfe4"
        payg = "ami-0a02d7ff8d1eefdfe"
      },
      x86 = {
        payg = "ami-059ed724bd17ee65b"
        byol = "ami-084616152d2c86d79"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-002fa28b31a4c7ffb"
        payg = "ami-0757cb38674c17551"
      },
      x86 = {
        payg = "ami-0d78a9378c339563e"
        byol = "ami-0f718a2f39f03e965"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0eb810a51a8401e04"
        payg = "ami-0fd48149f8f2d5291"
      },
      x86 = {
        payg = "ami-06a7fc4a4e9d766aa"
        byol = "ami-0835220c7b65fd43e"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0fef03e76f7209f8f"
        payg = "ami-0fd48ad10a3aba251"
      },
      x86 = {
        payg = "ami-005f12cede7550514"
        byol = "ami-04230ae3fbe976ea6"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-027f352610e329d21"
        byol = "ami-07ca849c0513439e9"
      },
      x86 = {
        payg = "ami-06f0d762177578132"
        byol = "ami-0a53b3629d9030e43"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-018cfb0eb3ae7b3d5"
        payg = "ami-0fbc100bf0a02e5ad"
      },
      x86 = {
        payg = "ami-03bf57cb30616c2cd"
        byol = "ami-051180ec04e007b80"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0a129a870dfc14e94"
        payg = "ami-0e01ab2281f3dc77c"
      },
      x86 = {
        payg = "ami-0113b4eab9d986f9c"
        byol = "ami-0d3dbd38648bb2c50"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0447a9876cc64bdd9"
        byol = "ami-08fe02fcde5b5e734"
      },
      x86 = {
        byol = "ami-000ad40ae89c1cc19"
        payg = "ami-0cb6fb557b80af853"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-0d04617a2d7ae8ac6"
        payg = "ami-0dab4c2f44e60849d"
      },
      x86 = {
        byol = "ami-06a2ab0837903da3b"
        payg = "ami-0da64019b4198f222"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0f59a3955c398c186"
        byol = "ami-0f256336d7dc8ada1"
      },
      x86 = {
        payg = "ami-0bcec25af48d85100"
        byol = "ami-0e5c3e64c5e55ed60"
      }
    },
    us-east-1 = {
      arm = {
        payg = "ami-0508b021d9e5ab0e5"
        byol = "ami-058f3a672e5fea6e3"
      },
      x86 = {
        payg = "ami-02406422b8751f973"
        byol = "ami-0a4add777dfc8ab6c"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0470b497dcae7a480"
        byol = "ami-0d56f3c9731a4123f"
      },
      x86 = {
        payg = "ami-021df6f7ce5f17ecd"
        byol = "ami-022fc4a3e086c890e"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-00a8ac3f2d577946c"
        byol = "ami-07ae666072110cc30"
      },
      x86 = {
        payg = "ami-03715b6e6b066ac34"
        byol = "ami-0e95da8848c7cb7ba"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-017c4f833100433d7"
        payg = "ami-0c96fab085792db9f"
      },
      x86 = {
        payg = "ami-0c3a0d6dea2419085"
        byol = "ami-0c321ed1d6381e943"
      }
    }
  }
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "<AWS SSH KEY>"
}

//  Admin HTTPS access port
variable "adminsport" {
  default = "443"
}

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
