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

//license files for the two fgts
variable "licenses" {
  // Change to your own byol license files
  type    = list(string)
  default = ["license.lic", "license2.lic"]
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// BYOL License format to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, file.
variable "license_format" {
  default = "file"
}

// use s3 bucket for bootstrap
// Either true or false
//
variable "bucket" {
  type    = bool
  default = "false"
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

// AMIs for FGTVM-7.6.4
variable "fgtami" {
  type = map(any)
  default = {
    af-south-1 = {
      x86 = {
        byol = "ami-0333782d3467101c4"
        payg = "ami-0a2aaa61326aa5638"
      }
    },
    ap-east-1 = {
      x86 = {
        byol = "ami-08a630285d04e4fea"
        payg = "ami-0ab414a2611ca8568"
      }
    },
    ap-east-2 = {
      x86 = {
        byol = "ami-006fb279f52241280"
        payg = "ami-08d2bd2d5fa390cb7"
      }
    },
    ap-northeast-1 = {
      x86 = {
        payg = "ami-0223afc484b71bd2c"
        byol = "ami-05da04ba94924394b"
      }
    },
    ap-northeast-2 = {
      x86 = {
        payg = "ami-0831d23606841df52"
        byol = "ami-080a811571020c88d"
      }
    },
    ap-northeast-3 = {
      x86 = {
        payg = "ami-018e2c2b68d3af5ad"
        byol = "ami-0f2b82184a6f10a5d"
      }
    },
    ap-south-1 = {
      x86 = {
        payg = "ami-060642135eb5bfcc4"
        byol = "ami-068b39f0a99ef7fec"
      }
    },
    ap-south-2 = {
      x86 = {
        byol = "ami-03010041638cc00df"
        payg = "ami-06acf16b029a42ed5"
      }
    },
    ap-southeast-1 = {
      x86 = {
        payg = "ami-025ff5a37daf75d87"
        byol = "ami-0aff761deaceea65e"
      }
    },
    ap-southeast-2 = {
      x86 = {
        payg = "ami-09598bb7c15e739cf"
        byol = "ami-0db26387d0e8fac3b"
      }
    },
    ap-southeast-3 = {
      x86 = {
        payg = "ami-00dc7d5518b5cd46a"
        byol = "ami-029ec0592b50556e5"
      }
    },
    ap-southeast-4 = {
      x86 = {
        payg = "ami-043c2e6c4a1c727c4"
        byol = "ami-0fcf304a3df7333b1"
      }
    },
    ap-southeast-5 = {
      x86 = {
        byol = "ami-060d631aa946be099"
        payg = "ami-0db20e837f49a6d50"
      }
    },
    ap-southeast-7 = {
      x86 = {
        payg = "ami-00e702e5e53238c74"
        byol = "ami-0de931c0ddaf47b75"
      }
    },
    ca-central-1 = {
      x86 = {
        payg = "ami-055afa06940ef6dda"
        byol = "ami-069f74f059ba4843e"
      }
    },
    ca-west-1 = {
      x86 = {
        payg = "ami-0aae22c44c6a50dbd"
        byol = "ami-0f51e38f829f78d30"
      }
    },
    eu-central-1 = {
      x86 = {
        payg = "ami-00648610b90b1963d"
        byol = "ami-014e3714647c41e91"
      }
    },
    eu-central-2 = {
      x86 = {
        byol = "ami-0367a61149646468c"
        payg = "ami-056ca566e28340259"
      }
    },
    eu-north-1 = {
      x86 = {
        payg = "ami-079fcef8c21c1927b"
        byol = "ami-0d6bf4561b42efb0a"
      }
    },
    eu-south-1 = {
      x86 = {
        byol = "ami-0892196b4e7722db0"
        payg = "ami-09ea20d1a7e07a27f"
      }
    },
    eu-south-2 = {
      x86 = {
        payg = "ami-05b092d15b394c49f"
        byol = "ami-0722e430540644827"
      }
    },
    eu-west-1 = {
      x86 = {
        payg = "ami-0142ee851bd65bd14"
        byol = "ami-0d8777d2d0215419b"
      }
    },
    eu-west-2 = {
      x86 = {
        byol = "ami-0011e5df6a1cc865d"
        payg = "ami-0436e29fed535b676"
      }
    },
    eu-west-3 = {
      x86 = {
        byol = "ami-01f4cf7b315c53054"
        payg = "ami-045d9c5ce697b167a"
      }
    },
    il-central-1 = {
      x86 = {
        payg = "ami-037bb5f227c004757"
        byol = "ami-0d656be65730ddf69"
      }
    },
    me-central-1 = {
      x86 = {
        byol = "ami-0797e0963e52c12b7"
        payg = "ami-07d2e882eda27a9bc"
      }
    },
    me-south-1 = {
      x86 = {
        payg = "ami-020e62e9ab8979b8b"
        byol = "ami-01aac3ac4770306a1"
      }
    },
    mx-central-1 = {
      x86 = {
        payg = "ami-082b7f042076f21dd"
        byol = "ami-0e716cedf64906925"
      }
    },
    sa-east-1 = {
      x86 = {
        payg = "ami-047456d4861cb54f0"
        byol = "ami-096c27177d35d30e5"
      }
    },
    us-east-1 = {
      x86 = {
        payg = "ami-04a9cf126e66612f0"
        byol = "ami-0b332c0226afc1a6b"
      }
    },
    us-east-2 = {
      x86 = {
        byol = "ami-02ea72889044b0b49"
        payg = "ami-08f4bf15e8e431bf6"
      }
    },
    us-west-1 = {
      x86 = {
        payg = "ami-07d78d7d4f78e11d0"
        byol = "ami-0940c420b6fc4a4fc"
      }
    },
    us-west-2 = {
      x86 = {
        payg = "ami-064c154d272ed3690"
        byol = "ami-06bac2fe66b8738a2"
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
