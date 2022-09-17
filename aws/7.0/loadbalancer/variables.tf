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
  default = "payg"
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


// AMIs for FGTVM-7.0.6
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      x86 = {
        payg = "ami-00040a7e64ab19b3c"
        byol = "ami-01ab3f1c9441d0230"
      }
    },
    us-east-2 = {
      x86 = {
        payg = "ami-06f90bef92f5781dd"
        byol = "ami-03ac7867b9b24155e"
      }
    },
    us-west-1 = {
      x86 = {
        payg = "ami-0a7c6fd7a08c34ff2"
        byol = "ami-017dabe3564541818"
      }
    },
    us-west-2 = {
      x86 = {
        payg = "ami-09d7507450f129830"
        byol = "ami-08f96593178a52815"
      }
    },
    af-south-1 = {
      x86 = {
        payg = "ami-09091a24e5f0847c1"
        byol = "ami-01f2abf5332c22595"
      }
    },
    ap-east-1 = {
      x86 = {
        payg = "ami-0aac3d5a0da31c8c1"
        byol = "ami-069f42643e247ab5e"
      }
    },
    ap-southeast-3 = {
      x86 = {
        payg = "ami-04e8cc4c2bafe2ce6"
        byol = "ami-04e1c4e0a2478bef5"
      }
    },
    ap-south-1 = {
      x86 = {
        payg = "ami-0720a5ae0eab893de"
        byol = "ami-0cedbe11f952e3730"
      }
    },
    ap-northeast-3 = {
      x86 = {
        payg = "ami-0b00a471cc11cb235"
        byol = "ami-00fb2193cf77a9624"
      }
    },
    ap-northeast-2 = {
      x86 = {
        payg = "ami-0ff6e2467caefa067"
        byol = "ami-056e6dab529115902"
      }
    },
    ap-southeast-1 = {
      x86 = {
        payg = "ami-0b6a9aba0b1435767"
        byol = "ami-05d61df5606c092a3"
      }
    },
    ap-southeast-2 = {
      x86 = {
        payg = "ami-0de4a1038ffd9e51f"
        byol = "ami-020439046209f597c"
      }
    },
    ap-northeast-1 = {
      x86 = {
        payg = "ami-0233db802916e30d8"
        byol = "ami-01261ba15b70e22a5"
      }
    },
    ca-central-1 = {
      x86 = {
        payg = "ami-0d0fb1f5bc13c503e"
        byol = "ami-0ae8f0255167291b1"
      }
    },
    eu-central-1 = {
      x86 = {
        payg = "ami-0059b59c57f4d99fd"
        byol = "ami-08c6b22faceee5fc5"
      }
    },
    eu-west-1 = {
      x86 = {
        payg = "ami-04f0075b48848bafa"
        byol = "ami-0d3b69f596ab69c43"
      }
    },
    eu-west-2 = {
      x86 = {
        payg = "ami-076d85525cac9a6ce"
        byol = "ami-05187c24773e71115"
      }
    },
    eu-south-1 = {
      x86 = {
        payg = "ami-0cd29727921e4bc89"
        byol = "ami-04a143c70346eaf2d"
      }
    },
    eu-west-3 = {
      x86 = {
        payg = "ami-0ec58cf49e581cadf"
        byol = "ami-042fa61cb7b5dd2a4"
      }
    },
    eu-north-1 = {
      x86 = {
        payg = "ami-009d28dcabac9b3f5"
        byol = "ami-08739b3f1e0f157b3"
      }
    },
    me-south-1 = {
      x86 = {
        payg = "ami-01646f8cc1ad20133"
        byol = "ami-065e3237f21a8d0f1"
      }
    },
    sa-east-1 = {
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

