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
// Refer to https://docs.fortinet.com/vm/aws/fortigate/6.2/aws-cookbook/6.2.0/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "<AWS IAM ROLE>"
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

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// instance architect
// Either arm or x86
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}


// AMIs for FGTVM-7.0.8
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-064b61be06dfa968c"
        byol = "ami-0d565c2dc1d75ce24"
      },
      x86 = {
        payg = "ami-045d06abc6a1dc852"
        byol = "ami-092d494eda1c6421a"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0c278f6a5d8880994"
        byol = "ami-0bdab92d5db349fa9"
      },
      x86 = {
        payg = "ami-0baa06882e1670f3a"
        byol = "ami-056cb282a3b81d7f1"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-019927bb408b0d361"
        byol = "ami-0492dc9f3d02e0b1e"
      },
      x86 = {
        payg = "ami-0b3cea31ea830ff71"
        byol = "ami-01f3e117d4ed045d9"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0ab4deefa527e0bb9"
        byol = "ami-06e3144ca84aa1ba4"
      },
      x86 = {
        payg = "ami-06f05369bd73d0d62"
        byol = "ami-00253467f5d0cb92f"
      }
    },
    af-south-1 = {
     x86 = {
        payg = "ami-005d6b122f9b60c54"
        byol = "ami-00b3aa6def9a61bca"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0a5d06587c74bda60"
        byol = "ami-0ef66eb34949d73a8"
      },
      x86 = {
        payg = "ami-0bc596fc80a641e00"
        byol = "ami-0ade618f9bfbdb04c"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0f51cc8b8f807d4bc"
        byol = "ami-099ec13c5f7f44db0"
      },
      x86 = {
        payg = "ami-0d8e987da2e0d02a9"
        byol = "ami-0cb64c9a16ae0d7f3"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-09a59875091172d31"
        byol = "ami-05d44e6c403771d12"
      },
      x86 = {
        payg = "ami-0dbeb7e9ed1bf5fd3"
        byol = "ami-0a30c0df4fbedbd23"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-08e5481f4833c4682"
        byol = "ami-0dd51e35931012cfc"
      },
      x86 = {
        payg = "ami-0e52dcb79c3d92d25"
        byol = "ami-08f12c6c4f353b851"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0913ad2eb787b7753"
        byol = "ami-0dd593c687f639db3"
      },
      x86 = {
        payg = "ami-0d05571316f6306f8"
        byol = "ami-0d19041ed5d53a715"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-050861359d8ac12e5"
        byol = "ami-0e5c1ec12528bef24"
      },
      x86 = {
        payg = "ami-06de2076cae307149"
        byol = "ami-0da226c51339f6d54"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-05f6a9e4b716d43a2"
        byol = "ami-07402d6194477742f"
      },
      x86 = {
        payg = "ami-09819e070d96b5307"
        byol = "ami-059213c362f438493"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0700f9ff0a70b4a7a"
        byol = "ami-0ad3ffcd35d0377a4"
      },
      x86 = {
        payg = "ami-0aa168c273077baf4"
        byol = "ami-029fce59c81259dfa"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0df88422011325c2e"
        byol = "ami-005d1a3df21b21855"
      },
      x86 = {
        payg = "ami-08ce85b7233e03c15"
        byol = "ami-05edaf773d420267e"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-068c5d55604b35d57"
        byol = "ami-0efc3e589ca87554c"
      },
      x86 = {
        payg = "ami-0d14a2684477b6620"
        byol = "ami-01dadf3110a14df64"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0c6fe39e3e931df40"
        byol = "ami-06aab92a8c8cbfb0b"
      },
      x86 = {
        payg = "ami-0a23ac4784dba36c5"
        byol = "ami-01ad9c6e6f350482a"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-02e171033f87c8831"
        byol = "ami-01f55fa4c018b6e46"
      },
      x86 = {
        payg = "ami-0f53550190ec4c1a5"
        byol = "ami-0b4985473c27cb44a"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-090a537446258cf4f"
        byol = "ami-0304ec78450261075"
      },
      x86 = {
        payg = "ami-031498828e2c5062a"
        byol = "ami-025c221b88222f628"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0c36edb2f682b4a7e"
        byol = "ami-064631ef9b4ffbd72"
      },
      x86 = {
        payg = "ami-0799940cf93c35500"
        byol = "ami-0401f308ac23a8f0a"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0a893d122767d4d7d"
        byol = "ami-027908e16768a69bc"
      },
      x86 = {
        payg = "ami-0572cd230b972b085"
        byol = "ami-0599acc83035f083e"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-02b4d57e6b572ad57"
        byol = "ami-0aac62198ef4908e2"
      },
      x86 = {
        payg = "ami-06ab0908d419b72db"
        byol = "ami-0373c31b2c6d56f84"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0a5fbe1f11c48748a"
        byol = "ami-019782f66bbf1f4bf"
      },
      x86 = {
        payg = "ami-074edbb87a3294334"
        byol = "ami-0cb45217f7ab64873"
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

variable "activeport1float" {
  default = "10.1.0.12"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "10.1.1.10"
}

variable "activeport2float" {
  default = "10.1.1.12"
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

