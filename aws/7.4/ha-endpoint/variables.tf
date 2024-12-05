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

// IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE NAME>" //Put in the IAM Role name created
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
  default = "byol"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "token"
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

// AMIs for FGTVM-7.4.5
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0d52ea2f655a0d914"
        byol = "ami-0536dcf364e36bcec"
      },
      x86 = {
        payg = "ami-011e11079bc4fa3f7"
        byol = "ami-0559c7c6724e01262"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0cda84c16ddaa5011"
        byol = "ami-07f62055ce215bd18"
      },
      x86 = {
        payg = "ami-0c034f84acd599957"
        byol = "ami-00c145440037c6b21"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0e4a9700d776b7e70"
        byol = "ami-0914088208bb570f8"
      },
      x86 = {
        payg = "ami-0b6ad9d5c951886f5"
        byol = "ami-079b0e3ef6221d249"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-08dcae8f1e59e9768"
        byol = "ami-03814fe20a6ed576c"
      },
      x86 = {
        payg = "ami-0e19d4008b7da1b94"
        byol = "ami-0520b03fa1e96dff1"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-0da6a6a8aba4c0c01"
        byol = "ami-032c2010e34e4332e"
      },
      x86 = {
        payg = "ami-09de1cc016f6aef42"
        byol = "ami-0c051ce7b4e85bf40"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0b52f45ba0a1cb1cd"
        byol = "ami-0072f94af7f4f93ba"
      },
      x86 = {
        payg = "ami-0e2a86827b279433b"
        byol = "ami-02515e344c7778ac8"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0d6bbba5285ea712b"
        byol = "ami-0f383183e285c1703"
      },
      x86 = {
        payg = "ami-054d4b03826e09e7a"
        byol = "ami-02e3be07e7f3a6586"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0703d4e09b9844898"
        byol = "ami-0c2dc177212730e72"
      },
      x86 = {
        payg = "ami-0f6e7afd8e75de5c6"
        byol = "ami-0194818d444bd85da"
      }
    },
    ap-south-5 = {
      arm = {
        payg = "ami-0157b4d3e4721aa74"
        byol = "ami-02bbb23dc6dd14827"
      },
      x86 = {
        payg = "ami-0a1ac47b89ca7935d"
        byol = "ami-0f4ce61ce69217181"
      }
    },
    ap-south-4 = {
      arm = {
        payg = "ami-0fccf6f4432a34bd3"
        byol = "ami-069697f2046e3cb15"
      },
      x86 = {
        payg = "ami-039b3c91f6ee867e4"
        byol = "ami-0ebe9030bd9161983"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0b0c34e295e784600"
        byol = "ami-04e8c6e484057e98e"
      },
      x86 = {
        payg = "ami-09964d3ff26a2f864"
        byol = "ami-0dd625af5ab6d2a72"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-060bfe92edd082b42"
        byol = "ami-06f67b123a1a40d55"
      },
      x86 = {
        payg = "ami-06f650adb1a026bff"
        byol = "ami-0ab795fe1a23537a5"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0edf4ee462c4759b8"
        byol = "ami-045ea8be6c243cd0a"
      },
      x86 = {
        payg = "ami-0e2528321671dfac6"
        byol = "ami-020938ef8e49a210f"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-095ffc3e1a8636375"
        byol = "ami-0ff1ce4e8883d2fb3"
      },
      x86 = {
        payg = "ami-0bac2177fd1a13211"
        byol = "ami-03b1d9d7296ea7993"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-038415ae226c61cd4"
        byol = "ami-07738cb70dd8a16a5"
      },
      x86 = {
        payg = "ami-07a30405bdb0b8187"
        byol = "ami-0ea065af22125b218"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-00e4ebfba7e6ca412"
        byol = "ami-05965718cd88b817b"
      },
      x86 = {
        payg = "ami-0666ef8d604e5d52f"
        byol = "ami-0a3961a3c638b6453"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-01fdfa119910e0cc0"
        byol = "ami-0cf3785e4fc1848a6"
      },
      x86 = {
        payg = "ami-0199d0fdbe8a52dc8"
        byol = "ami-00dbecce4966eb181"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-07c170baff184ead2"
        byol = "ami-0c0bb0308988a629b"
      },
      x86 = {
        payg = "ami-07b19ffc5ed70465f"
        byol = "ami-0922f98afc98731ce"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0dccd51f5730656a3"
        byol = "ami-044a606d5768ceb31"
      },
      x86 = {
        payg = "ami-0e1a386ed1b410c1d"
        byol = "ami-07b55992f68203c8b"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-03de8bbc057510d67"
        byol = "ami-0dff6a991566be05d"
      },
      x86 = {
        payg = "ami-0ec3bd1110ef33ff4"
        byol = "ami-024c701b0e3bd932c"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-0824d2ead7a090981"
        byol = "ami-096baa712ae4f4caf"
      },
      x86 = {
        payg = "ami-059c61d3acc2be41c"
        byol = "ami-04fa5491255877210"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-02e15a6d37f642c2b"
        byol = "ami-0e5c456693598ccb7"
      },
      x86 = {
        payg = "ami-0caa1df03fd8ef86b"
        byol = "ami-0b3b71437fd59588e"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0d35d01b1d59e3bac"
        byol = "ami-01150d87d326a87a0"
      },
      x86 = {
        payg = "ami-0e843ef19c5674296"
        byol = "ami-0d42d3300c9e29900"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-003457bf9aa5f561c"
        byol = "ami-02e481e1c12dcf590"
      },
      x86 = {
        payg = "ami-087b79a3d71dbf831"
        byol = "ami-02812c07b2b4d8f1a"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-01f8b1a5a0d1de65b"
        byol = "ami-0b021ff363900d406"
      },
      x86 = {
        payg = "ami-060ce3016b9620b62"
        byol = "ami-03a73bd6c1b282b53"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0a7a66960627ce49e"
        byol = "ami-00715a1a63df0b7e6"
      },
      x86 = {
        payg = "ami-0ce0cde62f6f43324"
        byol = "ami-050567398caab9edf"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-065b8a2e3f675aba0"
        byol = "ami-0542af7939f51386f"
      },
      x86 = {
        payg = "ami-07b48c0aaee757cb9"
        byol = "ami-0f0de50dcd055600e"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-07a92b29f356708e4"
        byol = "ami-09bcd9e94f52219ba"
      },
      x86 = {
        payg = "ami-0d04e5cba9c4aefd6"
        byol = "ami-0fd7e544028b4fdb9"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0ba95e41435c4d016"
        byol = "ami-0234d712fffb1ccfc"
      },
      x86 = {
        payg = "ami-05f3d7d1f72e56d53"
        byol = "ami-03d61edc6b6ffcbac"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0cfc09acf3de18c8e"
        byol = "ami-01d7bf72a830edeb2"
      },
      x86 = {
        payg = "ami-0f86f816b2f5b6c70"
        byol = "ami-09792ec9ebeabdb35"
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
