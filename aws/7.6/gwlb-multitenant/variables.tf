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


// VPC for Customer2 VPC
variable "cs2vpccidr" {
  default = "21.1.0.0/16"
}

variable "cs2publiccidraz1" {
  default = "21.1.0.0/24"
}

variable "cs2privatecidraz1" {
  default = "21.1.1.0/24"
}


variable "cs2publiccidraz2" {
  default = "21.1.2.0/24"
}

variable "cs2privatecidraz2" {
  default = "21.1.3.0/24"
}


// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, byol.
variable "license_type" {
  default = "byol"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either token or file.
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
// Either x86 or arm
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

// AMIs for FGTVM-7.6.6
variable "fgtami" {
  type = map(any)
  default = {
    f-south-1 = {
      arm = {
        byol = "ami-002fe329850eec4a5"
      },
      x86 = {
        byol = "ami-06f1bf4ba1e926770"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-07e04267bb15fb6b1"
      },
      x86 = {
        byol = "ami-01f63f3d5fa72cd85"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-010eb61d55d411625"
      },
      x86 = {
        byol = "ami-0b932c3ec18e6377d"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-05034f43200fee769"
      },
      x86 = {
        byol = "ami-0cba2c5c73c903ebc"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-02b072cb24bd60333"
      },
      x86 = {
        byol = "ami-0c4df3924c5d76195"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-04431c90bc9368fc0"
      },
      x86 = {
        byol = "ami-0c87bdeff42bc77ab"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0e09f561c6e3dd419"
      },
      x86 = {
        byol = "ami-0b69e2320501c8d40"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-091f32a7003b9d62d"
      },
      x86 = {
        byol = "ami-0fdbe1b27ba32fdff"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0c3563a540524ab99"
      },
      x86 = {
        byol = "ami-0c523553e7a61ff8e"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0c8cc7053d63b2771"
      },
      x86 = {
        byol = "ami-05e6f49f62ba2e683"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0d757f7d7beaca76d"
      },
      x86 = {
        byol = "ami-06ae1c9728db521d1"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-082981f5fb785d1f4"
      },
      x86 = {
        byol = "ami-09436a7e1037f5b78"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-084d976c231005933"
      },
      x86 = {
        byol = "ami-09c0aa7fff02be271"
      }
    },
    ap-southeast-6 = {
      x86 = {
        byol = "ami-0a53b5df8cf8ab55e"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0320c2176ce286860"
      },
      x86 = {
        byol = "ami-05447ead9d2a0a260"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-07880c451fa76e45d"
      },
      x86 = {
        byol = "ami-0e84df2d4e855dec4"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0d984162a0a6872f7"
      },
      x86 = {
        byol = "ami-0e3ae065e1ff7055d"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0232f2865725d360e"
      },
      x86 = {
        byol = "ami-0554a38241de5c6c5"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0a791280fad8a49fd"
      },
      x86 = {
        byol = "ami-09f3e515659fdb8d3"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0283d156015737e27"
      },
      x86 = {
        byol = "ami-00f6bcb2283c95e2d"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-06b29013e77ae45ae"
      },
      x86 = {
        byol = "ami-088633f44866ae7ac"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-09854a0fa49192075"
      },
      x86 = {
        byol = "ami-069327ee25da6fe49"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0a44efc167a0ff0af"
      },
      x86 = {
        byol = "ami-0af220a165b49791f"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-0d4ddee63b2cedd5e"
      },
      x86 = {
        byol = "ami-0128ce8f33d4267cd"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-08ed8f767b2eafc94"
      },
      x86 = {
        byol = "ami-0ed7e96996dba64a8"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0d7da387985376c1a"
      },
      x86 = {
        byol = "ami-09f85638796e27d46"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0046618f8979d7032"
      },
      x86 = {
        byol = "ami-0000f1d2a48e33c34"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0350f7ff470c935de"
      },
      x86 = {
        byol = "ami-03de9e0c9c6ddc10d"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-0433c679f393dbd07"
      },
      x86 = {
        byol = "ami-0e0df1b72626ad9d5"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0b2a70381239658b6"
      },
      x86 = {
        byol = "ami-036ee9a575dfbf3ef"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0b7030b7e5c00882e"
      },
      x86 = {
        byol = "ami-0d2836fe1ff906399"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-021f85a610a4239e3"
      },
      x86 = {
        byol = "ami-0f3303f84c7055005"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0a5a85e223b7ac043"
      },
      x86 = {
        byol = "ami-0ed269a745c7f33de"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0642edbaf7a31d1a5"
      },
      x86 = {
        byol = "ami-01491c13247962223"
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
