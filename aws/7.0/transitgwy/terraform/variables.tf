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

// AMIs are for FGTVM-AWS(PAYG) - 7.0.5
variable "fgt-ond-amis" {
  type = map(any)
  default = {
    us-east-1      = "ami-03e7e7d91a52ca5a8"
    us-east-2      = "ami-0e113c50f06a97400"
    us-west-1      = "ami-082652dab4c2b2b08"
    us-west-2      = "ami-07088d7493c5a0800"
    af-south-1     = "ami-0295c5080b9805520"
    ap-east-1      = "ami-02be0ef8447edb43e"
    ap-southeast-3 = "ami-068ba85d1fa328916"
    ap-south-1     = "ami-05ba002f63a1766d3"
    ap-northeast-3 = "ami-07174a037bf829c0c"
    ap-northeast-2 = "ami-0e12f8836f40e8b3e"
    ap-southeast-1 = "ami-06dee2ed266b9cf09"
    ap-southeast-2 = "ami-0ea305a185f601084"
    ap-northeast-1 = "ami-0f507a2fdcdacd65d"
    ca-central-1   = "ami-0023a316c322bddae"
    eu-central-1   = "ami-0c2627a529b12b091"
    eu-west-1      = "ami-0788ecffa9d575080"
    eu-west-2      = "ami-09310a84e790cc655"
    eu-south-1     = "ami-0a52973d2d3c48130"
    eu-west-3      = "ami-04f09fc1ddc84c818"
    eu-north-1     = "ami-01a6be2c952f7ac23"
    me-south-1     = "ami-0f2d1a2615e27b2e7"
    sa-east-1      = "ami-008d212dd6df8933c"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 7.0.5
variable "fgtvmbyolami" {
  type = map(any)
  default = {
    us-east-1      = "ami-032243089115c1b41"
    us-east-2      = "ami-0cdd1e37a58060fb2"
    us-west-1      = "ami-0c186535bfe65e6a9"
    us-west-2      = "ami-00f2435b18a726cb3"
    af-south-1     = "ami-0b5e8f16375316cb4"
    ap-east-1      = "ami-0dc7049dd8a89b636"
    ap-southeast-3 = "ami-02ff5d3364918898f"
    ap-south-1     = "ami-03b839ccc4c60c4a8"
    ap-northeast-3 = "ami-0f8b2411b91fafcb5"
    ap-northeast-2 = "ami-057b40cc79c1578ca"
    ap-southeast-1 = "ami-05327079c9dffad9a"
    ap-southeast-2 = "ami-0e5fa71b70b18b75e"
    ap-northeast-1 = "ami-0658131c7742f44df"
    ca-central-1   = "ami-01ebba0e8198224e3"
    eu-central-1   = "ami-0f44d2b3c1fb0bfd1"
    eu-west-1      = "ami-0c2293c1c0708af3d"
    eu-west-2      = "ami-006c8985b117c010f"
    eu-south-1     = "ami-0ceca56dd744d9a15"
    eu-west-3      = "ami-0312f6fac3eb9ac02"
    eu-north-1     = "ami-0f447d0d4bf789557"
    me-south-1     = "ami-0e306d1aa0d47cb0d"
    sa-east-1      = "ami-0b2633f80602f6e0d"
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
