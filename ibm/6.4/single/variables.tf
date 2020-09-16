variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

// IBM Regions
variable "region" {
  type    = string
  default = "us-south"
}
// IBM availability zones
variable "zone1" {
  type    = string
  default = "us-south-1"
}

// Total number of IPV4 addresses for each subnet
variable "subnetipv4count" {
  type    = string
  default = 256
}

// FortiOS Custom Image ID
// https://docs.fortinet.com/vm/ibm/fortigate/6.4/ibm-cloud-cookbook/6.4.2/992669/deploying-fortigate-vm-on-ibm-cloud
variable "image" {
  default = "r006-4a3919d2-3cb8-4039-92fc-9660e838ba71"
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
