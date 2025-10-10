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


// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "file"
}

// instance architect
// Either arm or x86
variable "arch" {
  default = "x86"
}

// use s3 bucket for bootstrap
// Either true or false
//
variable "bucket" {
  type    = bool
  default = "false"
}

// instance type needs to match the architect
// c5.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5.xlarge"
}

// AMIs for FGTVM-7.4.9
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        payg = "ami-055248b242c21e865"
        byol = "ami-0c8580a13fecccdb4"
      },
      x86 = {
        payg = "ami-0351e08b683166f91"
        byol = "ami-0b67e6860d0d34207"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0274df46f099a14c5"
        byol = "ami-06e3b5d0f99b9b855"
      },
      x86 = {
        byol = "ami-0260af42fd44e4251"
        payg = "ami-089ddf1f51f27b050"
      }
    },
    ap-east-2 = {
      x86 = {
        byol = "ami-086b3a05a82b74f7f"
        payg = "ami-0d5daa69af8bbd664"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0ad61f355589d00c7"
        payg = "ami-0f0553c1a07d7248c"
      },
      x86 = {
        byol = "ami-0ab0ef077df1aa516"
        payg = "ami-0cf751855f764082e"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-029d4695c7379070c"
        payg = "ami-0b7cbc0534e3f0375"
      },
      x86 = {
        byol = "ami-009831aacfc70ea14"
        payg = "ami-0d2deba1ac897588f"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-02da92c4d07ca0c74"
        payg = "ami-0efddb3a83a219258"
      },
      x86 = {
        byol = "ami-098fcf990e2da63ee"
        payg = "ami-0f2bbdd860f3d865c"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-056a42051a036989a"
        payg = "ami-07dda77e21230c7fe"
      },
      x86 = {
        payg = "ami-021c0d410295d9c14"
        byol = "ami-04ec734255a05eaf1"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0c9c02576957e17d0"
        payg = "ami-0eddeeba8bcf5c3c4"
      },
      x86 = {
        byol = "ami-002178864cf7735e3"
        payg = "ami-0b83b8d9ad1e57bee"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-01e11aa479c55a757"
        payg = "ami-097dd448d1c9b48af"
      },
      x86 = {
        payg = "ami-0e99a994642bd1673"
        byol = "ami-0fbde8b130256ee0e"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-0219d3c0b0cb30afc"
        payg = "ami-083ad1548d55069de"
      },
      x86 = {
        payg = "ami-02836dceaee72f5d8"
        byol = "ami-05c3c3afaea686162"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-004e0250218fcd52b"
        payg = "ami-0fa00d789af9a52b9"
      },
      x86 = {
        payg = "ami-02ce626fca3f15290"
        byol = "ami-0b1a113ab75ece700"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-01c312645343a60b9"
        payg = "ami-062b687d641b7cd22"
      },
      x86 = {
        byol = "ami-05387ac148ee54651"
        payg = "ami-0c949f7faefb6e081"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-011799ebae27b65c2"
        byol = "ami-07c59a05fd91581b8"
      },
      x86 = {
        byol = "ami-033b0839507c7cdf7"
        payg = "ami-04800c53b70bb2f49"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0a8b0c15ab06da914"
        payg = "ami-0f1eecde07ce3269e"
      },
      x86 = {
        byol = "ami-0866526d31ba54fb3"
        payg = "ami-0fa96232e73141f6c"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-02c981fee2feef140"
        byol = "ami-0378dd88af181307c"
      },
      x86 = {
        byol = "ami-007b2b2911e81dac3"
        payg = "ami-0f9b3b18c130e11c2"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-07a6ca87be69b10bd"
        byol = "ami-09f607a4eef844475"
      },
      x86 = {
        byol = "ami-003270b02e8f20b66"
        payg = "ami-00e1e1ae46a21fb8c"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-05be8e87879789bb4"
        payg = "ami-09cb7b775a32245f9"
      },
      x86 = {
        byol = "ami-00e14eafd811c0e54"
        payg = "ami-08bb113b5425db6f0"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-01690fec9fafe76e0"
        byol = "ami-09a36bc5f100df01d"
      },
      x86 = {
        payg = "ami-08838ca17d73704f2"
        byol = "ami-0baeec8ccbc2d3429"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-05e5fd3e5dac0caaf"
        payg = "ami-073a94aca31d369fa"
      },
      x86 = {
        payg = "ami-03d7b1a08842f64f7"
        byol = "ami-0fb32798971cf9b56"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-023950e9a4057537b"
        byol = "ami-070fc8ec0f46549dd"
      },
      x86 = {
        byol = "ami-03f349526bfcbd842"
        payg = "ami-07e5cf4de1fe33dbd"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-043d542626e218c07"
        byol = "ami-078f624848cff9df2"
      },
      x86 = {
        byol = "ami-03d49d4a401eb6850"
        payg = "ami-07f1607d0c9b4ec20"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-06ccf941dbe402e0e"
        byol = "ami-0d2a0824adb2a5063"
      },
      x86 = {
        byol = "ami-0830f8b7291362d86"
        payg = "ami-0a8e43df3af83175e"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-04841643d0ee1ac7a"
        byol = "ami-0a6541f758f6a6bbb"
      },
      x86 = {
        payg = "ami-06aac2cf4992d5a6d"
        byol = "ami-072242b9cd52fc16f"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-04cefe3898d79280b"
        payg = "ami-088b31a533de38019"
      },
      x86 = {
        payg = "ami-03d20e5f52e600776"
        byol = "ami-0601a3b3897610172"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-01619afbf31ce9eb6"
        payg = "ami-0345dd28258939f2b"
      },
      x86 = {
        payg = "ami-084595eb03fb6f531"
        byol = "ami-0a53fc4061366f0be"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-00b73a1d28ff9becf"
        byol = "ami-07aa407b41611f52c"
      },
      x86 = {
        byol = "ami-04ff6f4037d640032"
        payg = "ami-08c552bdb734739f7"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-036cfb2cdd7b7f881"
        payg = "ami-086ec52560b962a17"
      },
      x86 = {
        byol = "ami-02f9aca24f42dab3a"
        payg = "ami-032b59c27b0179678"
      }
    },
    mx-central-1 = {
      arm = {
        payg = "ami-045d00da54963e2c3"
        byol = "ami-069264c1fd250ffcd"
      },
      x86 = {
        byol = "ami-00459a468239ab770"
        payg = "ami-07094bcc1a98c5fe4"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-045049f2591339fd2"
        byol = "ami-088e4121c35946728"
      },
      x86 = {
        byol = "ami-002b1a346af0b380b"
        payg = "ami-089b497365221d8fc"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-03e4958557fbc6a8e"
        payg = "ami-0614c9e6dae33f3e6"
      },
      x86 = {
        payg = "ami-09c93e1bac083a824"
        byol = "ami-0d8ab3309f7946a19"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-008b51b7b30fa6373"
        payg = "ami-0612581688e7949b6"
      },
      x86 = {
        payg = "ami-03517e2a3988b5cdb"
        byol = "ami-049f7cdccbc1982fa"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0c17fe23f93099656"
        payg = "ami-0e7f3b57a550a2b34"
      },
      x86 = {
        byol = "ami-0e2502ae241354ddf"
        payg = "ami-0f7c0615b41d1c309"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-052e6aa43065c52bd"
        byol = "ami-08aff92aeae6e8ac4"
      },
      x86 = {
        payg = "ami-087330c5b9010b611"
        byol = "ami-0abc447e75506a62a"
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
