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
  default = "21.1.0.0/16"
}

variable "cs2publiccidraz1" {
  default = "21.1.0.0/24"
}

variable "cs2privatecidraz1" {
  default = "21.1.1.0/24"
}


variable "cs2publiccidraz2" {
  default = "21.1.2.0/24"
}

variable "cs2privatecidraz2" {
  default = "21.1.3.0/24"
}


// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, byol.
variable "license_type" {
  default = "byol"
}

// instance architect
// Either: x86 or arm
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.2.7
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-0e8dea38debd621bb"
      },
      x86 = {
        byol = "ami-03dbed661e7bbd936"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-0ea2c1f0d0b80cc82"
      },
      x86 = {
        byol = "ami-0462df8ccb6740e0e"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-01d919015d38b23ea"
      },
      x86 = {
        byol = "ami-0330074a1434f328a"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-0e536efeb3eda0ce7"
      },
      x86 = {
        byol = "ami-0a35d18dd51cff6b9"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-03c1f323354763b42"
      },
      x86 = {
        byol = "ami-0d668ab86ae796060"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-00dcb542c4671d8bb"
      },
      x86 = {
        byol = "ami-0f57207ec501cf09c"
      }
    },
     ap-south-2 = {
      arm = {
        byol = "ami-0506f46e42717aa72"
      },
      x86 = {
        byol = "ami-007be7714db5ca8dc"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-06f8ba3390a2de422"
      },
      x86 = {
        byol = "ami-02d97a7edd26c5116"
      }
    },
    ap-southeast-4 = {
      arm = {
        byol = "ami-058096d8fb940079a"
      },
      x86 = {
        byol = "ami-048fdfef1519ee868"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-02dfd98c3f5a710d3"
      },
      x86 = {
        byol = "ami-05a27086537497cb2"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-080033ac190010440"
      },
      x86 = {
        byol = "ami-05345444641a73526"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-08b3d3db9e9593ebe"
      },
      x86 = {
        byol = "ami-026cffc7be0c23231"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0120a0893807bb36f"
      },
      x86 = {
        byol = "ami-0bec673d04979bb34"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-04dd344f879f2c0f8"
      },
      x86 = {
        byol = "ami-0d199a0908293ae69"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-0f896a3b763318234"
      },
      x86 = {
        byol = "ami-05d54b2a1a643ddf0"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0ba083ca05c27bad0"
      },
      x86 = {
        byol = "ami-01fc2dd1a71c42ee8"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-05163a5ed2c9b43ba"
      },
      x86 = {
        byol = "ami-080c1612915e1df7b"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-040229c8919b9215c"
      },
      x86 = {
        byol = "ami-0920e7a7ca7fd41e1"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0be90f2b215f53b2f"
      },
      x86 = {
        byol = "ami-0f46e00f8e3932bb4"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-04a42a91407695966"
      },
      x86 = {
        byol = "ami-02a23741a80fe7288"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-074c7fda926b5146d"
      },
      x86 = {
        byol = "ami-0f8f886dad77436d1"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-08d4b54677aa494a8"
      },
      x86 = {
        byol = "ami-0a590892686408551"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-05a2848c541ab06f5"
      },
      x86 = {
        byol = "ami-07e64a7ba1473e369"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0c2781cdfe3802b5a"
      },
      x86 = {
        byol = "ami-093449a2e05a54c0e"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-0d99d555c950ed014"
      },
      x86 = {
        byol = "ami-0af4848e587e337a3"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-092a4b04600b9ad49"
      },
      x86 = {
        byol = "ami-0e694c867b974e282"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-0b04d6458d30b582e"
      },
      x86 = {
        byol = "ami-0b78e3ada10fa3d5a"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0728edc81fd05a29d"
      },
      x86 = {
        byol = "ami-001077342be69f015"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-01a4b0a7ab3f7712b"
      },
      x86 = {
        byol = "ami-0c01c53978c035cb3"
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

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}
