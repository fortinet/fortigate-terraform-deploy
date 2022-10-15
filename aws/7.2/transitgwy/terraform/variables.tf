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

// AMIs for FGTVM-7.2.2
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-05ddad7562730d881"
        byol = "ami-02bc959220d7fed46"
      },
      x86 = {
        payg = "ami-0cd6ef98ec787702b"
        byol = "ami-0b3319db6548e6ba9"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0f4d011ac605fb1d5"
        byol = "ami-0cedf9de28ee378f4"
      },
      x86 = {
        payg = "ami-0311d5e799e37bc0a"
        byol = "ami-06a058dbebecb20ba"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-01ca8e78817d3583a"
        byol = "ami-0d7752b345380b98c"
      },
      x86 = {
        payg = "ami-0b107a3fa2ea40b90"
        byol = "ami-088f6e6cd7e2d1e80"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-011c25d5a757821e3"
        byol = "ami-05cb67b4f52d9f755"
      },
      x86 = {
        payg = "ami-0a70f5380706e13ac"
        byol = "ami-0eaa5af24f037c62f"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-08b47964008fb9470"
        byol = "ami-0fe19ee36cc6b6f67"
      },
      x86 = {
        payg = "ami-0b435d1cf16aa90e7"
        byol = "ami-01218edaf747f9d1d"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-07eea7e44e4ffccbb"
        byol = "ami-09ec2dd8a0a2f20fd"
      },
      x86 = {
        payg = "ami-06c01d5bc4b43dc06"
        byol = "ami-07364323dc297ad03"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-06633716cb65a2286"
        byol = "ami-05df14ea2738d8897"
      },
      x86 = {
        payg = "ami-033647feb863a9186"
        byol = "ami-07eea7e44e4ffccbb"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0828d2d8027d6740c"
        byol = "ami-05d44e6c403771d12"
      },
      x86 = {
        payg = "ami-024311ffde39d2c03"
        byol = "ami-0209d99105fdb7698"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-03d13b179f289bc73"
        byol = "ami-068255e24bfd0b3a0"
      },
      x86 = {
        payg = "ami-024cf678856ba0c03"
        byol = "ami-069b0c703ea29d83e"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-04d998e433cb829c3"
        byol = "ami-041906466ef2c23b1"
      },
      x86 = {
        payg = "ami-0b9054cc488c2d27f"
        byol = "ami-0b70c933cd19ea860"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-0f99f666216b6eeb5"
        byol = "ami-004323b02aa50c222"
      },
      x86 = {
        payg = "ami-0e88fb5c5083105d0"
        byol = "ami-0fd47fb54f2930d82"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0e712314ace779e2c"
        byol = "ami-097380167308d1f47"
      },
      x86 = {
        payg = "ami-0e61c467e7f353497"
        byol = "ami-0eb58e93476e4cc4d"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-0a8aa1ce42e329593"
        byol = "ami-0dfd887d4e31c2eec"
      },
      x86 = {
        payg = "ami-08479d0bce02ca48b"
        byol = "ami-08092592378d8d6ec"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-024ee02a9dd8383ab"
        byol = "ami-0a905dc12c3cb100e"
      },
      x86 = {
        payg = "ami-0036e95e21ec5a86b"
        byol = "ami-056f5286aafab5205"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0ae7de812e7cb1a31"
        byol = "ami-00c06c054fa7a4624"
      },
      x86 = {
        payg = "ami-09694024ef925305f"
        byol = "ami-037f93ac7ef8ce5bd"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-062974225d56eee60"
        byol = "ami-0ca916fbc4980518b"
      },
      x86 = {
        payg = "ami-08128bac5135f4515"
        byol = "ami-0b7c2f464c014fcf8"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-055b51e58fb6d35e3"
        byol = "ami-07750093f606f8822"
      },
      x86 = {
        payg = "ami-010a33c56a41769be"
        byol = "ami-058b5a72d11f1d273"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-0a1fc1a743e2816de"
        byol = "ami-0d8d6621080959b71"
      },
      x86 = {
        payg = "ami-0f99c3f1f118ec33b"
        byol = "ami-03e98ed7e18e42a0b"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0c05cf621d626bf17"
        byol = "ami-020f9d727484bb0b7"
      },
      x86 = {
        payg = "ami-054bd339074d2f4f2"
        byol = "ami-02c432f95b9fd7751"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-068ab3619a56075a3"
        byol = "ami-0ace6a7d90c968830"
      },
      x86 = {
        payg = "ami-092c7f33e96a66602"
        byol = "ami-068d7475d3b1be847"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-03d2e50d15f874171"
        byol = "ami-0826784d2c057296e"
      },
      x86 = {
        payg = "ami-0234ecd760256557f"
        byol = "ami-070a27dae920ae9b0"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-054464894ca2063f1"
        byol = "ami-0ee858a7a971f377d"
      },
      x86 = {
        payg = "ami-0f812ef9070aba55b"
        byol = "ami-06b457a922e700066"
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
