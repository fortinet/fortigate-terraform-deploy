# GCP region
variable "region" {
  type    = string
  default = "us-central1" #Default Region
}
# GCP zone
variable "zone" {
  type    = string
  default = "us-central1-c" #Default Zone
}
# GCP project name
variable "project" {
  type    = string
  default = "your gcp project"
}
# GCP oauth access token
variable "token" {
  type    = string
  default = "<gcp oauth access token>"
}
# FortiGate Image name
# 6.2.5 payg is projects/fortigcp-project-001/global/images/fortinet-fgtondemand-625-20200831-001-w-license
# 6.2.5 byol is projects/fortigcp-project-001/global/images/fortinet-fgt-625-20200831-001-w-license
variable "image" {
  type    = string
  default = "projects/fortigcp-project-001/global/images/fortinet-fgtondemand-625-20200831-001-w-license"
}
# GCP instance machine type
variable "machine" {
  type    = string
  default = "n1-standard-4"
}
# VPC CIDR
variable "vpc_cidr" {
  type    = string
  default = "172.16.0.0/16"
}
# Public Subnet CIDR
variable "public_subnet" {
  type    = string
  default = "172.16.0.0/24"
}
# Private Subnet CIDR
variable "protected_subnet" {
  type    = string
  default = "172.16.1.0/24"
}
# HA Subnet CIDR
variable "ha_subnet" {
  type    = string
  default = "172.16.2.0/24"
}
# MGMT Subnet CIDR
variable "mgmt_subnet" {
  type    = string
  default = "172.16.3.0/24"
}
# license file for master
variable "licenseFile" {
  type    = string
  default = "license1.lic"
}
# license file for slave
variable "licenseFile2" {
  type    = string
  default = "license2.lic"
}

# hamgmt gateway ip, depends on your mgmt subnet cidr
variable "mgmt_gateway" {
  type    = string
  default = "172.16.3.1"
}
variable "mgmt_mask" {
  type    = string
  default = "255.255.255.0"
}

# master interface ip assignments
# master ext
variable "master_port1_ip" {
  type    = string
  default = "172.16.0.2"
}
variable "master_port1_mask" {
  type    = string
  default = "32"
}
# master int
variable "master_port2_ip" {
  type    = string
  default = "172.16.1.2"
}
variable "master_port2_mask" {
  type    = string
  default = "32"
}
# master sync
variable "master_port3_ip" {
  type    = string
  default = "172.16.2.2"
}
variable "master_port3_mask" {
  type    = string
  default = "24"
}
# master hamgmt
variable "master_port4_ip" {
  type    = string
  default = "172.16.3.2"
}
variable "master_port4_mask" {
  type    = string
  default = "24"
}


# slave sync interface ip assignments
#slave ext
variable "slave_port1_ip" {
  type    = string
  default = "172.16.0.3"
}
variable "slave_port1_mask" {
  type    = string
  default = "32"
}

# slave int
variable "slave_port2_ip" {
  type    = string
  default = "172.16.1.3"
}
variable "slave_port2_mask" {
  type    = string
  default = "32"
}


# slave sync
variable "slave_port3_ip" {
  type    = string
  default = "172.16.2.3"
}
variable "slave_port3_mask" {
  type    = string
  default = "24"
}


# slave hamgmt
variable "slave_port4_ip" {
  type    = string
  default = "172.16.3.3"
}
variable "slave_port4_mask" {
  type    = string
  default = "24"
}


