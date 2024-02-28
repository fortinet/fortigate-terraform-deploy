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

// AMIs for FGTVM-7.0.14
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-04685e5ad59c8c8df"
        byol = "ami-0ee9b7cc689976a5f"
      },
      x86 = {
        payg = "ami-0ddbcf41d6891e28f"
        byol = "ami-0400bd031d645376a"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-05c8f9c62e1e240bf"
        byol = "ami-0c7b55b820ed2d527"
      },
      x86 = {
        payg = "ami-0372082bd4629de3b"
        byol = "ami-0fb95c959125e14b8"
      }
    },
    us-west-1 = {
      arm = {
        payg = "ami-0bc2f064c4783af9c"
        byol = "ami-0df3af7d7ef1f6ff8"
      },
      x86 = {
        payg = "ami-012aee9bf069c2220"
        byol = "ami-08d22bd1d9a756d1f"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0fc67c48a6e1068db"
        byol = "ami-0e9a97243b6f10caf"
      },
      x86 = {
        payg = "ami-00c16934d1d731735"
        byol = "ami-0dbd8cf6278a674ba"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-08902ad132127b023"
        byol = "ami-0ef53d54bb7cc02d4"
      },
      x86 = {
        payg = "ami-09c10620eb195befd"
        byol = "ami-0cb389a148f5aa3df"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-0c953ce52a580ba08"
        byol = "ami-0bf33e4681abd09c2"
      },
      x86 = {
        payg = "ami-013f3be243191aa33"
        byol = "ami-0298e2d8dc87ab416"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-08ff2738041c42e49"
        byol = "ami-0debe460bfbcebf6e"
      },
      x86 = {
        payg = "ami-0e806b4278a15c622"
        byol = "ami-042ddb30ef2503797"
      }
    },
    ap-southeast-3 = {
      arm = {
        payg = "ami-0dbec1840c1dfefba"
        byol = "ami-05d084d4d53c3690e"
      },
      x86 = {
        payg = "ami-0e4b308380003b4f9"
        byol = "ami-0a8aef992ae445c69"
      }
    },
    ap-southeast-4 = {
      arm = {
        payg = "ami-01e93dd532a8ffab9"
        byol = "ami-06eb6129f759c20fc"
      },
      x86 = {
        payg = "ami-01457b4153f1e284c"
        byol = "ami-0ac04021de2c08d19"
      }
    },
 
    ap-south-1 = {
      arm = {
        payg = "ami-092a97156f0e13679"
        byol = "ami-00b45fd01cf895f95"
      },
      x86 = {
        payg = "ami-034d7188e41b8f9f2"
        byol = "ami-02af7aeab2ca025be"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-007e33f4803e018ee"
        byol = "ami-06454bf7e7753dded"
      },
      x86 = {
        payg = "ami-0592d380fa9224deb"
        byol = "ami-09e7913dc57a92b90"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-005a480a0883365e5"
        byol = "ami-0a4745aa677d26bda"
      },
      x86 = {
        payg = "ami-019140af061111738"
        byol = "ami-0df7b88ddc56edc40"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-01e533e387d43ec62"
        byol = "ami-06116d2c455d3d831"
      },
      x86 = {
        payg = "ami-00b35b67839f5cc1e"
        byol = "ami-0b0094ec8f2566dae"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-024312284605513f1"
        byol = "ami-0cd8bb2832827da5a"
      },
      x86 = {
        payg = "ami-008efa8c289a76d82"
        byol = "ami-084c69f2113ceab40"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-03b573c2024e21c15"
        byol = "ami-0ca53e2c2843f4121"
      },
      x86 = {
        payg = "ami-061792a4b77486af9"
        byol = "ami-09761938eefc71b3e"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-096f12df98e97272b"
        byol = "ami-09b19f91a8f4b1630"
      },
      x86 = {
        payg = "ami-0e5253ab4ae72b815"
        byol = "ami-0463ae78c6c1c86eb"
      }
    },
    ca-west-1 = {
      arm = {
        payg = "ami-0eddb92a8e75a074f"
        byol = "ami-0691744b1eb35816e"
      },
      x86 = {
        payg = "ami-07a5c40dc08a54b64"
        byol = "ami-013d774ff9aad2475"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-058b006e608a9c10d"
        byol = "ami-0c8baaad8deaeb246"
      },
      x86 = {
        payg = "ami-0ad6bcfb9e359c8d6"
        byol = "ami-0233f3dcbff6917dd"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-04fdff8fe3a1dc437"
        byol = "ami-0bd46041120fbdbc2"
      },
      x86 = {
        payg = "ami-09f4fce05ecb8052d"
        byol = "ami-07f50c736a3d0fda4"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-034cbf22c4538c928"
        byol = "ami-0f6ec3c7de6494098"
      },
      x86 = {
        payg = "ami-0351a5a276cb68a45"
        byol = "ami-0b1d71dcaf0de98ab"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-04dcdbc0d8398546b"
        byol = "ami-04041274afb9f9257"
      },
      x86 = {
        payg = "ami-0924625f206d9e5be"
        byol = "ami-09bee37c2847aed09"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-0a5afa2ff40a28e3c"
        byol = "ami-09e317a1fec5e10f3"
      },
      x86 = {
        payg = "ami-0984047fbfd8ba9ef"
        byol = "ami-0545c0511a3f4b97c"
      }
    },
    eu-south-2 = {
      arm = {
        payg = "ami-0b8c72ef793cd917e"
        byol = "ami-0ef804ebfb06dd7f1"
      },
      x86 = {
        payg = "ami-0c38cb5e64364e055"
        byol = "ami-0ad1bc1b655bece30"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-01bb41d50be366629"
        byol = "ami-063dfa2d68666b72c"
      },
      x86 = {
        payg = "ami-0ab3950e2e1f2aeda"
        byol = "ami-0cfd26e479ab99772"
      }
    },
    eu-central-2 = {
      arm = {
        payg = "ami-04fea74510e4f9f45"
        byol = "ami-0d73cba8f4fc6bcd3"
      },
      x86 = {
        payg = "ami-06c37caee904430cc"
        byol = "ami-0212ee4ab4ee9be81"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-09c4754b965b7b66b"
        byol = "ami-0f22d71fad6be287d"
      },
      x86 = {
        payg = "ami-08cef9d686e64740f"
        byol = "ami-02913deb64b64c2ea"
      }
    },
    me-central-1 = {
      arm = {
        payg = "ami-05c9f2519190257fd"
        byol = "ami-0937f30976f7c9014"
      },
      x86 = {
        payg = "ami-0a7648017fce2ebe8"
        byol = "ami-04111ddb03c6382c9"
      }
    },
    il-central-1 = {
      arm = {
        payg = "ami-02e9dc84009abdc22"
        byol = "ami-083a783b4e89c2709"
      },
      x86 = {
        payg = "ami-0fe9d345a865a2acd"
        byol = "ami-0f6935a716b127570"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0cce0246ec797ae83"
        byol = "ami-05b94ad08d0ead3d1"
      },
      x86 = {
        payg = "ami-0f3abcc15f0e685f3"
        byol = "ami-052e034a4d257c5e4"
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
