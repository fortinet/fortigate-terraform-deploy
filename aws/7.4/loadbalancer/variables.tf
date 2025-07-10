//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}

variable "az" {
  default = "eu-west-1a"
}

// IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>" //Put in the IAM Role name created
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
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "token"
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

// AMIs for FGTVM-7.4.8
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-095e2eecb46c55ac4"
        byol = "ami-0784a2ccadf39fc61"
      },
      x86 = {
        payg = "ami-098e97a910bb6eaeb"
        byol = "ami-0923e9b937688b139"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-03add1940d83b3785"
        byol = "ami-00ae67945593ee5f6"
      },
      x86 = {
        payg = "ami-04976c57e4a3ed3c5"
        byol = "ami-05ae611f07c237ed5"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0f0937d6afe92ad87"
        byol = "ami-015fcc34a5bc77203"
      },
      x86 = {
        payg = "ami-0814b99dfb6a6adeb"
        byol = "ami-0d3740df0035919ac"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0b3e94a7e0769f57f"
        byol = "ami-0117edb18e04c48be"
      },
      x86 = {
        payg = "ami-0408be461811f86a6"
        byol = "ami-0d0e2926dfec0f08e"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-093883b6d15ad1585"
        byol = "ami-015fc28dc2345dc23"
      },
      x86 = {
        payg = "ami-067337eb278deaf08"
        byol = "ami-0c6c7e738ff7cfd28"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-045ac1382667b90b0"
        byol = "ami-0b1ec160ec52916bc"
      },
      x86 = {
        payg = "ami-00f5a32244850d47f"
        byol = "ami-036b8c87adeb61515"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-082a9c0cce2395420"
        byol = "ami-0bcabf0b2d4166c0b"
      },
      x86 = {
        payg = "ami-026370c449a0294b3"
        byol = "ami-064be2a1fa65643d0"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-09e9ead768ce5e71e"
        byol = "ami-0630a9009f8df888e"
      },
      x86 = {
        payg = "ami-0ac5431be0f20f6d2"
        byol = "ami-0c20fe334e191c30e"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-0e7496b95e439be91"
        byol = "ami-033971168ba769a1f"
      },
      x86 = {
        payg = "ami-0e312eeceb36843a3"
        byol = "ami-02362feb1b46dec65"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0c9da3a6e0dd88ec0"
        byol = "ami-0e492f154abeb1648"
      },
      x86 = {
        payg = "ami-0650841004b4e33a2"
        byol = "ami-0554fc7c507a6ed1b"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-02ab0e2d1def58cc7"
        byol = "ami-0fe5dbe5a6cf983c5"
      },
      x86 = {
        payg = "ami-0d42cf4896cd32d40"
        byol = "ami-0197f41bcb758812c"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0105546305075f37a"
        byol = "ami-07378175c93817199"
      },
      x86 = {
        payg = "ami-0944d57578f74470a"
        byol = "ami-087b2eaeea280a72d"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0e113ed1c966873c3"
        byol = "ami-00043510fab2a0da3"
      },
      x86 = {
        payg = "ami-0e568bf464feb55c1"
        byol = "ami-01e6d2182fe3a144a"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-00d2c9f108d6eb3e0"
        byol = "ami-0eee8884afac7d8b2"
      },
      x86 = {
        payg = "ami-09eb608bebfa678d1"
        byol = "ami-0070448690bbd8fca"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-082e5ae6f5e7f64ea"
        byol = "ami-082e5ae6f5e7f64ea"
      },
      x86 = {
        payg = "ami-0ecf0ae850414adae"
        byol = "ami-06d6547fc9378763b"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0fe3ec3894a402d99"
        byol = "ami-0dcbf03afd622e7ad"
      },
      x86 = {
        payg = "ami-0dcbf03afd622e7ad"
        byol = "ami-0924b345681953214"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0625d20e426d00c81"
        byol = "ami-03e5b42faffe63285"
      },
      x86 = {
        payg = "ami-031e1aec85f063a00"
        byol = "ami-0717e2aeb1bde3515"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0a8083cefe369fd91"
        byol = "ami-098b1d7b70c66b8ec"
      },
      x86 = {
        payg = "ami-091e102bb519c2983"
        byol = "ami-0cebcd86553102f21"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0552eb8b4da2c8a3c"
        byol = "ami-09335d07b448c5969"
      },
      x86 = {
        payg = "ami-06155244be7f7ea03"
        byol = "ami-07dbe0f8d94f6bb10"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-008fa6110fa04ffbf"
        byol = "ami-0867d7d6d027c612c"
      },
      x86 = {
        payg = "ami-014ed71655d95d06d"
        byol = "ami-044c1b05808077c4d"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-032a6601b5cb4b6ef"
        byol = "ami-0530b9becdf81dd9d"
      },
      x86 = {
        payg = "ami-0543347d37b0a2a8c"
        byol = "ami-0060659f4d03dd705"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-00db7ef63c12062e6"
        byol = "ami-059712066c61d8c18"
      },
      x86 = {
        payg = "ami-075845ae2a2c0dc5e"
        byol = "ami-0b91841d64b14f2f3"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0ffc8a219fdeed36c"
        byol = "ami-05384ab4fed8983cd"
      },
      x86 = {
        payg = "ami-0e648386a7737027a"
        byol = "ami-089010848aa96d33d"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-0b7420fba393f039e"
        byol = "ami-0d8f1e5ed529ae00a"
      },
      x86 = {
        payg = "ami-0ad8d8f4e2331341f"
        byol = "ami-00360d24857d65646"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0eaebc1d3fbb8b609"
        byol = "ami-0bb7209d6f5639798"
      },
      x86 = {
        payg = "ami-0a07c3db7b286cb0d"
        byol = "ami-0f2123a7f310e61b1"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0eaebc1d3fbb8b609"
        byol = "ami-0bb7209d6f5639798"
      },
      x86 = {
        payg = "ami-0a07c3db7b286cb0d"
        byol = "ami-0f2123a7f310e61b1"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0b3415cb7cb0646ec"
        byol = "ami-0447a9ef6e441760a"
      },
      x86 = {
        payg = "ami-00685a830f52c6a11"
        byol = "ami-00135bc71d066e4e9"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-079b386922ac84b04"
        byol = "ami-06d873373ee2ee993"
      },
      x86 = {
        payg = "ami-087c42cbd5c990dc8"
        byol = "ami-04a52dcc54e48c46a"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0642da2e37d7209a7"
        byol = "ami-0a9aa83a0f7a5c1be"
      },
      x86 = {
        payg = "ami-00ee763c119c4635f"
        byol = "ami-0e3acfe60c4182a19"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-00662d12208a35754"
        byol = "ami-0fdd1d41c65a04129"
      },
      x86 = {
        payg = "ami-0425b8e0775da3a9f"
        byol = "ami-009547c21c2c66fd3"
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

