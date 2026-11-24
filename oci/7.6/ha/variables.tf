// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

# FOS 7.6.8
#BYOL
#X64: ocid1.image.oc1..aaaaaaaamtrufkrf7yhgsifrqo7y4up4ykflpkpcritrkkzqskw45xb6vrjq
#ARM64: ocid1.image.oc1..aaaaaaaajpd57rn7rx47njtvfq5w66a6nhphcnkao6kwjrrvjijzhl7ewt7a
#
#2core
#X64: ocid1.image.oc1..aaaaaaaamfot32duqte26brev6gnvunfbgrbw2evpxakybrizzv22gn4cyoa
#ARM64: ocid1.image.oc1..aaaaaaaaloa6qnlymyxeryitknvvtoulixg74vwo2njtar4yyaahh6fcjh7a
#
#4core
#X64: ocid1.image.oc1..aaaaaaaa7ydsfl4lldptmmrijcrlkeeh3763vvvb3smllmitzujwl6qnnvca
#ARM64: ocid1.image.oc1..aaaaaaaazbwwzcscfvaup4s4753mpu3uzsswetzph52w36xgio4zsspuoskq
#
#8core
#X64: ocid1.image.oc1..aaaaaaaawuvbxcvi3bvcaf7o3isylr75si5iwhox4srww2hiya5iiq26ao7a
#ARM64: ocid1.image.oc1..aaaaaaaauu2ymazyw6tt2i6b7nuq6cfpylqqg6t76xswdqqrurqjad7lr5gq
#
#16core
#X64: ocid1.image.oc1..aaaaaaaam3qaruomdi2bi33unzwueegtlqwvyhchwnfjju7xcigrblrdenca
#ARM64: ocid1.image.oc1..aaaaaaaacmrb7birdioeovl46aujigz3q6updsbgpptzldsvfn3mvbxxeypq
#
#24core
#X64: ocid1.image.oc1..aaaaaaaa4uvpfxpv2aoq2qy7ygifbhscw2xebi7oqozdlesli263p6prtrfq
#ARM64: ocid1.image.oc1..aaaaaaaahqd5ggeiwijkwe4vmkfdvzf2ataldi3y22pgrsfayhc4un6dlt6q

// Image
variable "oci_image" {
//     default = "ocid1.image.oc1..aaaaaaaa7ydsfl4lldptmmrijcrlkeeh3763vvvb3smllmitzujwl6qnnvca"
   default = "ocid1.image.oc1..aaaaaaaazbwwzcscfvaup4s4753mpu3uzsswetzph52w36xgio4zsspuoskq"
}

// Cert use for SDN Connector setting
variable "cert" {
  type    = string
  default = "Fortinet_Factory"
}

// Environment configuration
variable "vcn_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "mgmt_subnet_cidr" {
  type    = string
  default = "10.1.0.0/24"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.1.1.0/24"
}

variable "trust_subnet_cidr" {
  type    = string
  default = "10.1.2.0/24"
}

variable "hasync_subnet_cidr" {
  type    = string
  default = "10.1.3.0/24"
}

// private ip for active fgt on mgmt subnet
variable "mgmt_private_ip_active" {
  type    = string
  default = "10.1.0.3"
}

// private ip for passive fgt on mgmt subnet
variable "mgmt_private_ip_passive" {
  type    = string
  default = "10.1.0.4"
}

// private ip for active fgt for public subnet
variable "public_private_ip_active" {
  type    = string
  default = "10.1.1.3"
}

// private ip for acitve fgt's secondary ip, this is use for floating for failover
variable "public_private_ip_floating" {
  type    = string
  default = "10.1.1.4"
}

// private ip for passive fgt on public subnet
variable "public_private_ip_passive" {
  type    = string
  default = "10.1.1.5"
}

// private ip for active fgt on trust subnet
variable "trust_private_ip_active" {
  type    = string
  default = "10.1.2.3"
}

// private ip for active fgt's secondary ip on trust subnet for floating
variable "trust_private_ip_floating" {
  type    = string
  default = "10.1.2.4"
}

// private ip for passive fgt's primary ip on trust subnet
variable "trust_private_ip_passive" {
  type    = string
  default = "10.1.2.5"
}

// private ip for active fgt on hbdev
variable "hasync_private_ip_active" {
  type    = string
  default = "10.1.3.3"
}

// private ip for passive fgt on hbdev
variable "hasync_private_ip_passive" {
  type    = string
  default = "10.1.3.4"
}

// netmask for the subnets
variable "mgmt_private_mask" {
  type    = string
  default = "255.255.255.0"
}

variable "public_private_mask" {
  type    = string
  default = "255.255.255.0"
}

variable "trust_private_mask" {
  type    = string
  default = "255.255.255.0"
}

variable "hasync_private_mask" {
  type    = string
  default = "255.255.255.0"
}

// instance shape
// "VM.Standard.E5.Flex" //x86
// "VM.Standard.A1.Flex" //arm
variable "instance_shape" {
  type    = string
  //default = "VM.Standard.E5.Flex" //x86
  default = "VM.Standard.A1.Flex" //arm
}

// instance cpu
variable "instance_cpu" {
  type    = string
  default = "4"
  //  default = "8"
}

// instance memory
variable "instance_memory" {
  type    = string
  default = "4"
  //  default = "8"
}

# Choose an Availability Domain (1,2,3)
variable "availability_domain" {
  type    = string
  default = "1"
}

variable "volume_size" {
  type    = string
  default = "50" //GB; you can modify this, can't less than 50
}

// Bootstrap for the active fgt
variable "bootstrap-active" {
  // Change to your own path
  type    = string
  default = "config-active.conf"
}

// Bootstrap for the passive fgt
variable "bootstrap-passive" {
  // Change to your own path
  type    = string
  default = "config-passive.conf"
}

// license file for the active fgt
variable "license" {
  // Change to your own path
  type    = string
  default = "license.lic"
}

// license file for the passive fgt
variable "license2" {
  // Change to your own path
  type    = string
  default = "license2.lic"
}
