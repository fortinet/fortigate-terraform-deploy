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

// AMIs for FGTVM-8.0.1
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        payg = "ami-03e8917eedbff9fba"
        byol = "ami-0e89187837b9e9a8d"
      },
      x86 = {
        payg = "ami-036428e7e2b90f75b"
        byol = "ami-0e1600cf6972d3525"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-05af3ff7425dcbb13"
        payg = "ami-0dde38aabac6705dd"
      },
      x86 = {
        payg = "ami-0d6163ba005d27ca6"
        byol = "ami-0f16ee7cd1ad2c2ae"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-0a7a7d498ca4ac488"
        payg = "ami-0e96abe53cbf75fdc"
      },
      x86 = {
        payg = "ami-00b71e41c78bb7153"
        byol = "ami-05179a927864cec72"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-07e5ab2cfc2b6dc1d"
        byol = "ami-0f9a51adda05836e9"
      },
      x86 = {
        payg = "ami-020a0eb341ed153da"
        byol = "ami-078d73c702f5902a6"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-03a3246c27a6186ec"
        payg = "ami-0e5813e30356c8326"
      },
      x86 = {
        byol = "ami-03f3cbbac8554789b"
        payg = "ami-0d499e33bc7cf2522"
      }
    },
    p-northeast-3 = {
      arm = {
        byol = "ami-0630fc3bb3ea2ddf1"
        payg = "ami-06cce365c8a1aab7b"
      },
      x86 = {
        byol = "ami-003b0651f64ab5b83"
        payg = "ami-0022bbf013b21182c"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-090b96b7a02d389ec"
        byol = "ami-0ebbbb412c7f3ffd2"
      },
      x86 = {
        byol = "ami-00ada06b433931198"
        payg = "ami-08396dba472f245e9"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-05493439661fc979d"
        byol = "ami-0798c2b69360d3ca4"
      },
      x86 = {
        payg = "ami-0826c8d23ee8c5fef"
        byol = "ami-0c1fb655529f4e8cb"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-03bd1431aa2c5fb38"
        byol = "ami-0de5fa992ec77a7ff"
      },
      x86 = {
        byol = "ami-0496363ee7fd96119"
        payg = "ami-0e4d15650add63acf"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-051dcef0b96bd61d4"
        byol = "ami-0dedaee02dee12645"
      },
      x86 = {
        payg = "ami-098bed93d6fd70aa6"
        byol = "ami-0f93222ae6f155a5f"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0d862b571bb46ca87"
        payg = "ami-0e15490df2570b3da"
      },
      x86 = {
        byol = "ami-083555343cd37805e"
        payg = "ami-0fe6f3d8802a9522e"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-01392c280a1887ef1"
        byol = "ami-03eee956933380058"
      },
      x86 = {
        payg = "ami-05300d82aa122b581"
        byol = "ami-0c740625ba2f3d517"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0165495c13627613e"
        payg = "ami-091e9c10307bd09b5"
      },
      x86 = {
        payg = "ami-04e6c0f56dbdb6fbc"
        byol = "ami-07916f2c28e0e62f1"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-0996297dff1d5694b"
        payg = "ami-0c05a6451eea5649a"
      },
      x86 = {
        byol = "ami-0a3743778a9dfead0"
        payg = "ami-0eef79ccfed162cad"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0d0134269b87de9a3"
        payg = "ami-0d8d987ef51931643"
      },
      x86 = {
        byol = "ami-0a93c0eb235a5f090"
        payg = "ami-0cb12c5046446a5a1"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0033b46663a33c7e8"
        byol = "ami-0ea2ae8a23c838d59"
      },
      x86 = {
        byol = "ami-0210e681eeb5e4013"
        payg = "ami-0a9b60bafa14a239e"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-03df45afd4840e5f0"
        payg = "ami-0a29ddc8508dd5898"
      },
      x86 = {
        byol = "ami-057ff6e05a5e4c02c"
        payg = "ami-0cc9e22c4e9fb3903"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-03355374290f17764"
        payg = "ami-05b4601c096847348"
      },
      x86 = {
        byol = "ami-00eba787f74ed527e"
        payg = "ami-08fdc296550c002ee"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-035b22fc8144cf565"
        byol = "ami-08a8ace2c8e0d1569"
      },
      x86 = {
        byol = "ami-075cf9e9eeb238caa"
        payg = "ami-0fa584a7695e955c4"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0a773588e99685428"
        payg = "ami-0ca15609ef054ae1b"
      },
      x86 = {
        payg = "ami-09ac6e0ba298457bc"
        byol = "ami-0d44c00c1cdb7e239"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-09c5bf05653984cec"
        byol = "ami-0f4b0525265086e09"
      },
      x86 = {
        byol = "ami-09717bc479fb4e980"
        payg = "ami-0f70173fdcef8898c"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0522ffdbb236ec8f3"
        payg = "ami-0c074e0e4a74d83dc"
      },
      x86 = {
        payg = "ami-06c76e28104a200fb"
        byol = "ami-0a6c96cba65a6ede7"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-08a1a73ff70e63abe"
        byol = "ami-0e40955e651c4f3c9"
      },
      x86 = {
        byol = "ami-0d89c7ca2f26c0cac"
        payg = "ami-0e55255fa1b31a43b"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-04c1bea3f043b9a7b"
        payg = "ami-0b6c9cfcd4db0e06b"
      },
      x86 = {
        byol = "ami-08b2f986c78bafb1a"
        payg = "ami-0d3ad4c24d17b8716"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-016290664c719e3ba"
        byol = "ami-06056d0edf5c11ac3"
      },
      x86 = {
        byol = "ami-0a5fe904767d79f32"
        payg = "ami-09ea264dad8ae6823"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-00f9c7974bbab17f7"
        payg = "ami-04df2e6027639c5c5"
      },
      x86 = {
        payg = "ami-08bca9911289959b8"
        byol = "ami-0edba153086057b63"
      }
    },
    mx-central-1 = {
      arm = {
        payg = "ami-05fbda28005dce269"
        byol = "ami-066675560f15417a2"
      },
      x86 = {
        byol = "ami-03409dfad64c27199"
        payg = "ami-0ad08f55e3c8f1bd7"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0a1a1968274086a1d"
        payg = "ami-0caff32bf13f176a3"
      },
      x86 = {
        payg = "ami-055de38eee4369939"
        byol = "ami-0790c78a6e45a41bf"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-088f43827d63c1a6b"
        payg = "ami-0fecf58d59a359d9a"
      },
      x86 = {
        byol = "ami-017cda21dca915ee7"
        payg = "ami-03ffcb7f54e55a7c5"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0c8a4eccf96121cf2"
        payg = "ami-0fd90719697ab3173"
      },
      x86 = {
        byol = "ami-0c65495a083e345ea"
        payg = "ami-0dd04e7ede0105330"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-079b55038e1d17e88"
        byol = "ami-0a37e491b3502432f"
      },
      x86 = {
        byol = "ami-0943bfe56512b747d"
        payg = "ami-0b2e94d7f7ed4c2d6"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-000aa5584ea59ca99"
        byol = "ami-0dc7361544d6c3062"
      },
      x86 = {
        payg = "ami-0023339ed43e6fc8a"
        byol = "ami-057eec70818313753"
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

//license files for the two fgts
variable "licenses" {
  // Change to your own byol license files
  type    = list(string)
  default = ["license.lic", "license2.lic"]
}

