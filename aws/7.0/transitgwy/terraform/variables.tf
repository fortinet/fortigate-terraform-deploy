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

// AMIs are for FGTVM-AWS(PAYG) - 7.0.1
variable "fgt-ond-amis" {
  type = map
  default = {
    us-west-2      = "ami-0450a759578d5f9e8"
    us-west-1      = "ami-0bed74e557899b316"
    us-east-1      = "ami-0b9c648555f605b8a"
    us-east-2      = "ami-048fa209a6f531c8e"
    ap-east-1      = "ami-0ba7332b78dedfdf0"
    ap-south-1     = "ami-0f8da603aeae144f0"
    ap-northeast-2 = "ami-0d90068740a70e960"
    ap-southeast-1 = "ami-0aa8b7bcf2a04ad1f"
    ap-southeast-2 = "ami-0793fa38bb58f353e"
    ap-northeast-1 = "ami-0e45541bf4f626eb8"
    ca-central-1   = "ami-0e92233e968a00d5a"
    eu-central-1   = "ami-0c48bc0e23f9042fc"
    eu-west-1      = "ami-066f47e167e4090e0"
    eu-west-2      = "ami-073e93d6afc52ee0e"
    eu-west-3      = "ami-07a5212e5d2fee5ed"
    eu-north-1     = "ami-0f21240140d3d2866"
    me-south-1     = "ami-0694965772c0df593"
    sa-east-1      = "ami-0c80c01c54651d66e"
  }
}

// AMIs are for FGTVM AWS(BYOL) - 7.0.1
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-0070ab4edc735c379"
    us-west-1      = "ami-09e5387cc293153c1"
    us-east-1      = "ami-02678839ab63d47a1"
    us-east-2      = "ami-01fc50db5a27388fa"
    ap-east-1      = "ami-069022a0b0042e2b8"
    ap-south-1     = "ami-00609a13c17b3cf5d"
    ap-northeast-2 = "ami-0a0e4c41637e6936f"
    ap-southeast-1 = "ami-0d9a129903b7ba964"
    ap-southeast-2 = "ami-0b9ef7623fc628069"
    ap-northeast-1 = "ami-0bfb0a297a846758d"
    ca-central-1   = "ami-0f5966c7ff86c1cb6"
    eu-central-1   = "ami-09ca8648996694d40"
    eu-west-1      = "ami-01118ca5692326739"
    eu-west-2      = "ami-073e5153688b42f25"
    eu-west-3      = "ami-00e8ba0a04789ad0e"
    eu-north-1     = "ami-0907f64a7bbfb94ff"
    me-south-1     = "ami-098b025df177bd3d4"
    sa-east-1      = "ami-01abe8a3a6cd165e7"
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
