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
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default = "c5n.xlarge"
}

#############################################################################################################
#  AMI

// AMIs for FGTVM-7.2.4
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0d6d152f9919cee47"
        byol = "ami-0d702463a4d694f70"
      },
      x86 = {
        payg = "ami-0c060976cbbba34f6"
        byol = "ami-01f5501a825a18928"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0e9573e8922715847"
        byol = "ami-08767eb1b1c672f4b"
      },
      x86 = {
        payg = "ami-0b29abb59e00e9978"
        byol = "ami-0063d4810c57684cc"
      }
    },
    us-west-1 = {
      arm = {
	payg = "ami-01677fe5ad4ba546a"
        byol = "ami-00e902aaf2d17bc31"
      },
      x86 = {
        payg = "ami-04993d32cf0ac4a9e"
        byol = "ami-0032e1fec57c21ef4"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0558d0bc2bbccd1e6"
        byol = "ami-0c25c4372226c7499"
      },
      x86 = {
        payg = "ami-023d43c8c28258f24"
        byol = "ami-08381c32410917a16"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-0cfd94c7f62aeb266"
        byol = "ami-03a8b40f1304de733"
      },
      x86 = {
        payg = "ami-08700b5084e959d34"
        byol = "ami-0b7574e426c74819e"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-07985b3758af6ce0b"
        byol = "ami-054fa7923c8b33973"
      },
      x86 = {
        payg = "ami-096fbf3686e4db55d"
        byol = "ami-0b318fe264bb658e6"
      }
    },
   ap-southeast-3 = {
      arm = {
        payg = "ami-006795fd8e04e8c47"
        byol = "ami-0cac793d49e6231eb"
      },
      x86 = {
        payg = "ami-0c03c04aed17ed1fc"
        byol = "ami-01c2eb659d7491eb2"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0f4641f88284dc63d"
        byol = "ami-0d6649daed0178ec7"
      },
      x86 = {
        payg = "ami-0e8be06e5ec41ad10"
        byol = "ami-07943e7eec4666ffb"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0ac3255a21dc9aa97"
        byol = "ami-0f2572cd3098a6eff"
      },
      x86 = {
        payg = "ami-0e6f8219fd25a2270"
        byol = "ami-0fe743714465d8ff4"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0caf07a9e8ab64a0e"
        byol = "ami-0e679008b002b0fdc"
      },
      x86 = {
        payg = "ami-0842503a324f53632"
        byol = "ami-0e9bf0fd055971402"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-09f13a2df79f5cc46"
        byol = "ami-0e26f2b9e44812a28"
      },
      x86 = {
        payg = "ami-00ff48c72cac88cf1"
        byol = "ami-0475a5950c1eda2f2"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0bb9b2f81e4ee7ce0"
        byol = "ami-0cadaa8f3dbf9035d"
      },
      x86 = {
        payg = "ami-0ee4153f640f145c5"
        byol = "ami-0d1768c7793dd800e"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-001cb75732e1951ed"
        byol = "ami-066485f1a45d5e28e"
      },
      x86 = {
        payg = "ami-0f413df152d16824c"
        byol = "ami-081ca316b059baebf"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0ab5a898fc322623c"
        byol = "ami-072441a86b3402dfb"
      },
      x86 = {
        payg = "ami-0c459aafeb22e61f1"
        byol = "ami-0e3fa860693ea8ff1"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0c6cafad59d838f7f"
        byol = "ami-0a3b1ed3209fe40dc"
      },
      x86 = {
        payg = "ami-06c6beeb526045545"
        byol = "ami-07e93bf00b36addff"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-01bf5033201e6e3b0"
        byol = "ami-0286ae794f64fb87d"
      },
      x86 = {
        payg = "ami-039aedaa91b1abfb2"
        byol = "ami-08d9996a44857f440"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-06b2aa535543180ec"
        byol = "ami-071e9a61e657e09bc"
      },
      x86 = {
        payg = "ami-0567b135b850a1f66"
        byol = "ami-0c656bb7d0d0999b3"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-083762fb4feeca77d"
        byol = "ami-0185b3fb3e031d10a"
      },
      x86 = {
        payg = "ami-0ddfa893e5391d59d"
        byol = "ami-0e2767de3cd2f9e29"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-026183da64c5f71f1"
        byol = "ami-0396d66c9bcb2774c"
      },
      x86 = {
        payg = "ami-07db225c929875da0"
        byol = "ami-04e99d8f826a6a583"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-04d328aab696cd51b"
        byol = "ami-08e3e751c40cea3fe"
      },
      x86 = {
        payg = "ami-0de9cc616ccb461dd"
        byol = "ami-0e09f41ea4b6ebd41"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-05084dc5be758ba53"
        byol = "ami-0ff81c22e59c3110b"
      },
      x86 = {
        payg = "ami-0a67cd1cc81e9448b"
        byol = "ami-0ee364800dcbdb84a"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0ad4a0d50cde97133"
        byol = "ami-004ef9ce7982c01ba"
      },
      x86 = {
        payg = "ami-0ad0eb946b258b7b7"
        byol = "ami-0aaec97c42fea1fbb"
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
