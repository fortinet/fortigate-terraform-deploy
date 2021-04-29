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
  default     = "byol"
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

// AMIs are for FGTVM-AWS(PAYG) - 7.0.0
variable "fgt-ond-amis" {
  type = map
  default = {
    us-west-2      = "ami-0bcde5f20befaef29"
    us-west-1      = "ami-0d47e4065bc75afd0"
    us-east-1      = "ami-01a54d044634cf0f6"
    us-east-2      = "ami-03ab0acba901bbec4"
    ap-east-1      = "ami-02148e751d8ce6c1d"
    ap-south-1     = "ami-07def664c3a7d57b8"
    ap-northeast-2 = "ami-040206dd95f5dae4d"
    ap-southeast-1 = "ami-0bec3fa7b49492202"
    ap-southeast-2 = "ami-0a7013c7c28f2c667"
    ap-northeast-1 = "ami-0c549c1d962b7cc28"
    ca-central-1   = "ami-02d3b40ce0f2be79e"
    eu-central-1   = "ami-07a164a40b3fab627"
    eu-west-1      = "ami-0fcd573f69714ed57"
    eu-west-2      = "ami-0deb30f490c8dd07f"
    eu-west-3      = "ami-0d16a8df07a13375d"
    eu-north-1     = "ami-091492883a1e4e2b6"
    me-south-1     = "ami-04a68927aa0cc21ab"
    sa-east-1      = "ami-01ab2ddf70adbae51"
  }
}

// AMIs are for FGTVM AWS(BYOL) - 7.0.0
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-06001decb1cc65300"
    us-west-1      = "ami-01c16bdc91332f7ab"
    us-east-1      = "ami-0eb86d725cdceaebc"
    us-east-2      = "ami-04e4d720d31e93509"
    ap-east-1      = "ami-04c86a4d790dfc955"
    ap-south-1     = "ami-005f774c3443d956e"
    ap-northeast-2 = "ami-00eda4a12b5e6abf3"
    ap-southeast-1 = "ami-0bc23aee33e9c0b6c"
    ap-southeast-2 = "ami-0241253d4175098df"
    ap-northeast-1 = "ami-0656212a93166e13f"
    ca-central-1   = "ami-00f4cf5a2ec67f01a"
    eu-central-1   = "ami-0fbc69c41159026cd"
    eu-west-1      = "ami-05cd458dd16b40fc8"
    eu-west-2      = "ami-06d26c9c2b173184d"
    eu-west-3      = "ami-0d25245082df1074a"
    eu-north-1     = "ami-0cfc06894012624ab"
    me-south-1     = "ami-051f14f36368e32ed"
    sa-east-1      = "ami-089b5807bf62919a0"
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
