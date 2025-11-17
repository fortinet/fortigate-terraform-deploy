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
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.0.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-on-aws-between-multiple-zones
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
  default = "payg"
}

// instance architect
// x86 for now
variable "arch" {
  default = "x86"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either token or file.
variable "license_format" {
  default = "token"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.0.18
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      arm = {
        payg = "ami-061abf621b695035d"
        byol = "ami-082889160f1a18eef"
      },
      x86 = {
        byol = "ami-01463f17aa7a16344"
        payg = "ami-0b04f0b89195927f2"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-04412b005fc609e93"
        payg = "ami-05a30da184c684291"
      },
      x86 = {
        byol = "ami-033bcda410d0b1786"
        payg = "ami-07668deb8d15e9080"
      }
    },
    ap-east-2 = {
      x86 = {
        payg = "ami-05990dd47ef466a97"
        byol = "ami-0b64a866a15c2590a"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-04f3e713857f4aaa7"
        payg = "ami-0e7cad09956b2938b"
      },
      x86 = {
        payg = "ami-01fa8f667d04b0878"
        byol = "ami-077272b82a2de3013"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-00455b9decf448fa7"
        byol = "ami-021e9c1d7837cb902"
      },
      x86 = {
        byol = "ami-01b961b107e12819d"
        payg = "ami-0ebc4ec02969f410e"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-07f501b868853fc3e"
        payg = "ami-0ba990917d40fa932"
      },
      x86 = {
        byol = "ami-001d8733ea86de6d9"
        payg = "ami-012da8f9c1a66c12d"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-03e95a6154c53be9f"
        payg = "ami-049da5d7eb9592edd"
      },
      x86 = {
        payg = "ami-02105d8d6a8c254c0"
        byol = "ami-07f74301370238aa2"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-0cf0a096186f3b324"
        byol = "ami-0dc3beb8d3b315164"
      },
      x86 = {
        payg = "ami-0da28471719627e5a"
        byol = "ami-0ff950d94a7dcf2d0"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-07ab9ea5198f2ad5a"
        byol = "ami-0c2bbe1f010a1d879"
      },
      x86 = {
        byol = "ami-080893cb53c5e43da"
        payg = "ami-0f1b961980011bcd9"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-07fcf794cc604b915"
        byol = "ami-0cabb6528cf7b829b"
      },
      x86 = {
        payg = "ami-0074658661e5903a2"
        byol = "ami-0c3f618886fcb99ba"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-09f5dd16b86a848a4"
        byol = "ami-09aa64c7906602371"
      },
      x86 = {
        payg = "ami-03f3e7982b61db320"
        byol = "ami-05aad0c4f1ed75e7d"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-0a37ca4485ff0abab"
        byol = "ami-0c88cc78c0c7a2173"
      },
      x86 = {
        byol = "ami-06a8c3151bacf3328"
        payg = "ami-0c570d7c220ffd1d0"
      }
    },
    ap-southeast-5 = {
      arm = {
        payg = "ami-050c02bf90cad7503"
        byol = "ami-06c01692a2f39e90a"
      },
      x86 = {
        byol = "ami-0632b180784922d5f"
        payg = "ami-0f53b37f17bf3bd87"
      }
    },
    ap-southeast-6 = {
      x86 = {
        payg = "ami-021e353a590e4c754"
        byol = "ami-0ac7230c777c755c8"
      }
    },
    ap-southeast-7 = {
      arm = {
        byol = "ami-0320da7078a29d4f7"
        payg = "ami-0dc2225e81e4b2666"
      },
      x86 = {
        payg = "ami-0471b1ac6d0f64ac3"
        byol = "ami-0d514909826e05358"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-099691a472b13fc55"
        payg = "ami-0f206839503ef4f41"
      },
      x86 = {
        payg = "ami-049a5fc36aa2507d3"
        byol = "ami-0a3ff168e7b9a8a4e"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-061def450b27e4507"
        payg = "ami-06f840434ee22b72d"
      },
      x86 = {
        payg = "ami-084be940c412ee427"
        byol = "ami-0ae6e2e6e8c15678d"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0a5aa78de2f48c7bb"
        byol = "ami-0a605d135f1240813"
      },
      x86 = {
        payg = "ami-03e5e3fdf3d92650c"
        byol = "ami-0ea5d25bab1519fad"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0b21b707cb5f6074f"
        byol = "ami-0d204cdbe6c3d4bea"
      },
      x86 = {
        payg = "ami-068e9b0c8554f0889"
        byol = "ami-0aefb622e4d5ec751"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0a434ecb855c0dfda"
        payg = "ami-0d23d2a49b899041d"
      },
      x86 = {
        byol = "ami-04ee24d591a9e692c"
        payg = "ami-0fcbce0cbe96fc500"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-004db0a466e5a3001"
        byol = "ami-0c6337f903f03ab16"
      },
      x86 = {
        byol = "ami-003fb4e62579608b7"
        payg = "ami-01c3986b65bdb56ca"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-05efe4fa7b38f6502"
        payg = "ami-05a31253747e7fb93"
      },
      x86 = {
        payg = "ami-0a0f78904685b3b08"
        byol = "ami-0b57a0a636df37fa6"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-066507b28083b1a70"
        byol = "ami-0afb80e7da9b75ad5"
      },
      x86 = {
        byol = "ami-054ce3c8951b7689d"
        payg = "ami-0fe97a5baded37423"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-05833589af5d42204"
        payg = "ami-06774b9f6d76e5aea"
      },
      x86 = {
        byol = "ami-0a005963803bfe966"
        payg = "ami-0f5732e3d86fedadb"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0b3dcb4682207f224"
        byol = "ami-0cacde56237f9462b"
      },
      x86 = {
        byol = "ami-019461b3280614c71"
        payg = "ami-0597370c6edd90626"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-025cec86b75114870"
        byol = "ami-0fbd19a1a05db8b4c"
      },
      x86 = {
        byol = "ami-071c3037368fc86e0"
        payg = "ami-07beb199499b0acf5"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0670334db9e565d6d"
        byol = "ami-0ab4ffab2ab3cd54f"
      },
      x86 = {
        payg = "ami-037ec6947ae4cfb94"
        byol = "ami-04370a19dcc7e25c5"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-003548333236f3d46"
        payg = "ami-027e92e2ac9e43dd0"
      },
      x86 = {
        byol = "ami-08c96127e45c62c7f"
        payg = "ami-0c0b6e82593c0725f"
      }
    },
    mx-central-1 = {
      arm = {
        payg = "ami-0467f8e506e3b5000"
        byol = "ami-083e2f1f89abaac95"
      },
      x86 = {
        byol = "ami-0409127769ba57418"
        payg = "ami-0c90572ab95b2377a"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-045137256453e411b"
        byol = "ami-0fd2f7c220acb872e"
      },
      x86 = {
        payg = "ami-02b6ebb490ba6a691"
        byol = "ami-0b9ea7dab3560d927"
      }
    },
    us-east-1 = {
      arm = {
        payg = "ami-0d986d80b015af447"
        byol = "ami-0e9efde81ab07c13f"
      },
      x86 = {
        byol = "ami-081bb62ec67a36c3e"
        payg = "ami-0fdb74c6cc1065ae0"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0238ece59ddcfc1fa"
        byol = "ami-0967a4ba3e2d552fd"
      },
      x86 = {
        payg = "ami-07e620b0885d0f748"
        byol = "ami-0c136dd05f3e76930"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-05f17220dae413292"
        payg = "ami-0ac33386d69cde91d"
      },
      x86 = {
        byol = "ami-04c978ea0f9d83250"
        payg = "ami-07fc5ef4d1f9a971c"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-083adcb63629c46ff"
        byol = "ami-0f6db529b1f002975"
      },
      x86 = {
        payg = "ami-0760c822acce22e0a"
        byol = "ami-08ef23f67af13a859"
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


// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the passive fgt
variable "license2" {
  // Change to your own byol license file, license2.lic
  type    = string
  default = "license2.lic"
}

