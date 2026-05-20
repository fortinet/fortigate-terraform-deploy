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
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "token"
}

// AMIs for FGTVM-7.4.12
variable "fgtami" {
  type = map(any)
  default = {
    f-south-1 = {
      arm = {
        byol = "ami-0b013dd5635053177"
        payg = "ami-0b08c1e780dc786aa"
      },
      x86 = {
        payg = "ami-00cd9944490ab734d"
        byol = "ami-087b7664d6564ad97"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0326540eef0774412"
        byol = "ami-0bf14889369912cc2"
      },
      x86 = {
        byol = "ami-048a9e158ebb08503"
        payg = "ami-06c90eecfa3467b31"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-0583ac8235df26847"
        payg = "ami-0903c0cee82e0c489"
      },
      x86 = {
        payg = "ami-0904ce8d784bf807e"
        byol = "ami-0f62709b35c5f5c4c"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0043acc84846c719d"
        byol = "ami-015ceaab0ac814f0b"
      },
      x86 = {
        payg = "ami-05df24f6b078388f8"
        byol = "ami-0c9584969c4082bc8"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-01c4fe592f6b510ca"
        byol = "ami-036ab926fa77b1c1e"
      },
      x86 = {
        byol = "ami-01289cd0ed54cb1da"
        payg = "ami-066950fd7ce203aae"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-081a8fa4cc565a4ee"
        payg = "ami-0d503644801605830"
      },
      x86 = {
        byol = "ami-05556c74cfc0b871f"
        payg = "ami-074ee3200828a8b45"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0a26600e8953ac215"
        byol = "ami-0d5c1d200109fbfa2"
      },
      x86 = {
        byol = "ami-046393a9e4a8dcad0"
        payg = "ami-0f98d61f91df45584"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0257ad5f982dedcbf"
        byol = "ami-052649d19843af36d"
      },
      x86 = {
        payg = "ami-0c898b371417bbef1"
        byol = "ami-0fb12b9ba4bfc940d"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0530a12de3b550d8b"
        payg = "ami-0ca6c7a402ede3547"
      },
      x86 = {
        byol = "ami-0224d16694b60499d"
        payg = "ami-0dfa5971742d4a963"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-09de43b9daa84f528"
        payg = "ami-0fe29e4cb761535fb"
      },
      x86 = {
        payg = "ami-0b898f103cddf498f"
        byol = "ami-0d565319e2c478155"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0c5b913535af79853"
        byol = "ami-0c542d3b4be61d41e"
      },
      x86 = {
        payg = "ami-09fd6884130ebfcde"
        byol = "ami-0adb482fd6f8e65aa"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0409fb623869374b5"
        payg = "ami-0be219f1cf0bba59b"
      },
      x86 = {
        byol = "ami-09fc95a34af853a50"
        payg = "ami-0de3560358e2b8df1"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-01ca3e0bd4051307e"
        payg = "ami-0391a45e384a34c6d"
      },
      x86 = {
        byol = "ami-03483641fc7b7ba8b"
        payg = "ami-060476c37fe3d64d3"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-00ab5eb698f7eb32d"
        payg = "ami-02a02109d5aedbfcd"
      },
      x86 = {
        payg = "ami-0360e4ad29978e81d"
        byol = "ami-0c8649a722d6fb805"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-01e7597bb49956cde"
        payg = "ami-05764a28a3dfbd1d8"
      },
      x86 = {
        byol = "ami-093bf06e7fa055181"
        payg = "ami-08e87fac8b67b19fb"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-022fb9fc641cb517a"
        byol = "ami-04da6b49e81f34c03"
      },
      x86 = {
        payg = "ami-056dcf8d023c252a0"
        byol = "ami-0add2ff898c5284af"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-08ddde79f960f0615"
        payg = "ami-0f49cadb9100c8d29"
      },
      x86 = {
        payg = "ami-01e25ea376122db7d"
        byol = "ami-0afe145c0827d78cb"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0341f1492530eb9d2"
        byol = "ami-04eb5539677c56344"
      },
      x86 = {
        payg = "ami-08238aa9ab432d839"
        byol = "ami-0ae68938e44d78e0c"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-02998bf0ffc187e2b"
        byol = "ami-02ca40dcef381dfb7"
      },
      x86 = {
        payg = "ami-000ab80a31fc1e7e7"
        byol = "ami-019de575646202847"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-04975a13a78a4aba4"
        byol = "ami-0ea13e8addd630087"
      },
      x86 = {
        payg = "ami-084e37e76d5c847c9"
        byol = "ami-0e383e684de171ea7"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0175df483b695add3"
        byol = "ami-0aae2c24ccff268ed"
      },
      x86 = {
        payg = "ami-0077226c5b4c88eb9"
        byol = "ami-07f85a24014935a24"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-0d2fc20953c002bbd"
        payg = "ami-0d8bb1016a2240dfa"
      },
      x86 = {
        payg = "ami-025f7c53993ebcb70"
        byol = "ami-0f28ba37d371786c0"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0d9d4ebe9fc6f3a87"
        payg = "ami-0fcc99ad18832f893"
      },
      x86 = {
        payg = "ami-0402fa015cd85b734"
        byol = "ami-0aaf54c4488d90a16"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-00f912999f464c6de"
        byol = "ami-01a553533917c47cf"
      },
      x86 = {
        payg = "ami-04cdd8e65848ea838"
        byol = "ami-0d85d97baf506255d"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0699bce6a1491000b"
        payg = "ami-073f0c572342e2351"
      },
      x86 = {
        payg = "ami-02545cbe5c2c83d8c"
        byol = "ami-02f5cff505d3f801d"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0109a8e6e7e042db5"
        payg = "ami-0d496fa89e8af57e2"
      },
      x86 = {
        byol = "ami-06dd1c208192f0738"
        payg = "ami-0b79509d55c36cabb"
      }
    },
    mx-central-1 = {
      arm = {
        byol = "ami-059683280f1d5e123"
        payg = "ami-06268f706bd43ff0e"
      },
      x86 = {
        payg = "ami-007458e762d01b064"
        byol = "ami-0cfad70ec1ab07a85"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-00f67e01506a56564"
        payg = "ami-0ea0830bce3140df9"
      },
      x86 = {
        payg = "ami-028eab423b442b5d2"
        byol = "ami-0bb017be9973ca3ff"
      }
    },
    us-east-1 = {
      arm = {
        byol = "ami-0e8dc5f0ac6722755"
        payg = "ami-0fac77cab5d424a92"
      },
      x86 = {
        byol = "ami-08f8b0b29e88aabf3"
        payg = "ami-0c872b757c6f4516b"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-004acb8c82971dee4"
        payg = "ami-0932819c6da109f26"
      },
      x86 = {
        payg = "ami-0829f7580fc164dab"
        byol = "ami-0f8ebe2bfe54cb601"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-04639b519187a86be"
        byol = "ami-0f366233ac9fcee90"
      },
      x86 = {
        payg = "ami-06ce8e3e71f30b607"
        byol = "ami-0b48339bddd0f2c6e"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-027afddd7e95537f5"
        payg = "ami-0c4407a8db2732f8b"
      },
      x86 = {
        payg = "ami-04affdfbca94da240"
        byol = "ami-0ff72e30fd4366cd5"
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
