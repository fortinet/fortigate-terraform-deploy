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

// Total number of IPV4 addresses for each subnet
variable "subnetipv4count" {
  type    = string
  default = 256
}

// FortiOS Custom Image ID
// https://docs.fortinet.com/vm/ibm/fortigate/6.4/ibm-cloud-cookbook/6.4.2/992669/deploying-fortigate-vm-on-ibm-cloud
variable "image" {
  default = "cos://us-geo/fortinet/fortigate_byol_763_b3510_GA.qcow2"
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
