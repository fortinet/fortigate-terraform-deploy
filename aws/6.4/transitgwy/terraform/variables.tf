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
  default     = "payg"
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

// AMIs are for FGTVM-AWS(PAYG) - 6.4.3
variable "fgt-ond-amis" {
  type = map
  default = {
    us-west-2      = "ami-0ddbc0e996e124572"
    us-west-1      = "ami-01d7f9197c106f3b4"
    us-east-1      = "ami-0c184c594e9203c45"
    us-east-2      = "ami-0fcf6b58d6d82a53f"
    ap-east-1      = "ami-06a747a157d4b78ec"
    ap-south-1     = "ami-0afa25566526b5c3a"
    ap-northeast-2 = "ami-05eb0d45254a7a0ce"
    ap-southeast-1 = "ami-0015dc48d24804323"
    ap-southeast-2 = "ami-04b5dda77d0a5c9e7"
    ap-northeast-1 = "ami-05bd4d10b85a28745"
    ca-central-1   = "ami-0224f468fd52b1b28"
    eu-central-1   = "ami-0046e253de29782f4"
    eu-west-1      = "ami-00d3e7b592e7b9c73"
    eu-west-2      = "ami-08b2373c2c6e94882"
    eu-west-3      = "ami-0965b5ec92e30ebd4"
    eu-north-1     = "ami-041765016e33a5496"
    me-south-1     = "ami-0ba296ca31432a756"
    sa-east-1      = "ami-07ca8d72b427216b4"
  }
}

// AMIs are for FGTVM AWS(BYOL) - 6.4.3
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-073592d096f2699ad"
    us-west-1      = "ami-0717fc4ad21d83d92"
    us-east-1      = "ami-056b8cbed90f235f7"
    us-east-2      = "ami-0fa6c260237788eb1"
    ap-east-1      = "ami-08de303af09fb2ba5"
    ap-south-1     = "ami-01fe3471c95b0bd8d"
    ap-northeast-2 = "ami-0741cc6aa50ee2f15"
    ap-southeast-1 = "ami-0066ff4bb5b3beb87"
    ap-southeast-2 = "ami-041c504cef8087823"
    ap-northeast-1 = "ami-0ed1410fa91b8fe63"
    ca-central-1   = "ami-00e3f08f2797559b4"
    eu-central-1   = "ami-09df5f66c63f3af7b"
    eu-west-1      = "ami-0a14533f2a9dcad5f"
    eu-west-2      = "ami-0079c171f690bd729"
    eu-west-3      = "ami-033da5aa41d3d6710"
    eu-north-1     = "ami-08dbc6001d5d8d9e1"
    me-south-1     = "ami-0042f1e48c7a55a75"
    sa-east-1      = "ami-086b55d007b3f2cf0"
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
  default     = "<AWS SSH key>"
}

variable "cidr_for_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances"
  default     = "0.0.0.0/0"
}
