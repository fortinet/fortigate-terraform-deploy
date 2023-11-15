##############################################################################################################
#
# FortiGate Terraform deployment
# Active Passive High Availability MultiAZ with AWS Transit Gateway with VPC standard attachment -
#
##############################################################################################################

# Access and secret keys to your environment
variable "access_key" {}
variable "secret_key" {}

# Uncomment if using AWS SSO:
# variable "token"      {}

# Prefix for all resources created for this deployment in AWS
variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "TGW"
}

variable "tag_name_unique" {
  description = "Provide a unique tag prefix value that will be used in the name tag for each modules resources"
  default     = "terraform"
}

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.txt"
}

// license file for the passive fgt
variable "license2" {
  // Change to your own byol license file, license2.lic
  type    = string
  default = "license2.txt"
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
// c5.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default     = "c5.xlarge"
}

#############################################################################################################
#  AMI

// AMIs for FGTVM-7.4.1
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-05f950ed394d67d16"
        byol = "ami-003c670ea14ca1ddd"
      },
      x86 = {
        payg = "ami-087ea152084f7cd92"
        byol = "ami-099d4a104989ffc30"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-035ac2dd6870b1690"
        byol = "ami-08761a2fa9123398d"
      },
      x86 = {
        payg = "ami-0a472260de13bb2ad"
        byol = "ami-06d82c2a5a0f7ba5c"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0f60d7e6b9fdfe00c"
        byol = "ami-0e73e415493c851fc"
      },
      x86 = {
        payg = "ami-049f645a89680d62d"
        byol = "ami-0bb6c638f427dc4ee"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0e141dcd950f3a2dd"
        byol = "ami-0e36a1fb1ee12a870"
      },
      x86 = {
        payg = "ami-09b6a723e0e0c06ab"
        byol = "ami-0eb3cf4f68aef5893"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-086c062593aa8cc97"
        byol = "ami-0b67d4660743e5671"
      },
      x86 = {
        payg = "ami-01513d8128337a185"
        byol = "ami-0e3f98c56d6e38095"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0a11e114ee0c1671d"
        byol = "ami-05920a92b85d29e89"
      },
      x86 = {
        payg = "ami-04a31e5127d083e4b"
        byol = "ami-024602eacf11a8f32"
      }
    },
    ap-south-2 = {
      arm = {
        payg = "ami-04ebc4238583d9365"
        byol = "ami-0d765ce635b884a97"
      },
      x86 = {
        payg = "ami-003d6c0978ed8c1af"
        byol = "ami-0a8e79fc82a565193"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-06576bc4b9a027823"
        byol = "ami-05250bd663412091e"
      },
      x86 = {
        payg = "ami-06dd7001222b60925"
        byol = "ami-04f569df951f85dd8"
      }
    },
    ap-south-4 = {
      arm = {
        payg = "ami-0786609871b546feb"
        byol = "ami-0d850a046a82aac65"
      },
      x86 = {
        payg = "ami-0075bbdfdfd9d59c2"
        byol = "ami-0de1c161cea9d07aa"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-01cf014db2614f961"
        byol = "ami-023350efda02b00b7"
      },
      x86 = {
        payg = "ami-0cab4f63fadaa6ad3"
        byol = "ami-0f8d9dbbff66aa759"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-09c948d8bccbd3687"
        byol = "ami-0e0e6cede811be00d"
      },
      x86 = {
        payg = "ami-0b31e12c981428707"
        byol = "ami-02dfe655aaa678a8f"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0d86bd05dc5388cea"
        byol = "ami-00964b9388981cc6f"
      },
      x86 = {
        payg = "ami-0d3fb4bb5c9edb8b8"
        byol = "ami-0cbc006e2efe79fd2"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0eb6c30ce0bb85d06"
        byol = "ami-045cb53d446427af0"
      },
      x86 = {
        payg = "ami-007429e0474de064a"
        byol = "ami-090038ec6bb5ff8a5"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0160699c723e982e1"
        byol = "ami-05ded2192c9400322"
      },
      x86 = {
        payg = "ami-0057eb5e072893f16"
        byol = "ami-0717c04b59312c955"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0e0afc13bd05957be"
        byol = "ami-0e87b198f90fc0888"
      },
      x86 = {
        payg = "ami-010760a2b6b21d8e7"
        byol = "ami-07147354f59e13667"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0b6d80f3660a5ca75"
        byol = "ami-03137e7b37894614a"
      },
      x86 = {
        payg = "ami-0731bbc5543aa0896"
        byol = "ami-0916a499d613b6c14"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0e74bc23d86215874"
        byol = "ami-0b70af841e7c3737c"
      },
      x86 = {
        payg = "ami-0a1d41e93d0d6a778"
        byol = "ami-0730a57b4eba00239"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-0120da3994be18943"
        byol = "ami-0d68c6720c07a4209"
      },
      x86 = {
        payg = "ami-0a3aee9d7c6d3509e"
        byol = "ami-0bf160b007a77d3f9"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-03ac02ab2a139b2e2"
        byol = "ami-022010f7f67d09534"
      },
      x86 = {
        payg = "ami-0b409dfda191488a7"
        byol = "ami-0df0a1100a7b5a14c"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-05377878ffa5701f1"
        byol = "ami-090e2c1f4e290a8cf"
      },
      x86 = {
        payg = "ami-02d84cd233459012a"
        byol = "ami-0f6d7a43197432b64"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-07def77fbd5499c11"
        byol = "ami-0f710101fec4e5a58"
      },
      x86 = {
        payg = "ami-00d2f7fe58f84bb25"
        byol = "ami-0dec21d30709b60d6"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-022079e14c625624f"
        byol = "ami-0d72300644f194742"
      },
      x86 = {
        payg = "ami-044dc19155058c5de"
        byol = "ami-03fdde9ae6d061e09"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-0e6cf664012a24bbb"
        byol = "ami-09f8a55a60ddecd28"
      },
      x86 = {
        payg = "ami-09619f0b2dd1a6257"
        byol = "ami-02c718d89de742b97"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-0ae538059a7504c41"
        byol = "ami-0314a5393c5839ee4"
      },
      x86 = {
        payg = "ami-0b9dc5a7095ddc879"
        byol = "ami-0468b0af8a31ad2f7"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-0e56a127092c9bba6"
        byol = "ami-0a7e78877b6b4930e"
      },
      x86 = {
        payg = "ami-0537bc683aec8b5ef"
        byol = "ami-0420673c9cc89184b"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-0ea41e101c2c6c195"
        byol = "ami-0892a7d3197f12e25"
      },
      x86 = {
        payg = "ami-0fe0e94a7394964ea"
        byol = "ami-04070dcc5dc2de453"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-0dd788df6c6874525"
        byol = "ami-06b60f82efbc723a1"
      },
      x86 = {
        payg = "ami-07ced775da4ef0a9a"
        byol = "ami-08c337b705abbd0d5"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-00616d7843ea1375e"
        byol = "ami-0776f337102e26996"
      },
      x86 = {
        payg = "ami-0f25481308000ce5c"
        byol = "ami-0f60ad809291f9eb4"
      }
    }
  }
}

variable "scenario" {
  default = "ha-tgw"
}

// password for FortiGate HA configuration
variable "password" {
  default = "fortinet"
}
# References of your environment
variable "region" {
  description = "Provide the region to deploy the VPC in"
  default     = "eu-west-1"
}

variable "availability_zone1" {
  description = "Provide the first availability zone to create the subnets in"
  default     = "eu-west-1a"
}

variable "availability_zone2" {
  description = "Provide the second availability zone to create the subnets in"
  default     = "eu-west-1c"
}

# References to your Networks
# security VPC
variable "security_vpc_cidr" {
  description = "Provide the network CIDR for the VPC"
  default     = "10.0.0.0/16"
}

#### data subnets
variable "security_vpc_data_subnet_cidr1" {
  description = "Provide the network CIDR for the data subnet1 in security vpc"
  default     = "10.0.1.0/24"
}

variable "security_vpc_data_gw1" {
  description = "Provide the default local router IP for the subnet1"
  default     = "10.0.1.1/24"
}

variable "security_vpc_data_subnet_cidr2" {
  description = "Provide the network CIDR for the data subnet1 in security vpc"
  default     = "10.0.10.0/24"
}

variable "security_vpc_data_gw2" {
  description = "Provide the default local router IP for the subnet2"
  default     = "10.0.10.1/24"
}

#### relay subnets
variable "security_vpc_relay_subnet_cidr1" {
  description = "Provide the network CIDR for the relay subnet1 in security vpc"
  default     = "10.0.101.0/24"
}

variable "security_vpc_relay_subnet_cidr2" {
  description = "Provide the network CIDR for the relay subnet2 in security vpc"
  default     = "10.0.102.0/24"
}

#### mgmt subnets
variable "security_vpc_mgmt_subnet_cidr1" {
  description = "Provide the network CIDR for the mgmt subnet1 in security vpc"
  default     = "10.0.4.0/24"
}

variable "security_vpc_mgmt_subnet1_gw" {
  description = "Provide the default local router IP for the subnet1"
  default     = "10.0.4.1/24"
}

variable "security_vpc_mgmt_subnet_cidr2" {
  description = "Provide the network CIDR for the mgmt subnet2 in security vpc"
  default     = "10.0.40.0/24"
}

variable "security_vpc_mgmt_subnet2_gw" {
  description = "Provide the default local router IP for the subnet2"
  default     = "10.0.40.1/24"
}

#### Heartbeat subnets
variable "security_vpc_heartbeat_subnet_cidr1" {
  description = "Provide the network CIDR for the public subnet1 in security vpc"
  default     = "10.0.3.0/24"
}

variable "security_vpc_heartbeat_subnet_cidr2" {
  description = "Provide the network CIDR for the public subnet1 in security vpc"
  default     = "10.0.30.0/24"
}

# spoke1 VPC
variable "spoke_vpc1_cidr" {
  description = "Provide the network CIDR for the VPC"
  default     = "10.1.0.0/16"
}

variable "spoke_vpc1_private_subnet_cidr1" {
  description = "Provide the network CIDR for the private subnet1 in spoke vpc1"
  default     = "10.1.1.0/24"
}

variable "spoke_vpc1_private_subnet_cidr2" {
  description = "Provide the network CIDR for the private subnet2 in spoke vpc1"
  default     = "10.1.10.0/24"
}

# spoke2 VPC
variable "spoke_vpc2_cidr" {
  description = "Provide the network CIDR for the VPC"
  default     = "10.2.0.0/16"
}

variable "spoke_vpc2_private_subnet_cidr1" {
  description = "Provide the network CIDR for the private subnet1 in spoke vpc2"
  default     = "10.2.1.0/24"
}

variable "spoke_vpc2_private_subnet_cidr2" {
  description = "Provide the network CIDR for the private subnet2 in spoke vpc2"
  default     = "10.2.10.0/24"
}

# Mgmt VPC
variable "mgmt_cidr" {
  description = "Provide the network CIDR for the Mgmt VPC"
  default     = "10.3.0.0/16"
}

variable "mgmt_private_subnet_cidr1" {
  description = "Provide the network CIDR for the mgmt subnet1 in spoke mgmt"
  default     = "10.3.1.0/24"
}

variable "mgmt_private_subnet_cidr2" {
  description = "Provide the network CIDR for the mgmt subnet2 in spoke mgmt"
  default     = "10.3.10.0/24"
}

# References to your FortiGate
variable "ami" {
  description = "Provide an AMI for the FortiGate instances"
  default     = "automatically gathered by terraform modules"
}

variable "keypair" {
  description = "Provide a keypair for accessing the FortiGate instances"
  default     = "<AWS SSH KEY>"
}

variable "cidr_for_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances"
  default     = "0.0.0.0/0"
}
