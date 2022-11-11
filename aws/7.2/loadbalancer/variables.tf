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
  default = "<AWS IAM ROLE NAME>"    //Put in the IAM Role name created
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

// AMIs for FGTVM-7.2.2
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
     x86 = {
        payg = "ami-0cd6ef98ec787702b"
        byol = "ami-0b3319db6548e6ba9"
      }
    },
    us-east-2 = {
     x86 = {
        payg = "ami-0311d5e799e37bc0a"
        byol = "ami-06a058dbebecb20ba"
      }
    },
    us-west-1 = {
     x86 = {
        payg = "ami-0b107a3fa2ea40b90"
        byol = "ami-088f6e6cd7e2d1e80"
      }
    },
    us-west-2 = {
     x86 = {
        payg = "ami-0a70f5380706e13ac"
        byol = "ami-0eaa5af24f037c62f"
      }
    },
    af-south-1 = {
     x86 = {
        payg = "ami-0b435d1cf16aa90e7"
        byol = "ami-01218edaf747f9d1d"
      }
    },
    ap-east-1 = {
     x86 = {
        payg = "ami-06c01d5bc4b43dc06"
        byol = "ami-07364323dc297ad03"
      }
    },
    ap-southeast-3 = {
     x86 = {
        payg = "ami-033647feb863a9186"
        byol = "ami-07eea7e44e4ffccbb"
      }
    },
    ap-south-1 = {
     x86 = {
        payg = "ami-024311ffde39d2c03"
        byol = "ami-0209d99105fdb7698"
      }
    },
    ap-northeast-3 = {
     x86 = {
        payg = "ami-024cf678856ba0c03"
        byol = "ami-069b0c703ea29d83e"
      }
    },
    ap-northeast-2 = {
     x86 = {
        payg = "ami-0b9054cc488c2d27f"
        byol = "ami-0b70c933cd19ea860"
      }
    },
    ap-southeast-1 = {
     x86 = {
        payg = "ami-0e88fb5c5083105d0"
        byol = "ami-0fd47fb54f2930d82"
      }
    },
    ap-southeast-2 = {
     x86 = {
        payg = "ami-0e61c467e7f353497"
        byol = "ami-0eb58e93476e4cc4d"
      }
    },
    ap-northeast-1 = {
     x86 = {
        payg = "ami-08479d0bce02ca48b"
        byol = "ami-08092592378d8d6ec"
      }
    },
    ca-central-1 = {
     x86 = {
        payg = "ami-0036e95e21ec5a86b"
        byol = "ami-056f5286aafab5205"
      }
    },
    eu-central-1 = {
     x86 = {
        payg = "ami-09694024ef925305f"
        byol = "ami-037f93ac7ef8ce5bd"
      }
    },
    eu-west-1 = {
     x86 = {
        payg = "ami-08128bac5135f4515"
        byol = "ami-0b7c2f464c014fcf8"
      }
    },
    eu-west-2 = {
     x86 = {
        payg = "ami-010a33c56a41769be"
        byol = "ami-058b5a72d11f1d273"
      }
    },
    eu-south-1 = {
     x86 = {
        payg = "ami-0f99c3f1f118ec33b"
        byol = "ami-03e98ed7e18e42a0b"
      }
    },
    eu-west-3 = {
     x86 = {
        payg = "ami-054bd339074d2f4f2"
        byol = "ami-02c432f95b9fd7751"
      }
    },
    eu-north-1 = {
     x86 = {
        payg = "ami-092c7f33e96a66602"
        byol = "ami-068d7475d3b1be847"
      }
    },
    me-south-1 = {
     x86 = {
        payg = "ami-0234ecd760256557f"
        byol = "ami-070a27dae920ae9b0"
      }
    },
    sa-east-1 = {
     x86 = {
        payg = "ami-0f812ef9070aba55b"
        byol = "ami-06b457a922e700066"
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

