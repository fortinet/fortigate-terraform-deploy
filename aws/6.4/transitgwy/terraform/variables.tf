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

// AMIs are for FGTVM-AWS(PAYG) - 6.4.5
variable "fgt-ond-amis" {
  type = map
  default = {
    us-west-2      = "ami-0bd63e9b6f030819a"
    us-west-1      = "ami-0109010188b5b573b"
    us-east-1      = "ami-08ea233f6c1af5e84"
    us-east-2      = "ami-04c250698411252c9"
    ap-east-1      = "ami-0f86b4d9e4042517c"
    ap-south-1     = "ami-02623434e90a4eb94"
    ap-northeast-3 = "ami-0dad396c8a078d79a"
    ap-northeast-2 = "ami-09e9c92b84ea58aaf"
    ap-southeast-1 = "ami-086e03d1b2585d1d8"
    ap-southeast-2 = "ami-097983da0f89a0165"
    ap-northeast-1 = "ami-03d14586c97618b09"
    ca-central-1   = "ami-09cd0ee65f8a7cbd6"
    eu-central-1   = "ami-0479cc1e690725514"
    eu-west-1      = "ami-04acaa2b439d0ab7a"
    eu-west-2      = "ami-00f80eeec7920b5ab"
    eu-south-1     = "ami-001b7d48c8f37d191"
    eu-west-3      = "ami-0105ba9c9d7df062e"
    eu-north-1     = "ami-05472a2645b39adce"
    me-south-1     = "ami-037ce9c4a95c5a335"
    sa-east-1      = "ami-025e01b791a5b0bd6"
  }
}

// AMIs are for FGTVM AWS(BYOL) - 6.4.5
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-093c91ef5edce49a6"
    us-west-1      = "ami-0abf93087b8b6039c"
    us-east-1      = "ami-07e907b5ae3b6ad27"
    us-east-2      = "ami-0369456bca7679c37"
    ap-east-1      = "ami-0607c244f54cebd77"
    ap-south-1     = "ami-0ab141906704f2a51"
    ap-northeast-3 = "ami-0fa22d36cbb805b1d"
    ap-northeast-2 = "ami-036c90e71abd027ba"
    ap-southeast-1 = "ami-0cd6daf941ce15238"
    ap-southeast-2 = "ami-05fcd1eda54018e13"
    ap-northeast-1 = "ami-0b8771d8318131ea0"
    ca-central-1   = "ami-0c4cecd2e2f91c577"
    eu-central-1   = "ami-0e3b4279c34108da8"
    eu-west-1      = "ami-0c3fd9d2d765f52d7"
    eu-west-2      = "ami-01e98c30685d313a9"
    eu-south-1     = "ami-01c4700850d722eef"
    eu-west-3      = "ami-05fb5ba112997f4c4"
    eu-north-1     = "ami-0d2ff02042bdbaa74"
    me-south-1     = "ami-001a8c09bb54d3afc"
    sa-east-1      = "ami-09fe162de6d31c4de"
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
