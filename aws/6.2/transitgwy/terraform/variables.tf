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
  default     = "Terraform"
}


#############################################################################################################
#  AMI
variable "fgt-byol-amis" {
  description = "FortiGate BYOL AMIs by region"
  type        = map(string)
  default = {
    "ap-northeast-1" = "ami-02b216ce42200bd6a"
    "ap-northeast-2" = "ami-058c63ef8f6c2f940"
    "ap-south-1"     = "ami-0d3a510f33845439d"
    "ap-southeast-1" = "ami-094f0953740d98fdc"
    "ap-southeast-2" = "ami-003c22d372f903dc6"
    "ca-central-1"   = "ami-004936b7904788393"
    "eu-central-1"   = "ami-0bde30b21653b5903"
    "eu-west-1"      = "ami-011224dfab21c9d08"
    "eu-west-2"      = "ami-0cadaf9dcaa05a0e4"
    "eu-west-3"      = "ami-0857a38f3352c6082"
    "eu-north-1"     = "ami-0997b1dc094d3f593"
    "sa-east-1"      = "ami-0fd3bcbeb96bd6500"
    "us-east-1"      = "ami-00785474df0ceb957"
    "us-east-2"      = "ami-009564e7a8002c522"
    "us-west-1"      = "ami-0da4cc5f259b0c23d"
    "us-west-2"      = "ami-04fc0698575eb8a17"
    "me-south-1"     = "ami-0daa760f36ca44f11"
    "ap-east-1"      = "ami-6f41041e"
  }
}

variable "fgt-ond-amis" {
  description = "FortiGate PAYG AMIs by region"
  type        = map(string)
  default = {
    "ap-northeast-1" = "ami-0444162d604179bf6"
    "ap-northeast-2" = "ami-065b67d14c722617a"
    "ap-south-1"     = "ami-0f6693857523585b8"
    "ap-southeast-1" = "ami-0155fb808596ae522"
    "ap-southeast-2" = "ami-0b67711c6be07aa0b"
    "ap-east-1"      = "ami-0437be57fc361c67b"
    "ca-central-1"   = "ami-099941e57393c2225"
    "eu-central-1"   = "ami-0c380ca68f2b1f6e8"
    "eu-west-1"      = "ami-0874d1d29263b27ff"
    "eu-west-2"      = "ami-04eba63bb19dbeebe"
    "eu-west-3"      = "ami-0c104a0848b644152"
    "sa-east-1"      = "ami-04de901f24e8532db"
    "us-east-1"      = "ami-027f258cda3df62de"
    "us-east-2"      = "ami-05a4ac8312f7911b9"
    "us-west-1"      = "ami-0f54d37e47fa994a0"
    "us-west-2"      = "ami-02b9cc036cab1071d"
    "eu-north-1"     = "ami-0d49417aa3a3912e1"
    "me-south-1"     = "ami-0fcd028d7d86a0695"
    "sa-east-1"      = "ami-04de901f24e8532db"
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
  default     = "us-west-2"
}

variable "availability_zone1" {
  description = "Provide the first availability zone to create the subnets in"
  default     = "us-west-2a"
}

variable "availability_zone2" {
  description = "Provide the second availability zone to create the subnets in"
  default     = "us-west-2b"
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
  default     = "taskcat"
}

variable "cidr_for_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances"
  default     = "0.0.0.0/0"
}

# Support PAYG for now
variable "license_type" {
  description = "Provide the license type for the FortiGate instances: payg"
  default     = "payg"
}
