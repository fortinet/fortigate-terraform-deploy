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
// Either x86 or arm
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

// AMIs for FGTVM-7.4.5
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        byol = "ami-0536dcf364e36bcec"
      },
      x86 = {
        byol = "ami-0559c7c6724e01262"
      }
    },
    us-east-2 = {
      arm = {
        byol = "ami-07f62055ce215bd18"
      },
      x86 = {
        byol = "ami-00c145440037c6b21"
      }
    },
    us-west-1 = {
      arm = {
        byol = "ami-0914088208bb570f8"
      },
      x86 = {
        byol = "ami-079b0e3ef6221d249"
      }
    },
    us-west-2 = {
      arm = {
        byol = "ami-03814fe20a6ed576c"
      },
      x86 = {
        byol = "ami-0520b03fa1e96dff1"
      }
    },
    af-south-1 = {
      arm = {
        byol = "ami-032c2010e34e4332e"
      },
      x86 = {
        byol = "ami-0c051ce7b4e85bf40"
      }
    },
    ap-east-1 = {
      arm = {
        byol = "ami-0072f94af7f4f93ba"
      },
      x86 = {
        byol = "ami-02515e344c7778ac8"
      }
    },
    ap-south-2 = {
      arm = {
        byol = "ami-0f383183e285c1703"
      },
      x86 = {
        byol = "ami-02e3be07e7f3a6586"
      }
    },
    ap-southeast-3 = {
      arm = {
        byol = "ami-0c2dc177212730e72"
      },
      x86 = {
        byol = "ami-0194818d444bd85da"
      }
    },
    ap-south-5 = {
      arm = {
        byol = "ami-02bbb23dc6dd14827"
      },
      x86 = {
        byol = "ami-0f4ce61ce69217181"
      }
    },
    ap-south-4 = {
      arm = {
        byol = "ami-069697f2046e3cb15"
      },
      x86 = {
        byol = "ami-0ebe9030bd9161983"
      }
    },
    ap-south-1 = {
      arm = {
        byol = "ami-04e8c6e484057e98e"
      },
      x86 = {
        byol = "ami-0dd625af5ab6d2a72"
      }
    },
    ap-northeast-3 = {
      arm = {
        byol = "ami-06f67b123a1a40d55"
      },
      x86 = {
        byol = "ami-0ab795fe1a23537a5"
      }
    },
    ap-northeast-2 = {
      arm = {
        byol = "ami-045ea8be6c243cd0a"
      },
      x86 = {
        byol = "ami-020938ef8e49a210f"
      }
    },
    ap-southeast-1 = {
      arm = {
        byol = "ami-0ff1ce4e8883d2fb3"
      },
      x86 = {
        byol = "ami-03b1d9d7296ea7993"
      }
    },
    ap-southeast-2 = {
      arm = {
        byol = "ami-07738cb70dd8a16a5"
      },
      x86 = {
        byol = "ami-0ea065af22125b218"
      }
    },
    ap-northeast-1 = {
      arm = {
        byol = "ami-05965718cd88b817b"
      },
      x86 = {
        byol = "ami-0a3961a3c638b6453"
      }
    },
    ca-central-1 = {
      arm = {
        byol = "ami-0cf3785e4fc1848a6"
      },
      x86 = {
        byol = "ami-00dbecce4966eb181"
      }
    },
    ca-west-1 = {
      arm = {
        byol = "ami-0c0bb0308988a629b"
      },
      x86 = {
        byol = "ami-0922f98afc98731ce"
      }
    },
    eu-central-1 = {
      arm = {
        byol = "ami-044a606d5768ceb31"
      },
      x86 = {
        byol = "ami-07b55992f68203c8b"
      }
    },
    eu-west-1 = {
      arm = {
        byol = "ami-0dff6a991566be05d"
      },
      x86 = {
        byol = "ami-024c701b0e3bd932c"
      }
    },
    eu-west-2 = {
      arm = {
        byol = "ami-096baa712ae4f4caf"
      },
      x86 = {
        byol = "ami-04fa5491255877210"
      }
    },
    eu-south-1 = {
      arm = {
        byol = "ami-0e5c456693598ccb7"
      },
      x86 = {
        byol = "ami-0b3b71437fd59588e"
      }
    },
    eu-west-3 = {
      arm = {
        byol = "ami-01150d87d326a87a0"
      },
      x86 = {
        byol = "ami-0d42d3300c9e29900"
      }
    },
    eu-south-2 = {
      arm = {
        byol = "ami-02e481e1c12dcf590"
      },
      x86 = {
        byol = "ami-02812c07b2b4d8f1a"
      }
    },
    eu-north-1 = {
      arm = {
        byol = "ami-0b021ff363900d406"
      },
      x86 = {
        byol = "ami-03a73bd6c1b282b53"
      }
    },
    eu-central-2 = {
      arm = {
        byol = "ami-00715a1a63df0b7e6"
      },
      x86 = {
        byol = "ami-050567398caab9edf"
      }
    },
    me-south-1 = {
      arm = {
        byol = "ami-0542af7939f51386f"
      },
      x86 = {
        byol = "ami-0f0de50dcd055600e"
      }
    },
    me-central-1 = {
      arm = {
        byol = "ami-09bcd9e94f52219ba"
      },
      x86 = {
        byol = "ami-0fd7e544028b4fdb9"
      }
    },
    il-central-1 = {
      arm = {
        byol = "ami-0234d712fffb1ccfc"
      },
      x86 = {
        byol = "ami-03d61edc6b6ffcbac"
      }
    },
    sa-east-1 = {
      arm = {
        byol = "ami-01d7bf72a830edeb2"
      },
      x86 = {
        byol = "ami-09792ec9ebeabdb35"
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
