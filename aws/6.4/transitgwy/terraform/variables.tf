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
  default = "payg"
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

// AMIs are for FGTVM-AWS(PAYG) - 6.4.13
variable "fgt-ond-amis" {
  type = map(any)
  default = {
    us-west-2      = "ami-02c3d0e3485fd9cc3"
    us-west-1      = "ami-06fd9ee9a22819e93"
    us-east-1      = "ami-0d2e1dbd88cb90d88"
    us-east-2      = "ami-0d9e6a6fa5d480dc5"
    ap-east-1      = "ami-0cba1e5dbfd73a65a"
    ap-south-1     = "ami-04bebae4f75a96c7a"
    ap-northeast-3 = "ami-093bcf5d4c68b2b95"
    ap-northeast-2 = "ami-00983410b4f1403ec"
    ap-southeast-1 = "ami-070b1b4eb3d3c60a7"
    ap-southeast-2 = "ami-0e7c05f8a7ada2233"
    ap-northeast-1 = "ami-07f0fc07f2c1aa8f9"
    ca-central-1   = "ami-020d62bd23d0a2ce8"
    eu-central-1   = "ami-0b15328bf5aa72a55"
    eu-west-1      = "ami-0e18979c70f883fc3"
    eu-west-2      = "ami-0edd548310ac8f27c"
    eu-south-1     = "ami-08288b180c501d799"
    eu-west-3      = "ami-0153a514558e966e9"
    eu-north-1     = "ami-0ae9abae3b34a8a94"
    me-south-1     = "ami-098d32f5570aaf072"
    sa-east-1      = "ami-0cf524ba4a55b383e"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 6.4.13
variable "fgtvmbyolami" {
  type = map(any)
  default = {
    us-west-2      = "ami-0bcde649fd65b5581"
    us-west-1      = "ami-0a9343e9bedc1089d"
    us-east-1      = "ami-0619aa306668f1276"
    us-east-2      = "ami-05d7975a2268c0410"
    ap-east-1      = "ami-0242e82447b9d90df"
    ap-south-1     = "ami-08394dd67c3953e8d"
    ap-northeast-3 = "ami-0610288da3b427589"
    ap-northeast-2 = "ami-0b53abe564f5df4f9"
    ap-southeast-1 = "ami-0aed1c4dd82224e5c"
    ap-southeast-2 = "ami-0f1c17f67c91b7599"
    ap-northeast-1 = "ami-000a05d9e840e55d3"
    ca-central-1   = "ami-0d324bc705c412758"
    eu-central-1   = "ami-0c58f79e44e8287e1"
    eu-west-1      = "ami-0f91bbdabb1f08daa"
    eu-west-2      = "ami-02cf48b5215b8bb06"
    eu-south-1     = "ami-0a4bfa45a8136b145"
    eu-west-3      = "ami-03e37a401a4386b47"
    eu-north-1     = "ami-0e66a66b02f3ba5d9"
    me-south-1     = "ami-07c1887b27f18a833"
    sa-east-1      = "ami-0a7d42e30b5b4b096"
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
