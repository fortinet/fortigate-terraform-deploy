##############################################################################################################
#
# FortiGate Terraform deployment
# Active Passive High Availability MultiAZ with AWS Transit Gateway with VPC standard attachment -
#
##############################################################################################################

# Access and secret keys to your environment
variable "access_key" {}
variable "secret_key" {}

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
// Note: 7.0.12 doesn't have ARM AMI.  Only x86.
variable "arch" {
  default = "x86"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default     = "c5n.xlarge"
}


#############################################################################################################
#  AMI

// For 7.0.12, there is no AMI for the ARM platform
// AMIs for FGTVM-7.0.12
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-08ddbd2155132317b"
        byol = "ami-0ac6fa050c788d801"
      }
    },
    us-east-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-01817f6f93e76ad2a"
        byol = "ami-09321dcf8bb1fa0b6"
      }
    },
    us-west-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0ed78d7029954819d"
        byol = "ami-090ac5f1b82e51bf9"
      }
    },
    us-west-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-066d72b2d87de88fa"
        byol = "ami-0696a6c4d799074bb"
      }
    },
    af-south-1 = {
     arm = {
        payg = ""
        byol = ""
     },
     x86 = {
        payg = "ami-03330f74d11751a6d"
        byol = "ami-0c179219bfaabdace"
     }
    },
    ap-east-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-05148635f70a86df8"
        byol = "ami-03176e7744042594b"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0bfed2a7d1e68949a"
        byol = "ami-00ffa267f368640c0"
      }
    },
    ap-south-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-097079b4f31d18394"
        byol = "ami-0a692a2d630e762f6"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0a86f59680c0f33d0"
        byol = "ami-075638c64edd29eb2"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0ad93f15c983581c6"
        byol = "ami-06e461f119feb2799"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-05af12f32906bfc49"
        byol = "ami-0c0a996565d9fecdf"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0b9c231097025128c"
        byol = "ami-029606d980a551721"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0d10006c63e2055f9"
        byol = "ami-08c9b1b69f7d4b995"
      }
    },
    ca-central-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-02ca02182aa40c490"
        byol = "ami-0c0b7a8b039e8bdcf"
      }
    },
    eu-central-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-019e76ee8a02a3226"
        byol = "ami-09f7b3f5ac2313e57"
      }
    },
    eu-west-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-00a65f06615fc77ac"
        byol = "ami-04ec9ddb79754a393"
      }
    },
    eu-west-2 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-070e8c502bfa98d12"
        byol = "ami-089778e7a76387976"
      }
    },
    eu-south-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0f5d9628169846585"
        byol = "ami-02b5db61c8c0e7917"
      }
    },
    eu-west-3 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0f5d9628169846585"
        byol = "ami-02b5db61c8c0e7917"
      }
    },
    eu-north-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0d65275f41a617820"
        byol = "ami-07cc4c668064909d7"
      }
    },
    me-south-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-0b4108b3d16e8539b"
        byol = "ami-0b6bb03f34629461e"
      }
    },
    me-central-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-00d8342144b773b21"
        byol = "ami-071bd251c584b1516"
      }
    },
    sa-east-1 = {
      arm = {
        payg = ""
        byol = ""
      },
      x86 = {
        payg = "ami-00eb40920085e089b"
        byol = "ami-01ce2e9971a787830"
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
