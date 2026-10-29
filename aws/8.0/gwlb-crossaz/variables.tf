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

variable "publiccidraz2" {
  default = "10.1.2.0/24"
}

variable "privatecidraz2" {
  default = "10.1.3.0/24"
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
  default = "arm"
}

// instance type needs to match the architect
// c5.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c6g.xlarge"
}

// AMIs for FGTVM-8.0.2
variable "fgtami" {
  type = map(any)
  default = {
    f-south-1 = {
      arm = {
        byol = "ami-00f990b22af296ebe"
        payg = "ami-01fe9406ce1a505b2"
      },
      x86 = {
        byol = "ami-026511d4afb45e1f1"
        payg = "ami-0839425a755d177dc"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0544f7951a2f42b00"
        byol = "ami-0b0bcba68b25e61b9"
      },
      x86 = {
        payg = "ami-03291cabb4ee3d36b"
        byol = "ami-07e6dbdbb0b4594a4"
      }
    },
    ap-east-2 = {
      arm = {
        byol = "ami-03c2e31be9992ebe3"
        payg = "ami-06c2bb2984490e788"
      },
      x86 = {
        payg = "ami-00ba6b97330d0a3ef"
        byol = "ami-074d913fbbc64c9aa"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-02eb9963150e22d53"
        byol = "ami-0e13f65b42eec4770"
      },
      x86 = {
        payg = "ami-029acc3f82498ace0"
        byol = "ami-0a1849c2e1c3191fa"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-070826cd3e2ccb214"
        byol = "ami-0c5ed6343bad9dbc6"
      },
      x86 = {
        payg = "ami-0133fc85078c18964"
        byol = "ami-03d8dff62bb1844fd"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-00285ef6b20960602"
        byol = "ami-069c4af6d4d704547"
      },
      x86 = {
        byol = "ami-05eee641e9b1a3c63"
        payg = "ami-0712e5447ecfe45d5"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-040d1231b20b088f7"
        payg = "ami-0e02d5c18751b1a7c"
      },
      x86 = {
        byol = "ami-02c87b78346be4259"
        payg = "ami-0ec36eeca3afa530d"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-027cbcb0c719064ee"
        byol = "ami-09078058904d19785"
      },
      x86 = {
        payg = "ami-0a323f95ed4f8919b"
        byol = "ami-0da44d1f873baeed2"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-069e94f79b89c0f48"
        byol = "ami-0d181de76404049d1"
      },
      x86 = {
        payg = "ami-0c4cf3dce1062efec"
        byol = "ami-0fa7b93ad095d752a"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-071549ce399547ccd"
        byol = "ami-0ae19052b8671f848"
      },
      x86 = {
        byol = "ami-00db7d3a427575538"
        payg = "ami-0e05f929b3a2a64fe"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-05cff00e907e65bc8"
        payg = "ami-0b1f3c7f701a6c878"
      },
      x86 = {
        byol = "ami-01516c7b0be29dd50"
        payg = "ami-07995734faba3f64b"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-0c1078c51625b4592"
        payg = "ami-0d3b85a849937cd8e"
      },
      x86 = {
        byol = "ami-0484fc9fd50c1398f"
        payg = "ami-05a49cdc895e202b0"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-08a4666be0bf3effb"
        byol = "ami-0c1718f5d3a6740ac"
      },
      x86 = {
        byol = "ami-02e5ddab29c5b1819"
        payg = "ami-0367ee9c5077acc8b"
      }
    },
    ap-southeast-6 = {
      arm = {
        byol = "ami-01502db9070d557fb"
        payg = "ami-08f7bd1e2ff26a8d0"
      },
      x86 = {
        payg = "ami-04d765d2abfa9504e"
        byol = "ami-0859c2382bbddaafe"
      }
    },
    ap-southeast-7 = {
      arm = {
        payg = "ami-0152c71948b95417b"
        byol = "ami-01334c34f7039d39b"
      },
      x86 = {
        byol = "ami-073ebbf2db39a32f8"
        payg = "ami-0a81e5ad3ab69dc92"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0a29ac782d51e4654"
        byol = "ami-0b3ca4e71af35c9f8"
      },
      x86 = {
        byol = "ami-0a57b70e9a3f6c16b"
        payg = "ami-0e8dfd3b778421f6a"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-00a52a73d44049165"
        payg = "ami-0c2f504748da65212"
      },
      x86 = {
        byol = "ami-0c94c0482cf0e817b"
        payg = "ami-0ed76a376963772c9"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0613eecc47d0da274"
        payg = "ami-0d42dcbd4ab2f4a32"
      },
      x86 = {
        payg = "ami-0e42eaa0e8d8ffec4"
        byol = "ami-0f87c9d117231cd4b"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-020a42aeabc0d37e4"
        payg = "ami-0d5a64cb21711b0de"
      },
      x86 = {
        byol = "ami-001ccc34b0eb64e23"
        payg = "ami-0c9e063483355f3c1"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0880c0a574f260c0d"
        byol = "ami-0d95f9d166974db91"
      },
      x86 = {
        byol = "ami-05227024e16445ed0"
        payg = "ami-0dddc0d89567cbcdd"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0e8b4f639f9460f53"
        payg = "ami-0f295c0ecd33eae68"
      },
      x86 = {
        byol = "ami-00c9f11a957b62db4"
        payg = "ami-0dd69ff3f32db5ab7"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-0014a35c764ad1d06"
        byol = "ami-07c9c192b4cfd8b67"
      },
      x86 = {
        payg = "ami-06f5c14ec750ce3f9"
        byol = "ami-08e80015168ba430b"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-00d9e40b27bac0fd6"
        payg = "ami-04e8271e33997194b"
      },
      x86 = {
        byol = "ami-09c04df685c68c949"
        payg = "ami-0a387a7ce997d3f26"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-02faf1f3a20ace64c"
        byol = "ami-0d695c5bc1ce8cb37"
      },
      x86 = {
        byol = "ami-062af3cae718cb7db"
        payg = "ami-0925b8b040fb55bb2"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-03740069e06a440c9"
        byol = "ami-08b479b55e6130085"
      },
      x86 = {
        payg = "ami-0bb4efc9c7e76a700"
        byol = "ami-0f4dc030829d6cc64"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-07149dc7b7a5162df"
        byol = "ami-0b9b6ba757c1f2a63"
      },
      x86 = {
        payg = "ami-04a08109ad01eadd5"
        byol = "ami-07ddaaf18100470ac"
      }
    },
    mx-central-1 = {
      arm = {
        payg = "ami-028a95f4db277b9a4"
        byol = "ami-08958166b8ef22f8b"
      },
      x86 = {
        byol = "ami-00dba7978d4de52ca"
        payg = "ami-087732923270a46ca"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-0733734781963105c"
        payg = "ami-0ff8a8dca05f09f34"
      },
      x86 = {
        byol = "ami-09d06a5ee0d51bbb1"
        payg = "ami-0f5c5383d7f9d1480"
      }
    },
    us-east-1 = {
      arm = {
        payg = "ami-03d9267c505ef3000"
        byol = "ami-0552bdab5fcbdbf42"
      },
      x86 = {
        payg = "ami-00e88043287287be2"
        byol = "ami-09ac160f27939b681"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-007ff97eb46fea60b"
        payg = "ami-038498dd4c992f2e4"
      },
      x86 = {
        byol = "ami-05759f9be28c9dc7f"
        payg = "ami-09f64fc41a5920066"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-072f8038d544938e5"
        payg = "ami-07d751f40744ab7a6"
      },
      x86 = {
        byol = "ami-0ebfa396d55901053"
        payg = "ami-0f2639b7983b17bc7"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-06d573f24b2214f19"
        payg = "ami-09e6d8470a9563dd9"
      },
      x86 = {
        byol = "ami-05002b82c861c3c8f"
        payg = "ami-0da5f5004122920f1"
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

//license files for the two fgts
variable "licenses" {
  // Change to your own byol license files
  type    = list(string)
  default = ["license.lic", "license2.lic"]
}
