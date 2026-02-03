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

variable "attachcidraz1" {
  default = "10.1.2.0/24"
}

variable "gwlbcidraz1" {
  default = "10.1.3.0/24"
}

variable "publiccidraz2" {
  default = "10.1.4.0/24"
}

variable "privatecidraz2" {
  default = "10.1.5.0/24"
}

variable "attachcidraz2" {
  default = "10.1.6.0/24"
}

variable "gwlbcidraz2" {
  default = "10.1.7.0/24"
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

// VPC for Customer2 VPC
variable "cs2vpccidr" {
  default = "30.1.0.0/16"
}

variable "cs2publiccidraz1" {
  default = "30.1.0.0/24"
}

variable "cs2privatecidraz1" {
  default = "30.1.1.0/24"
}


variable "cs2publiccidraz2" {
  default = "30.1.2.0/24"
}

variable "cs2privatecidraz2" {
  default = "30.1.3.0/24"
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
  default = "arm"
}

// instance type needs to match the architect
// c5.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c6g.xlarge"
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

// AMIs for FGTVM-7.6.6
variable "fgtami" {
  type = map(any)
  default = {
    f-south-1 = {
      arm = {
        byol = "ami-002fe329850eec4a5"
        payg = "ami-0e9a2d7cae714c977"
      },
      x86 = {
        payg = "ami-01c6579b72fbb3ff6"
        byol = "ami-06f1bf4ba1e926770"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-07e04267bb15fb6b1"
        payg = "ami-0b33dbbc7649aec45"
      },
      x86 = {
        byol = "ami-01f63f3d5fa72cd85"
        payg = "ami-04ddec2a5ccdc15bc"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-010eb61d55d411625"
        payg = "ami-01f15f1f4398bfcf6"
      },
      x86 = {
        payg = "ami-053f7edbe8ec792a5"
        byol = "ami-0b932c3ec18e6377d"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-05034f43200fee769"
        payg = "ami-0f4ae0ca17016e8c0"
      },
      x86 = {
        byol = "ami-0cba2c5c73c903ebc"
        payg = "ami-0f87df0f163f23936"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-02b072cb24bd60333"
        payg = "ami-098783e1ab6e1706f"
      },
      x86 = {
        byol = "ami-0c4df3924c5d76195"
        payg = "ami-0ecf72aba9e72c5c1"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-04431c90bc9368fc0"
        payg = "ami-058120b5396c28544"
      },
      x86 = {
        payg = "ami-069ed66cbf65bb745"
        byol = "ami-0c87bdeff42bc77ab"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0e09f561c6e3dd419"
        payg = "ami-0fa85a76da6b95440"
      },
      x86 = {
        byol = "ami-0b69e2320501c8d40"
        payg = "ami-0d8ef128a06dec386"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-091f32a7003b9d62d"
        payg = "ami-0e1cd561a4218d1dd"
      },
      x86 = {
        payg = "ami-0d64ad82e3c1ab32f"
        byol = "ami-0fdbe1b27ba32fdff"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-01d821f22bde68210"
        byol = "ami-0c3563a540524ab99"
      },
      x86 = {
        payg = "ami-0ab82ab796dc6fb06"
        byol = "ami-0c523553e7a61ff8e"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0246bc18a4ca18f55"
        byol = "ami-0c8cc7053d63b2771"
      },
      x86 = {
        byol = "ami-05e6f49f62ba2e683"
        payg = "ami-08286e4ef86aec6c7"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-00053215ef0d32511"
        byol = "ami-0d757f7d7beaca76d"
      },
      x86 = {
        byol = "ami-06ae1c9728db521d1"
        payg = "ami-0b06121e4d8c4bc1c"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0585a534cf313875a"
        byol = "ami-082981f5fb785d1f4"
      },
      x86 = {
        payg = "ami-050010ef35c3d439c"
        byol = "ami-09436a7e1037f5b78"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-084d976c231005933"
        payg = "ami-097d1573f9c39829d"
      },
      x86 = {
        payg = "ami-027ee6db0fcfb7cc0"
        byol = "ami-09c0aa7fff02be271"
      }
    },
    ap-southeast-6 = {
      x86 = {
        byol = "ami-0a53b5df8cf8ab55e"
        payg = "ami-0b67365620ebcea5e"
      }
    },
    ap-southeast-7 = {
      arm = {
        payg = "ami-02809403bfd1fe2d1"
        byol = "ami-0320c2176ce286860"
      },
      x86 = {
        byol = "ami-05447ead9d2a0a260"
        payg = "ami-0ac80d406c4b734e2"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-07880c451fa76e45d"
        payg = "ami-0d663c59ed62e60ca"
      },
      x86 = {
        payg = "ami-0cac385a586155b50"
        byol = "ami-0e84df2d4e855dec4"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0baa75b239cb77b94"
        byol = "ami-0d984162a0a6872f7"
      },
      x86 = {
        payg = "ami-0396408cc29f29478"
        byol = "ami-0e3ae065e1ff7055d"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0232f2865725d360e"
        payg = "ami-0d6389affc1ade5f8"
      },
      x86 = {
        byol = "ami-0554a38241de5c6c5"
        payg = "ami-08dae0008e288de66"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0a791280fad8a49fd"
        payg = "ami-0b26ff00f6ae67bc3"
      },
      x86 = {
        byol = "ami-09f3e515659fdb8d3"
        payg = "ami-0bc5644984a1c3f4f"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0283d156015737e27"
        payg = "ami-0689fdd63a2923e59"
      },
      x86 = {
        byol = "ami-00f6bcb2283c95e2d"
        payg = "ami-0b7a397935dcc0972"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-06b29013e77ae45ae"
        payg = "ami-08981ddccde22a208"
      },
      x86 = {
        payg = "ami-03cde99249bcf98b6"
        byol = "ami-088633f44866ae7ac"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-029e5abbbadfc0043"
        byol = "ami-09854a0fa49192075"
      },
      x86 = {
        byol = "ami-069327ee25da6fe49"
        payg = "ami-0a827f82480c613d4"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-03721de10722f6533"
        byol = "ami-0a44efc167a0ff0af"
      },
      x86 = {
        payg = "ami-0176c7327ed855dcf"
        byol = "ami-0af220a165b49791f"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-09280c3b7143780c7"
        byol = "ami-0d4ddee63b2cedd5e"
      },
      x86 = {
        byol = "ami-0128ce8f33d4267cd"
        payg = "ami-07ca6830f50352d5a"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-08ed8f767b2eafc94"
        payg = "ami-0938a5ec6cbccd803"
      },
      x86 = {
        payg = "ami-07519c84fee795a27"
        byol = "ami-0ed7e96996dba64a8"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0bace2a0f4574f9cd"
        byol = "ami-0d7da387985376c1a"
      },
      x86 = {
        payg = "ami-044268fc72067fcd3"
        byol = "ami-09f85638796e27d46"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0046618f8979d7032"
        payg = "ami-04996bddb00c986f5"
      },
      x86 = {
        byol = "ami-0000f1d2a48e33c34"
        payg = "ami-035c1d1f171b386d7"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0350f7ff470c935de"
        payg = "ami-04b6271af7febfc6a"
      },
      x86 = {
        byol = "ami-03de9e0c9c6ddc10d"
        payg = "ami-088ad7ed3614aef0f"
      }
    },
    mx-central-1 = {
      arm = {
        payg = "ami-00fe7c0456cb26c71"
        byol = "ami-0433c679f393dbd07"
      },
      x86 = {
        payg = "ami-0eeda43fa03f4a459"
        byol = "ami-0e0df1b72626ad9d5"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0ba5ce9d98d08d748"
        byol = "ami-0b2a70381239658b6"
      },
      x86 = {
        payg = "ami-013776368e6ff89c5"
        byol = "ami-036ee9a575dfbf3ef"
      }
    },
    us-east-1 = {
      arm = {
        payg = "ami-0963f30f4f3f986ff"
        byol = "ami-0b7030b7e5c00882e"
      },
      x86 = {
        payg = "ami-0b2f4efe290dbf113"
        byol = "ami-0d2836fe1ff906399"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-021f85a610a4239e3"
        payg = "ami-09c3712e14f497764"
      },
      x86 = {
        payg = "ami-095d72715b0750bd0"
        byol = "ami-0f3303f84c7055005"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0a5a85e223b7ac043"
        payg = "ami-0c2e9c73dbfa2a887"
      },
      x86 = {
        payg = "ami-06d31108972b5b63d"
        byol = "ami-0ed269a745c7f33de"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0642edbaf7a31d1a5"
        payg = "ami-0f68cc4dc427f829c"
      },
      x86 = {
        byol = "ami-01491c13247962223"
        payg = "ami-09027db74f265cf7f"
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

variable "bootstrap-fgtvm2" {
  // Change to your own path
  type    = string
  default = "fgtvm2.conf"
}


//license files for the two fgts
variable "licenses" {
  // Change to your own byol license files
  type    = list(string)
  default = ["license.lic", "license2.lic"]
}
