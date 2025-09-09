//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

variable "az" {
  default = "eu-west-1a"
}

variable "vpccidr" {
  default = "10.1.0.0/16"
}

variable "publiccidr" {
  default = "10.1.0.0/24"
}

variable "privatecidr" {
  default = "10.1.1.0/24"
}

variable "hasynccidr" {
  default = "10.1.2.0/24"
}

variable "hamgmtcidr" {
  default = "10.1.3.0/24"
}

// Preshare key for autoscale
variable "presharekey" {
  default = "Test123#"
}

// Load Balancer Listen rules for forwarding the traffic
variable "test_forwarding_config" {
  default = {
    80  = "TCP"
    443 = "TCP"
  }
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "byol"
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
// x86 or arm
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

// AMIs for FGTVM-7.6.4
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      x86 = {
        byol = "ami-0333782d3467101c4"
        payg = "ami-0a2aaa61326aa5638"
      }
    },
    ap-east-1 = {
      x86 = {
        byol = "ami-08a630285d04e4fea"
        payg = "ami-0ab414a2611ca8568"
      }
    },
    ap-east-2 = {
      x86 = {
        byol = "ami-006fb279f52241280"
        payg = "ami-08d2bd2d5fa390cb7"
      }
    },
    ap-northeast-1 = {
      x86 = {
        payg = "ami-0223afc484b71bd2c"
        byol = "ami-05da04ba94924394b"
      }
    },
    ap-northeast-2 = {
      x86 = {
        payg = "ami-0831d23606841df52"
        byol = "ami-080a811571020c88d"
      }
    },
    ap-northeast-3 = {
      x86 = {
        payg = "ami-018e2c2b68d3af5ad"
        byol = "ami-0f2b82184a6f10a5d"
      }
    },
    ap-south-1 = {
      x86 = {
        payg = "ami-060642135eb5bfcc4"
        byol = "ami-068b39f0a99ef7fec"
      }
    },
    ap-south-2 = {
      x86 = {
        byol = "ami-03010041638cc00df"
        payg = "ami-06acf16b029a42ed5"
      }
    },
    ap-southeast-1 = {
      x86 = {
        payg = "ami-025ff5a37daf75d87"
        byol = "ami-0aff761deaceea65e"
      }
    },
    ap-southeast-2 = {
      x86 = {
        payg = "ami-09598bb7c15e739cf"
        byol = "ami-0db26387d0e8fac3b"
      }
    },
    ap-southeast-3 = {
      x86 = {
        payg = "ami-00dc7d5518b5cd46a"
        byol = "ami-029ec0592b50556e5"
      }
    },
    ap-southeast-4 = {
      x86 = {
        payg = "ami-043c2e6c4a1c727c4"
        byol = "ami-0fcf304a3df7333b1"
      }
    },
    ap-southeast-5 = {
      x86 = {
        byol = "ami-060d631aa946be099"
        payg = "ami-0db20e837f49a6d50"
      }
    },
    ap-southeast-7 = {
      x86 = {
        payg = "ami-00e702e5e53238c74"
        byol = "ami-0de931c0ddaf47b75"
      }
    },
    ca-central-1 = {
      x86 = {
        payg = "ami-055afa06940ef6dda"
        byol = "ami-069f74f059ba4843e"
      }
    },
    ca-west-1 = {
      x86 = {
        payg = "ami-0aae22c44c6a50dbd"
        byol = "ami-0f51e38f829f78d30"
      }
    },
    eu-central-1 = {
      x86 = {
        payg = "ami-00648610b90b1963d"
        byol = "ami-014e3714647c41e91"
      }
    },
    eu-central-2 = {
      x86 = {
        byol = "ami-0367a61149646468c"
        payg = "ami-056ca566e28340259"
      }
    },
    eu-north-1 = {
      x86 = {
        payg = "ami-079fcef8c21c1927b"
        byol = "ami-0d6bf4561b42efb0a"
      }
    },
    eu-south-1 = {
      x86 = {
        byol = "ami-0892196b4e7722db0"
        payg = "ami-09ea20d1a7e07a27f"
      }
    },
    eu-south-2 = {
      x86 = {
        payg = "ami-05b092d15b394c49f"
        byol = "ami-0722e430540644827"
      }
    },
    eu-west-1 = {
      x86 = {
        payg = "ami-0142ee851bd65bd14"
        byol = "ami-0d8777d2d0215419b"
      }
    },
    eu-west-2 = {
      x86 = {
        byol = "ami-0011e5df6a1cc865d"
        payg = "ami-0436e29fed535b676"
      }
    },
    eu-west-3 = {
      x86 = {
        byol = "ami-01f4cf7b315c53054"
        payg = "ami-045d9c5ce697b167a"
      }
    },
    il-central-1 = {
      x86 = {
        payg = "ami-037bb5f227c004757"
        byol = "ami-0d656be65730ddf69"
      }
    },
    me-central-1 = {
      x86 = {
        byol = "ami-0797e0963e52c12b7"
        payg = "ami-07d2e882eda27a9bc"
      }
    },
    me-south-1 = {
      x86 = {
        payg = "ami-020e62e9ab8979b8b"
        byol = "ami-01aac3ac4770306a1"
      }
    },
    mx-central-1 = {
      x86 = {
        payg = "ami-082b7f042076f21dd"
        byol = "ami-0e716cedf64906925"
      }
    },
    sa-east-1 = {
      x86 = {
        payg = "ami-047456d4861cb54f0"
        byol = "ami-096c27177d35d30e5"
      }
    },
    us-east-1 = {
      x86 = {
        payg = "ami-04a9cf126e66612f0"
        byol = "ami-0b332c0226afc1a6b"
      }
    },
    us-east-2 = {
      x86 = {
        byol = "ami-02ea72889044b0b49"
        payg = "ami-08f4bf15e8e431bf6"
      }
    },
    us-west-1 = {
      x86 = {
        payg = "ami-07d78d7d4f78e11d0"
        byol = "ami-0940c420b6fc4a4fc"
      }
    },
    us-west-2 = {
      x86 = {
        payg = "ami-064c154d272ed3690"
        byol = "ami-06bac2fe66b8738a2"
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
  default = "10.1.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "10.1.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  default = "10.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "activeport4" {
  default = "10.1.3.10"
}

variable "activeport4mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  default = "10.1.0.11"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  default = "10.1.1.11"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  default = "10.1.2.11"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  default = "10.1.3.11"
}

variable "passiveport4mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "10.1.0.1"
}

variable "activeport4gateway" {
  default = "10.1.3.1"
}

variable "passiveport1gateway" {
  default = "10.1.0.1"
}

variable "passiveport4gateway" {
  default = "10.1.3.1"
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
