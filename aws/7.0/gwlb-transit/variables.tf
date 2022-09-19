//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "ap-southeast-2"
}

// Availability zones for the region
variable "az1" {
  default = "ap-southeast-2a"
}

variable "az2" {
  default = "ap-southeast-2b"
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

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
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

// AMIs for FGTVM-7.0.6
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-04940b9c1595be47b"
        byol = "ami-07a598024e95447d3"
      },
      x86 = {
        payg = "ami-00040a7e64ab19b3c"
        byol = "ami-01ab3f1c9441d0230"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0df3b11f968463f43"
        byol = "ami-000fac62387b58104"
      },
      x86 = {
        payg = "ami-06f90bef92f5781dd"
        byol = "ami-03ac7867b9b24155e"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-031e48669445951d9"
        byol = "ami-076e12277b9448943"
      },
      x86 = {
        payg = "ami-0a7c6fd7a08c34ff2"
        byol = "ami-017dabe3564541818"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0b7516875b48a2837"
        byol = "ami-053ad2d3ac9093f20"
      },
      x86 = {
        payg = "ami-09d7507450f129830"
        byol = "ami-08f96593178a52815"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-09f13a4d6a892da06"
        byol = "ami-0ced35d53652e803b"
      },
      x86 = {
        payg = "ami-09091a24e5f0847c1"
        byol = "ami-01f2abf5332c22595"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-01d6ae20953f4f69d"
        byol = "ami-08eb4cf42ee26607f"
      },
      x86 = {
        payg = "ami-0aac3d5a0da31c8c1"
        byol = "ami-069f42643e247ab5e"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = ""
        byol = "ami-085cf6237bfe9a724"
      },
      x86 = {
        payg = "ami-04e8cc4c2bafe2ce6"
        byol = "ami-04e1c4e0a2478bef5"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-00b08a0f101bc5e00"
        byol = "ami-0d0da3e14f203b3b5"
      },
      x86 = {
        payg = "ami-0720a5ae0eab893de"
        byol = "ami-0cedbe11f952e3730"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-09c8dc51cca6c9888"
        byol = "ami-0c7bae30c91594cb9"
      },
      x86 = {
        payg = "ami-0b00a471cc11cb235"
        byol = "ami-00fb2193cf77a9624"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0b381f4ecd79d0f3c"
        byol = "ami-0a5d4d63989a71e41"
      },
      x86 = {
        payg = "ami-0ff6e2467caefa067"
        byol = "ami-056e6dab529115902"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-06b7368ac010368af"
        byol = "ami-0b5597f63e4f20e8f"
      },
      x86 = {
        payg = "ami-0b6a9aba0b1435767"
        byol = "ami-05d61df5606c092a3"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-099238a7fe7185b2a"
        byol = "ami-054c47ce5ac62500a"
      },
      x86 = {
        payg = "ami-0de4a1038ffd9e51f"
        byol = "ami-020439046209f597c"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-023743e2635db7dec"
        byol = "ami-038cbb2a3af953a43"
      },
      x86 = {
        payg = "ami-0233db802916e30d8"
        byol = "ami-01261ba15b70e22a5"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0bb121894d5cbdbc6"
        byol = "ami-0c6eca088cb951345"
      },
      x86 = {
        payg = "ami-0d0fb1f5bc13c503e"
        byol = "ami-0ae8f0255167291b1"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0b7fe0c5c9328e4b9"
        byol = "ami-047ba7a2503bf5ded"
      },
      x86 = {
        payg = "ami-0059b59c57f4d99fd"
        byol = "ami-08c6b22faceee5fc5"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-06e94ee901379985d"
        byol = "ami-048d0a8f296a2487f"
      },
      x86 = {
        payg = "ami-04f0075b48848bafa"
        byol = "ami-0d3b69f596ab69c43"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-036a2f5b666aeb481"
        byol = "ami-0d9a7f197480b9b61"
      },
      x86 = {
        payg = "ami-076d85525cac9a6ce"
        byol = "ami-05187c24773e71115"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-05187c24773e71115"
        byol = "ami-06bf8c6a40b96b5b4"
      },
      x86 = {
        payg = "ami-0cd29727921e4bc89"
        byol = "ami-04a143c70346eaf2d"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0a628ddc05062c16f"
        byol = "ami-002f8ce416689ded0"
      },
      x86 = {
        payg = "ami-0ec58cf49e581cadf"
        byol = "ami-042fa61cb7b5dd2a4"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-06717835baabb7c0d"
        byol = "ami-0511a796704127a02"
      },
      x86 = {
        payg = "ami-009d28dcabac9b3f5"
        byol = "ami-08739b3f1e0f157b3"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-070c8004b83774f8c"
        byol = "ami-0a1c1cd7ba88235c5"
      },
      x86 = {
        payg = "ami-01646f8cc1ad20133"
        byol = "ami-065e3237f21a8d0f1"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-09df2cac65971201e"
        byol = "ami-0a49c7be9333e6b3e"
      },
      x86 = {
        payg = "ami-076a100180b0af179"
        byol = "ami-0c4515994c1c840aa"
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
