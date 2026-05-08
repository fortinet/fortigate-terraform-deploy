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

// IAM role that has proper permission for HA
// Refer to https://docs.fortinet.com/vm/aws/fortigate/6.2/aws-cookbook/6.2.0/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM Role>"
}

// VPC for FortiGate Security VPC
variable "vpccidr" {
  default = "10.0.0.0/24"
}

variable "publiccidraz1" {
  default = "10.0.0.0/28"
}

variable "privatecidraz1" {
  default = "10.0.0.16/28"
}

variable "attachcidraz1" {
  default = "10.0.0.32/28"
}

variable "hasynccidraz1" {
  default = "10.0.0.48/28"
}

variable "publiccidraz2" {
  default = "10.0.0.64/28"
}

variable "privatecidraz2" {
  default = "10.0.0.80/28"
}

variable "attachcidraz2" {
  default = "10.0.0.96/28"
}

variable "hasynccidraz2" {
  default = "10.0.0.112/28"
}

variable "fgtport1ip" {
  default = ["10.0.0.5"]
}

variable "fgtport2ip" {
  default = ["10.0.0.21"]
}

variable "fgtport3ip" {
  default = ["10.0.0.54"]
}

variable "fgt2port1ip" {
  default = ["10.0.0.70"]
}

variable "fgt2port2ip" {
  default = ["10.0.0.86"]
}

variable "fgt2port3ip" {
  default = ["10.0.0.118"]
}

// VPC for Customer VPC
variable "csvpccidr" {
  default = "192.168.50.0/24"
}

variable "csprivatecidraz1" {
  default = "192.168.50.128/25"
}

// VPC for Customer2 VPC
variable "cs2vpccidr" {
  default = "192.168.100.0/24"
}

variable "cs2privatecidraz1" {
  default = "192.168.100.128/25"
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

// AMIs for FGTVM-8.0.0
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        payg = "ami-00d39fc0e1b0a6c1b"
        byol = "ami-09cf4e3f7d306b968"
      },
      x86 = {
        payg = "ami-04937a3f55063af68"
        byol = "ami-0c0b2ead5447a7b4b"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0108c953c86b3efb3"
        payg = "ami-0b05b492add1d930a"
      },
      x86 = {
        byol = "ami-038f671ae98b4e246"
        payg = "ami-083be0c2b44b2bbd6"
      }
    },
    ap-east-2 = {
      arm = {
        payg = "ami-0a068c31bfd0535fd"
        byol = "ami-0edccb6b9d376f025"
      },
      x86 = {
        payg = "ami-017d467793dbdde0b"
        byol = "ami-08e309920ce5f7625"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-02076e44eddc5c5ef"
        byol = "ami-05666bd43bf2cbb76"
      },
      x86 = {
        byol = "ami-00ba3d8614680fea2"
        payg = "ami-0304e97e39209afe0"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-070fcb06f61cea107"
        payg = "ami-0b3ef36e42b95516b"
      },
      x86 = {
        byol = "ami-0957d856da4c64d36"
        payg = "ami-0ec404fc615e1a355"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-0389d3f29df9cb37c"
        payg = "ami-0f7d10be649516e4c"
      },
      x86 = {
        byol = "ami-0125a991c6acabf06"
        payg = "ami-03fce45cc57c475de"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-00324385ba8ac1ace"
        byol = "ami-0172d9d7b26ee63f3"
      },
      x86 = {
        byol = "ami-006ab74b927622db0"
        payg = "ami-03d55c2814b297568"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0103e715ce59ab1f1"
        byol = "ami-07d3979c290673a63"
      },
      x86 = {
        byol = "ami-039fc974d0473a79a"
        payg = "ami-0f46d5894fb8a3a8a"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-03c48deabf19f3369"
        byol = "ami-07c155f24c6d5c1c6"
      },
      x86 = {
        payg = "ami-010e641dbc6106631"
        byol = "ami-01b40b8c7ff7b28e3"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-08633dcb97ec6911e"
        payg = "ami-0b0f35a51f11dbdde"
      },
      x86 = {
        payg = "ami-071b7b4a772ca769e"
        byol = "ami-0f4d8d27a9f1a5cc6"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-07d819ac825bb5365"
        payg = "ami-0e5d5667993c6f6b7"
      },
      x86 = {
        byol = "ami-063df0d20a8f762ef"
        payg = "ami-09188ffcd5a771977"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-01868b1ff60aa722c"
        payg = "ami-0e5a2042e201a71b8"
      },
      x86 = {
        byol = "ami-02edbc2f26a4da062"
        payg = "ami-06876ad60e1f46ab8"
      }
    },
    ap-southeast-5 = {
      arm = {
        byol = "ami-0ce07d92e61e46b4a"
        payg = "ami-0dc714cf2210c596f"
      },
      x86 = {
        payg = "ami-0710d30649cc9d3d2"
        byol = "ami-0dd0ab09633c330da"
      }
    },
    ap-southeast-6 = {
      arm = {
        payg = "ami-06ab6778954d6d824"
        byol = "ami-0ab19d385ddc87eac"
      },
      x86 = {
        payg = "ami-060e962430740a651"
        byol = "ami-0d71439c1c6d29c6b"
      }
    },
    ap-southeast-7 = {
      arm = {
        payg = "ami-0a0621c9de700800c"
        byol = "ami-0f6da44a8f0ca3eb5"
      },
      x86 = {
        payg = "ami-0666a38e35b235553"
        byol = "ami-09847f47641789748"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0087b22112fc3caeb"
        byol = "ami-058c6674f12151ab0"
      },
      x86 = {
        byol = "ami-033f84d383cc1a898"
        payg = "ami-0f486226e2165ef21"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-056f7298bba8c899d"
        payg = "ami-0dd772463894152b3"
      },
      x86 = {
        byol = "ami-0422e932b21e779fe"
        payg = "ami-0e52d8da770306638"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-0e9ab3066e6ac81b0"
        payg = "ami-0e972209edb80d7f1"
      },
      x86 = {
        payg = "ami-062ecc1376ae20f64"
        byol = "ami-068b2fdf5e652ec30"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-001e732b9339b8882"
        byol = "ami-08fb919d138ffc419"
      },
      x86 = {
        payg = "ami-0ca8d93367d28d9e4"
        byol = "ami-0ef40f0f7f6b6e0ca"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-03b3acd7e8745bca8"
        payg = "ami-0e6e718f09e3b9744"
      },
      x86 = {
        byol = "ami-08ea88197e81115ef"
        payg = "ami-0a7f7c69f1f6fe2f3"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-069e3b8055c84293e"
        byol = "ami-073cfc95720483669"
      },
      x86 = {
        byol = "ami-075a01ced39c9ee31"
        payg = "ami-0ad9e935ea1b0508e"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-036feed0fb4b01643"
        byol = "ami-0d493b6d61f16acba"
      },
      x86 = {
        byol = "ami-00c0c795fa8ad0440"
        payg = "ami-025271544b0005f98"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-00200dca0d640ce58"
        byol = "ami-06f660eecb5894f0e"
      },
      x86 = {
        byol = "ami-05cdbf9b79dda4edc"
        payg = "ami-081f06f7f3c01c449"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-05a6aadf1f1626f57"
        payg = "ami-0db3c7d47304d41ec"
      },
      x86 = {
        payg = "ami-0a23e13adf96774cf"
        byol = "ami-0f4f8d919abf1ba7b"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-0653be6cde942de6d"
        payg = "ami-0829a5194f94bda1b"
      },
      x86 = {
        payg = "ami-017f87b650c9a1b01"
        byol = "ami-09cdf9cbff0b61d4e"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-061824afe993aa4a6"
        byol = "ami-0d1299c5f58929fc3"
      },
      x86 = {
        byol = "ami-00f4005460262332a"
        payg = "ami-02401703bae604723"
      }
    },
    mx-central-1 = {
      arm = {
        payg = "ami-009636fcf047704b7"
        byol = "ami-0641159bd7377441e"
      },
      x86 = {
        payg = "ami-08d2b5156cf37cf5b"
        byol = "ami-09f2295b26345a2d9"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-06c60ead9f2264f36"
        payg = "ami-0f82678cb1f67e931"
      },
      x86 = {
        payg = "ami-083b51d28f2da41d6"
        byol = "ami-0f9f74436e8e48169"
      }
    },
    us-east-1 = {
      arm = {
        payg = "ami-02368db71a5b84608"
        byol = "ami-0c3e5b64cb65b76ef"
      },
      x86 = {
        byol = "ami-09c4e5189ccaa48ce"
        payg = "ami-0c82fa8082d18e4d6"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-04078fb60af56915f"
        byol = "ami-0780793a05ced8039"
      },
      x86 = {
        payg = "ami-00192ed5d752d8cd0"
        byol = "ami-0cb1506741751e133"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-02a5ccad1435f7a47"
        byol = "ami-07eb7ca135fbd74b4"
      },
      x86 = {
        byol = "ami-051bbca5ba244d613"
        payg = "ami-0d01c931b80d402ad"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-01302542a18a19d36"
        byol = "ami-061b399a5df4d92bf"
      },
      x86 = {
        byol = "ami-03696e7cc03fb6b31"
        payg = "ami-0cd333e433e942779"
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
  default = "8443"
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
