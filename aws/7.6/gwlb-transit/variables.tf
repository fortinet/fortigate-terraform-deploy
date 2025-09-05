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
