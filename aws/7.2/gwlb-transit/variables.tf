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

// instance architect
// Either arm or x86
variable "arch" {
  default = "arm"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
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
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "file"
}

// AMIs for FGTVM-7.2.13
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        payg = "ami-03116ec064726d1a1"
        byol = "ami-0667d5af30a3e2caf"
      },
      x86 = {
        byol = "ami-01e3e17764c475ad9"
        payg = "ami-077af956e45c51302"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0283e6c858b8c5fd6"
        byol = "ami-0938bd6b93bb661ac"
      },
      x86 = {
        payg = "ami-0cae419ef50eaf673"
        byol = "ami-0f6ee522d87495f30"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-03575439830b5975f"
        payg = "ami-052f610874e7d6153"
      },
      x86 = {
        byol = "ami-0034d50f8087a2ebf"
        payg = "ami-0dc2a21e8b6966e75"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0d47990fb5ca4ec51"
        byol = "ami-0f696b30d96708ada"
      },
      x86 = {
        payg = "ami-099817a9369dd7493"
        byol = "ami-0b54993d4d7a256ba"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-0154188fb72893506"
        payg = "ami-048b88b977bedca93"
      },
      x86 = {
        payg = "ami-0ae56e940bfe89319"
        byol = "ami-0c3497b36d8502bac"
      }
    },
    p-northeast-3 = {
      arm = {
        byol = "ami-04e5721fd5e055e52"
        payg = "ami-05c9dcc87f3fda0ad"
      },
      x86 = {
        byol = "ami-06296404cb7f4566b"
        payg = "ami-0c5b0de85cc00d5b1"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-0433a77a46dfc05ca"
        payg = "ami-0c99fa6e7bf65d069"
      },
      x86 = {
        payg = "ami-0178dd1a89318a73a"
        byol = "ami-0898e9347732a5186"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0a86fba6112560c98"
        byol = "ami-0f419c84fc96e1260"
      },
      x86 = {
        payg = "ami-0d1320a03debbc5d7"
        byol = "ami-0e3a06256a3610ba9"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-017014d7990347520"
        byol = "ami-020917d35781e0d4e"
      },
      x86 = {
        payg = "ami-01016d5a74cb652c0"
        byol = "ami-085e22b32a8fbb4f3"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-071ec8bac553f4c6b"
        byol = "ami-096762dfda7694615"
      },
      x86 = {
        payg = "ami-00fbed6f5935b57bd"
        byol = "ami-0f7f75d3c17384524"
      }
    },
    p-southeast-3 = {
      arm = {
        byol = "ami-09de3366954c0fc08"
        payg = "ami-0f8c1a54ced3f44e5"
      },
      x86 = {
        byol = "ami-027940bc0ac0721fc"
        payg = "ami-0eb5c709ab73f2323"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0b714059845af1429"
        payg = "ami-0d5f49bd678b4e431"
      },
      x86 = {
        byol = "ami-05977d15cccdec0ad"
        payg = "ami-0839bc28529ca3a4c"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-00e8d80450f77941b"
        payg = "ami-07893f28fd42b5a44"
      },
      x86 = {
        byol = "ami-02e1816e873757c86"
        payg = "ami-03d5fc8acb6bc87f6"
      }
    },
    ap-southeast-6 = {
      x86 = {
        byol = "ami-06cfb78fad261cb32"
        payg = "ami-0fed6ed20fed9482e"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-06e2132bd6b1e65b2"
        payg = "ami-0aab108a61c479b11"
      },
      x86 = {
        byol = "ami-00f3946c09e8540a8"
        payg = "ami-04eeac43df8fd4da2"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0d8b1816e6be9cbda"
        payg = "ami-0e5a719f829f12161"
      },
      x86 = {
        payg = "ami-0daa6ef959f6129ba"
        byol = "ami-0e30266358f189a4b"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-067f71f3b795671b0"
        byol = "ami-084c1c6b2a8e88d09"
      },
      x86 = {
        byol = "ami-0725cbf9a96e46b2c"
        payg = "ami-0a57dfdb620341e9c"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0c90957bc753001db"
        byol = "ami-0d3b5f22c46c90a06"
      },
      x86 = {
        byol = "ami-0642dab2fcf7d22e6"
        payg = "ami-0f464382c8dc49f62"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0d3b068b1e4c39122"
        byol = "ami-0fc8af62172a4beca"
      },
      x86 = {
        payg = "ami-04c270314bc0c3752"
        byol = "ami-0e584f1a5f8996f7f"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0189ef274400926ef"
        payg = "ami-02612058c2699d1e9"
      },
      x86 = {
        payg = "ami-0378ee64ad97190c9"
        byol = "ami-08ae769f6a9528ef5"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-06a0436635b12f14e"
        payg = "ami-08b732a7cf7d3ccf1"
      },
      x86 = {
        payg = "ami-02ef69b98a6dc10dc"
        byol = "ami-069b8bb7843ebc49e"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-002b0ac4eec366c8d"
        payg = "ami-0788dd4626222e72e"
      },
      x86 = {
        byol = "ami-06d20dd3b0ce24119"
        payg = "ami-098f7677772f9b0c9"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-02c5ee923ae1e4482"
        payg = "ami-0968ac1db02281414"
      },
      x86 = {
        payg = "ami-05bdcab02fb391a5e"
        byol = "ami-069384bde5ec704a6"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0872d6369e8d9e609"
        byol = "ami-0bbbad820c426eb4f"
      },
      x86 = {
        payg = "ami-061026a39312f2474"
        byol = "ami-0808e363e9c614b48"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-00fcff40e8d878b93"
        byol = "ami-0c455e700efd14ebf"
      },
      x86 = {
        byol = "ami-013bef1baa790b30e"
        payg = "ami-050034300117911c5"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-061dd762f21de0745"
        byol = "ami-0b42bfa2dafaa36f5"
      },
      x86 = {
        byol = "ami-01652c895b75361f6"
        payg = "ami-094720e1aa5574350"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0217c7fe76de92ecb"
        payg = "ami-04f28da0cf81172cd"
      },
      x86 = {
        payg = "ami-0bbdc5285aee40d11"
        byol = "ami-0cd5c8a0d00061495"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-008c6f2361f3dda02"
        byol = "ami-045a99f6d5e303774"
      },
      x86 = {
        byol = "ami-0170f1b5598f2bf95"
        payg = "ami-0e670080729b8a4af"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-0180c5796ca4921bc"
        payg = "ami-096fc6afb860a9aad"
      },
      x86 = {
        payg = "ami-01456a36d754f26dd"
        byol = "ami-0806f339d49db4482"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-02217885f1a5b42e1"
        payg = "ami-0a806c7b34f80edc9"
      },
      x86 = {
        byol = "ami-07077d5efa1d14d21"
        payg = "ami-0ad015c2e4d689b5f"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-04b5ce46b8215a748"
        payg = "ami-053a423db1c882029"
      },
      x86 = {
        payg = "ami-077d1b03c701db33e"
        byol = "ami-0fd04f92ef6b51255"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-091ce3aeed2bfe590"
        payg = "ami-0b83e969dadb0f4cd"
      },
      x86 = {
        byol = "ami-01463ad53ff39a2bd"
        payg = "ami-0aed3c7e7a35527ab"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-04d3a56b159e15709"
        byol = "ami-0e276d920ee031804"
      },
      x86 = {
        byol = "ami-02684a08d2245bc52"
        payg = "ami-0b62adcef1fb2e7ed"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-00140b6f585d7a71b"
        byol = "ami-0b472eeb4d98a5c07"
      },
      x86 = {
        byol = "ami-048b0f8bdcd786e9d"
        payg = "ami-0a617f3ee6cebbb08"
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

// license file for the fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the fgt 2
variable "license2" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license2.lic"
}
