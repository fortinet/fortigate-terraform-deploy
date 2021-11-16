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

// AMIs are for FGTVM-AWS(PAYG) - 6.4.7
variable "fgt-ond-amis" {
  type = map
  default = {
    us-west-2      = "ami-0a56e818a46c63c91"
    us-west-1      = "ami-0ba8bcbaa9804c553"
    us-east-1      = "ami-0d480c4d334beff0e"
    us-east-2      = "ami-0d5333f9359d76a8e"
    ap-east-1      = "ami-0528a929e41968c90"
    ap-south-1     = "ami-03f7a76c1380c7ad6"
    ap-northeast-3 = "ami-02a07846a621a69d9"
    ap-northeast-2 = "ami-016b91e562c386569"
    ap-southeast-1 = "ami-04b14fc559454956a"
    ap-southeast-2 = "ami-0021afae0133c1009"
    ap-northeast-1 = "ami-03323ffab431a051a"
    ca-central-1   = "ami-065842c41b73e0197"
    eu-central-1   = "ami-0026cf2f0ab64b87b"
    eu-west-1      = "ami-0d853ba436dc8fc01"
    eu-west-2      = "ami-0f7055c9365eae6f4"
    eu-south-1     = "ami-048355214147aa2d1"
    eu-west-3      = "ami-03432560a8dfbb4f7"
    eu-north-1     = "ami-0f5b9a3a22260ebf1"
    me-south-1     = "ami-0da8469b3b9eb7afa"
    sa-east-1      = "ami-089cad2a7a4d3501e"
  }
}

// AMIs are for FGTVM AWS(BYOL) - 6.4.7
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-0e08f3fe74ba7e859"
    us-west-1      = "ami-0baabe133544a64f0"
    us-east-1      = "ami-065f5f3d485c1ec3f"
    us-east-2      = "ami-044959ac92cbb585b"
    ap-east-1      = "ami-0d29fd65fc50a0a68"
    ap-south-1     = "ami-071e11bc680d59725"
    ap-northeast-3 = "ami-062467bb168cb7641"
    ap-northeast-2 = "ami-036c495952ea228f8"
    ap-southeast-1 = "ami-0d6b93a8ed23875f8"
    ap-southeast-2 = "ami-07c25feff0b1d73cb"
    ap-northeast-1 = "ami-05f22289eae68a667"
    ca-central-1   = "ami-02bedc73195b4f137"
    eu-central-1   = "ami-0c971b652ecda772d"
    eu-west-1      = "ami-0e360533772060fd1"
    eu-west-2      = "ami-0df08d256789f9289"
    eu-south-1     = "ami-004cf59a5f497ff89"
    eu-west-3      = "ami-09a295993c0c918b3"
    eu-north-1     = "ami-0033cfa8c85af242f"
    me-south-1     = "ami-0705cf1da677bd2e9"
    sa-east-1      = "ami-0aecd7b1537bcbf91"
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
