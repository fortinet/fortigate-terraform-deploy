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

// instance architect
// x86 for now
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c5n.xlarge"
}

// AMIs for FGTVM-7.2.1
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      x86 = {
        payg = "ami-088a648de0cf2a8d0"
        byol = "ami-04a997b43f50bd2e8"
      }
    },
    us-east-2 = {
      x86 = {
        payg = "ami-081522f5e5c6464ac"
        byol = "ami-044408b80d602fd14"
      }
    },
    us-west-1 = {
      x86 = {
        payg = "ami-002828408925ee484"
        byol = "ami-084283cfda81157b5"
      }
    },
    us-west-2 = {
      x86 = {
        payg = "ami-0e9f40ac7253a4689"
        byol = "ami-0f323f6cddf382b3c"
      }
    },
    af-south-1 = {
      x86 = {
        payg = "ami-02a335d85bbacb1ee"
        byol = "ami-0708eb366fe788d48"
      }
    },
    ap-east-1 = {
      x86 = {
        payg = "ami-0dc8de840415f3336"
        byol = "ami-033d430c9c34b9568"
      }
    },
    ap-southeast-3 = {
      x86 = {
        payg = "ami-0a2d1535fdc0f67ad"
        byol = "ami-0dd9467e480184f48"
      }
    },
    ap-south-1 = {
      x86 = {
        payg = "ami-0549369768f687d54"
        byol = "ami-0482181325cfb5fc5"
      }
    },
    ap-northeast-3 = {
      x86 = {
        payg = "ami-00344c85607641e14"
        byol = "ami-0e3a167f16247b5de"
      }
    },
    ap-northeast-2 = {
      x86 = {
        payg = "ami-0bdea1802f93b4ee8"
        byol = "ami-09986d3a2221c3d7f"
      }
    },
    ap-southeast-1 = {
      x86 = {
        payg = "ami-052f4d53266eb4aef"
        byol = "ami-076f7b6b3a597d1b4"
      }
    },
    ap-southeast-2 = {
      x86 = {
        payg = "ami-0345b2e4ad338d622"
        byol = "ami-0b3e0e0a0e65ac32c"
      }
    },
    ap-northeast-1 = {
      x86 = {
        payg = "ami-007f505b0a7bcad76"
        byol = "ami-06bc1ba12b6f3676a"
      }
    },
    ca-central-1 = {
      x86 = {
        payg = "ami-05c0fd18673a4d06b"
        byol = "ami-0adb50cbbca913d5d"
      }
    },
    eu-central-1 = {
      x86 = {
        payg = "ami-004186c2ec8a32998"
        byol = "ami-031da2ed752eb2481"
      }
    },
    eu-west-1 = {
      x86 = {
        payg = "ami-0230d7f3a27a4b312"
        byol = "ami-0b4e1809774cb7b1d"
      }
    },
    eu-west-2 = {
      x86 = {
        payg = "ami-07b71197286f82ce2"
        byol = "ami-0182a6e569579d1a0"
      }
    },
    eu-south-1 = {
      x86 = {
        payg = "ami-03de21f74b767d59f"
        byol = "ami-01a43fc8a276d2343"
      }
    },
    eu-west-3 = {
      x86 = {
        payg = "ami-0fb094f83a92ee77d"
        byol = "ami-0a2a273a1afce11a6"
      }
    },
    eu-north-1 = {
      x86 = {
        payg = "ami-083f055f53e54a627"
        byol = "ami-0f4157d75891a3d2e"
      }
    },
    me-south-1 = {
      x86 = {
        payg = "ami-066d505430ad345a0"
        byol = "ami-017380833397261cf"
      }
    },
    sa-east-1 = {
      x86 = {
        payg = "ami-078010c2bb8331dac"
        byol = "ami-0f5062c1f266f9c30"
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

