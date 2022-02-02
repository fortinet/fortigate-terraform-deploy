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

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "byol"
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

#############################################################################################################
#  AMI

// AMIs are for FGTVM-AWS(PAYG) - 7.0.3
variable "fgt-ond-amis" {
  type = map(any)
  default = {
    us-west-2      = "ami-014b0761f581d0e9d"
    us-west-1      = "ami-0e6d4eb48ac4956e0"
    us-east-1      = "ami-099e9f57e31ec423c"
    us-east-2      = "ami-0323df31f5a8f8bd2"
    ap-east-1      = "ami-041983c36b6fbbb0d"
    ap-south-1     = "ami-0f56a870791d33ced"
    ap-northeast-3 = "ami-0fb452b72b910d144"
    ap-northeast-2 = "ami-0efc1e91b7ee9407d"
    ap-southeast-1 = "ami-03bc23b66fb984025"
    ap-southeast-2 = "ami-016f1d1cc2bc0dc18"
    ap-northeast-1 = "ami-0d3ae196f89774c27"
    ca-central-1   = "ami-0d42479c46feab8f7"
    eu-central-1   = "ami-0c0d7785bcc656ea4"
    eu-west-1      = "ami-0c149861a0243badc"
    eu-west-2      = "ami-029ffbc3b4ee2ea69"
    eu-south-1     = "ami-0060556a3c2ee8af3"
    eu-west-3      = "ami-0e8f659f310a04c55"
    eu-north-1     = "ami-0fa18afb10d953432"
    me-south-1     = "ami-0800493574bacdca4"
    sa-east-1      = "ami-00d6b0680d26d5f29"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 7.0.2
variable "fgtvmbyolami" {
  type = map(any)
  default = {
    us-west-2      = "ami-083a0794c27f644cd"
    us-west-1      = "ami-02f74eacda2205a3f"
    us-east-1      = "ami-07ebc2e34d5ce72f4"
    us-east-2      = "ami-056dda2f1e4afb543"
    ap-east-1      = "ami-0311b61685243ba66"
    ap-south-1     = "ami-0a10c8c2f2aaa4ae1"
    ap-northeast-3 = "ami-0f60eaf0461e2136d"
    ap-northeast-2 = "ami-0d20f9116ec8b7b38"
    ap-southeast-1 = "ami-056c0803ff6f6afa5"
    ap-southeast-2 = "ami-0265ba41aa07c3558"
    ap-northeast-1 = "ami-05ac4892f4ee74676"
    ca-central-1   = "ami-00b08287c478c4a98"
    eu-central-1   = "ami-016c74c0462cafba2"
    eu-west-1      = "ami-00844c5dd9a2e4396"
    eu-west-2      = "ami-0ed73511e91ef6e86"
    eu-south-1     = "ami-0295d1b6c0f8b856a"
    eu-west-3      = "ami-061e0f308353b27b1"
    eu-north-1     = "ami-033be08365c1ebed8"
    me-south-1     = "ami-0e5c84edacd14a664"
    sa-east-1      = "ami-07d447912183bc4be"
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

variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default     = "c5.xlarge"
}

variable "keypair" {
  description = "Provide a keypair for accessing the FortiGate instances"
  default     = "<AWS SSH KEY>"
}

variable "cidr_for_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances"
  default     = "0.0.0.0/0"
}
