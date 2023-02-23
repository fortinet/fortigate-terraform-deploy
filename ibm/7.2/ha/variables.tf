variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

// IBM Regions
variable "region" {
  type    = string
  default = "ca-tor"
}
// IBM availability zones
variable "zone1" {
  type    = string
  default = "ca-tor-1"
}

// IBM region map for FortiOS
variable "ibmregion" {
  type = map(string)
  default = {
    "us-south" = "dallas-private"
    "us-east"  = "washington-dc-private"
    "ca-tor"   = "toronto-private"
    "br-sao"   = "sao-paolo-private"
    "eu-gb"    = "london-private"
    "eu-de"    = "frankfurt-private"
    "au-syd"   = "sydney-private"
    "jp-tok"   = "tokyo-private"
    "jp-osa"   = "osaka-private"
  }
}

// VPC address prefix
variable "vpcprefix" {
  type    = string
  default = "10.250.0.0/16"
}

variable "subnet1prefix" {
  type    = string
  default = "10.250.1.0/24"
}

variable "subnet2prefix" {
  type    = string
  default = "10.250.2.0/24"
}

variable "subnet3prefix" {
  type    = string
  default = "10.250.3.0/24"
}

variable "subnet4prefix" {
  type    = string
  default = "10.250.4.0/24"
}

variable "fgtaport1" {
  type    = string
  default = "10.250.1.5"
}

variable "fgtaport1mask" {
  type    = string
  default = "255.255.255.0"
}

variable "fgtaport2" {
  type    = string
  default = "10.250.2.5"
}

variable "fgtaport2mask" {
  type    = string
  default = "255.255.255.0"
}

variable "fgtaport3" {
  type    = string
  default = "10.250.3.5"
}

variable "fgtaport3mask" {
  type    = string
  default = "255.255.255.0"
}

variable "fgtaport4" {
  type    = string
  default = "10.250.4.5"
}

variable "fgtaport4mask" {
  type    = string
  default = "255.255.255.0"
}

variable "fgtbport1" {
  type    = string
  default = "10.250.1.6"
}

variable "fgtbport1mask" {
  type    = string
  default = "255.255.255.0"
}

variable "fgtbport2" {
  type    = string
  default = "10.250.2.6"
}

variable "fgtbport2mask" {
  type    = string
  default = "255.255.255.0"
}

variable "fgtbport3" {
  type    = string
  default = "10.250.3.6"
}

variable "fgtbport3mask" {
  type    = string
  default = "255.255.255.0"
}

variable "fgtbport4" {
  type    = string
  default = "10.250.4.6"
}

variable "fgtbport4mask" {
  type    = string
  default = "255.255.255.0"
}

variable "fgtaport1gateway" {
  default = "10.250.1.1"
}

variable "fgtaport2gateway" {
  default = "10.250.2.1"
}

variable "fgtaport4gateway" {
  default = "20.250.4.1"
}

variable "fgtbport1gateway" {
  default = "10.250.1.1"
}

variable "fgtbport2gateway" {
  default = "10.250.2.1"
}

variable "fgtbport4gateway" {
  default = "10.250.4.1"
}

// FortiOS Custom Image ID
variable "image" {
  default = "cos://us-geo/fortinet/fortigate_byol_724_b1396_GA.qcow2"
}

// IBM Cloud instance profile
// https://cloud.ibm.com/docs/vpc?topic=vpc-profiles
variable "profile" {
  default = "cx2-2x4"
}

// Bootstrap configuration file
variable "bootstrap" {
  type    = string
  default = "config.conf"
}

// License file for the FortiGate
variable "license" {
  type    = string
  default = "license.lic"
}

// License file for the FortiGate
variable "license2" {
  type    = string
  default = "license2.lic"
}
