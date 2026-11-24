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
     default = "ocid1.image.oc1..aaaaaaaamfot32duqte26brev6gnvunfbgrbw2evpxakybrizzv22gn4cyoa"
//   default = "ocid1.image.oc1..aaaaaaaagwsaopxxs7mpq7oujzrc4kyn5cje3dnpwj3625zxng5m2zx33hiq"
}

// Environment configuration
variable "vcn_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.1.0.0/24"
}

variable "trust_subnet_cidr" {
  type    = string
  default = "10.1.1.0/24"
}

variable "trust_private_ip_primary" {
  type    = string
  default = "10.1.1.3"
}

variable "trust_private_mask" {
  type    = string
  default = "255.255.255.0"
}

// instance shape
// "VM.Standard.E5.Flex" //x86
// "VM.Standard.A1.Flex" //arm
variable "instance_shape" {
  type = string
  //  default = "VM.Standard.E5.Flex" //x86
  default = "VM.Standard.A1.Flex" //arm
}

// instance cpu
variable "instance_cpu" {
  type    = string
  default = "4"
}

// instance memory
variable "instance_memory" {
  type    = string
  default = "4"
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
