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
// Either x86
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
        byol = "ami-04a997b43f50bd2e8"
      }
    },
    us-east-2 = {
      x86 = {
        byol = "ami-044408b80d602fd14"
      }
    },
    us-west-1 = {
      x86 = {
        byol = "ami-084283cfda81157b5"
      }
    },
    us-west-2 = {
      x86 = {
        byol = "ami-0f323f6cddf382b3c"
      }
    },
    af-south-1 = {
      x86 = {
        byol = "ami-0482181325cfb5fc5"
      }
    },
    ap-east-1 = {
      x86 = {
        byol = "ami-033d430c9c34b9568"
      }
    },
    ap-southeast-3 = {
      x86 = {
        byol = "ami-0dd9467e480184f48"
      }
    },
    ap-south-1 = {
      x86 = {
        byol = "ami-0482181325cfb5fc5"
      }
    },
    ap-northeast-3 = {
      x86 = {
        byol = "ami-0e3a167f16247b5de"
      }
    },
    ap-northeast-2 = {
      x86 = {
        byol = "ami-09986d3a2221c3d7f"
      }
    },
    ap-southeast-1 = {
      x86 = {
        byol = "ami-076f7b6b3a597d1b4"
      }
    },
    ap-southeast-2 = {
      x86 = {
        byol = "ami-0b3e0e0a0e65ac32c"
      }
    },
    ap-northeast-1 = {
      x86 = {
        byol = "ami-06bc1ba12b6f3676a"
      }
    },
    ca-central-1 = {
      x86 = {
        byol = "ami-0adb50cbbca913d5d"
      }
    },
    eu-central-1 = {
      x86 = {
        byol = "ami-031da2ed752eb2481"
      }
    },
    eu-west-1 = {
      x86 = {
        byol = "ami-0b4e1809774cb7b1d"
      }
    },
    eu-west-2 = {
      x86 = {
        byol = "ami-0182a6e569579d1a0"
      }
    },
    eu-south-1 = {
      x86 = {
        byol = "ami-01a43fc8a276d2343"
      }
    },
    eu-west-3 = {
      x86 = {
        byol = "ami-0a2a273a1afce11a6"
      }
    },
    eu-north-1 = {
      x86 = {
        byol = "ami-0f4157d75891a3d2e"
      }
    },
    me-south-1 = {
      x86 = {
        byol = "ami-017380833397261cf"
      }
    },
    sa-east-1 = {
      x86 = {
        byol = "ami-0f5062c1f266f9c30"
      }
    }
  }
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "taskcat"
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
