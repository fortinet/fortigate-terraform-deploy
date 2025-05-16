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

// AMIs for FGTVM-7.6.2
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0201dba8c33ccfaad"
        byol = "ami-0d99c9297ffbf97f0"
      },
      x86 = {
        payg = "ami-0c1f6d3eef78627e9"
        byol = "ami-03af9ca89cca2d5f6"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-020d1803d1e1d1d5d"
        byol = "ami-03006139b1480c2f1"
      },
      x86 = {
        payg = "ami-06fc0a905e0ff630d"
        byol = "ami-0d9910a32f1606b1e"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0a0fc2d3eca684877"
        byol = "ami-09cdcb3bce66ada46"
      },
      x86 = {
        payg = "ami-042ccb57becd96967"
        byol = "ami-0a2e4f961d006b2b3"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-09664cf2dae6063b0"
        byol = "ami-0e2245c826472e6de"
      },
      x86 = {
        payg = "ami-0a803e53f18aeb0a6"
        byol = "ami-06bfe2460e0a76848"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-0d5a11fc59b5d784e"
        byol = "ami-03ae1f256197d0248"
      },
      x86 = {
        payg = "ami-066e8a62f657255f8"
        byol = "ami-070847dd30574d429"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0db909653436b0659"
        byol = "ami-00637a0f1fb166580"
      },
      x86 = {
        payg = "ami-006188ad9c71f5e9b"
        byol = "ami-03d884ae71b3d909a"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-05284f5278b23b5ba"
        byol = "ami-08fa73387ae4ec535"
      },
      x86 = {
        payg = "ami-02f23385651621592"
        byol = "ami-0c7334e4c7b1bd594"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0bd916295a2a18318"
        byol = "ami-00f5147e4a024e5cc"
      },
      x86 = {
        payg = "ami-04abc69fc5fedce12"
        byol = "ami-09abed1c2fc390ea7"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-0e3e2d81b976694fc"
        byol = "ami-0a82229077b0994a5"
      },
      x86 = {
        payg = "ami-05e7de9994aeeec12"
        byol = "ami-03a50ae6deb2cb9fb"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0c209e08942b04283"
        byol = "ami-0e822d3634edb3b32"
      },
      x86 = {
        payg = "ami-0ccaf19aa9462ac5a"
        byol = "ami-029ca9971a4e8f0b1"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-02fcef0039eeb4a2a"
        byol = "ami-033f879722379afc4"
      },
      x86 = {
        payg = "ami-005cd41964b26a9f2"
        byol = "ami-0665de0df2f44f866"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0f1a926bcc8057a51"
        byol = "ami-017b0d11053a9ea5a"
      },
      x86 = {
        payg = "ami-0465c7adf0785139a"
        byol = "ami-081d86fcba975636b"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-06a6a1f9f7d2a1273"
        byol = "ami-04646f545f8ee0cab"
      },
      x86 = {
        payg = "ami-0122ce57ba92be171"
        byol = "ami-0d105e77e5a4bd4fe"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0eda1a1da03c6dd83"
        byol = "ami-042b25f7caf8b5402"
      },
      x86 = {
        payg = "ami-0b284ce7915bde69f"
        byol = "ami-015d56060284cf805"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-02106ca23f432b9d3"
        byol = "ami-039e4f8d4a16f9f59"
      },
     x86 = {
        payg = "ami-01b862243ae2d384f"
        byol = "ami-0abd3c18957bb5e6a"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-091ccd98f66fc635d"
        byol = "ami-00952685019854d53"
      },
      x86 = {
        payg = "ami-05d8726aa3af20849"
        byol = "ami-0308e79dfcf664464"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0d6b2fe8f02c9de3d"
        byol = "ami-03857b53c39078583"
      },
      x86 = {
        payg = "ami-0ce5921eb8fd2ae58"
        byol = "ami-0b0ae44faeca8ddd2"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0e67b4bba915a4f3e"
        byol = "ami-061b101692410ba49"
      },
      x86 = {
        payg = "ami-0b6936bbfc41edc43"
        byol = "ami-0c1ad25816d0a240a"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-091734fb878509f48"
        byol = "ami-0b9531cc597081a80"
      },
      x86 = {
        payg = "ami-01c40219b2f64b301"
        byol = "ami-015a928a037aab36f"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-05c97d1c39ff51150"
        byol = "ami-038d063be017a3d28"
      },
      x86 = {
        payg = "ami-0ed5d8ee00115cf56"
        byol = "ami-09c6d3279f6fe10a6"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0f3063918d3f2b4cf"
        byol = "ami-079ede986ea0f616c"
      },
      x86 = {
        payg = "ami-09acf344cc3d2ff34"
        byol = "ami-0606108a38e0f0042"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-08e86b4eea23e04f5"
        byol = "ami-03a836ad4c5afb6ed"
      },
      x86 = {
        payg = "ami-02f41659096353606"
        byol = "ami-0758e267ed18597f8"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0648964757d86b231"
        byol = "ami-039d01855ff2f374b"
      },
      x86 = {
        payg = "ami-0bb95869b1fd3a9ea"
        byol = "ami-0f2b90e6cc1233278"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-07dc49fff6bad100d"
        byol = "ami-0277b84db44836cb0"
      },
      x86 = {
        payg = "ami-0f77b040699adfe54"
        byol = "ami-0c5ae8b8ef718b56d"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-02c5c249c853917eb"
        byol = "ami-05c5bec326f90a6cb"
      },
      x86 = {
        payg = "ami-019ad0e5e0fc6d1f4"
        byol = "ami-0b67146793310e637"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0fd9c4e7abd40aab0"
        byol = "ami-0dd6068308cdaf5f2"
      },
      x86 = {
        payg = "ami-060230785dc56aaac"
        byol = "ami-097d3610462ac2127"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0e9fcd74b78d66452"
        byol = "ami-0187c913f025dc066"
      },
      x86 = {
        payg = "ami-01f254bbcdbde919b"
        byol = "ami-053250b3bec83dd8d"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0929d2817905c4519"
        byol = "ami-01f990da044c97d10"
      },
      x86 = {
        payg = "ami-09e6ea8a6c55c4520"
        byol = "ami-00877b308cea2c071"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-04b1aed861d0b8b0e"
        byol = "ami-0b52ac19bfc383dd3"
      },
      x86 = {
        payg = "ami-0ec0a78bbd40f925e"
        byol = "ami-0eb9684ee7e22c40c"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0b9b4c5a435ba583b"
        byol = "ami-0c4b28e79cb51bd08"
      },
      x86 = {
        payg = "ami-03633264be8242eda"
        byol = "ami-0e7e2811191a5b69a"
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
