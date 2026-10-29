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
    "au-syd"   = "au-syd.private"
    "br-sao"   = "br-sao.private"
    "ca-mon"   = "ca-mon.private"
    "ca-tor"   = "ca-tor.private"
    "eu-de"    = "eu-de.private"
    "eu-es"    = "eu-es.private"
    "eu-gb"    = "eu-gb.private"
    "in-che"   = "in-che.private"
    "in-mum"   = "in-mum.private"
    "jp-tok"   = "jp-tok.private"
    "jp-osa"   = "jp-osa.private"
    "us-east"  = "us-east.private"
    "us-south" = "us-south.private"
  }
}

// Use PAR for ingress internet route
// Either true or false
//
variable "par" {
  type    = bool
  default = "true"
}

// PAR address count
//
variable "par_address" {
  type    = string
  default = "2"
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
  default = "cos://us-geo/fortinet/fortigate_byol_802_b0251_ga.qcow2"
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
