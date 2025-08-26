// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

// 7.6.4 has no arm build
//x86
//BYOL 7.6.4:byol: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.6.4 2ocpu  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.6.4 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.6.4 8ocup  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.6.4 16ocup:  ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.6.4 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq"
}

//x86
//BYOL 7.6.4:byol:  ocid1.image.oc1..aaaaaaaa6sh4hz4ziatjmda262htabajhihetqgli22mnfyksxjly7gy26gq
//PAYG 7.6.4 2ocpu: ocid1.image.oc1..aaaaaaaawynwkn2pks4wjebr65ctxdfl6l6sqym3hvkij4s45ayot4jzzxuq
//PAYG 7.6.4 4ocup: ocid1.image.oc1..aaaaaaaa6qqlsuqbpezqqzlrldld4hfhjjw7lkedfwhtmnx4lp2q7tptytaa
//PAYG 7.6.4 8ocup:  ocid1.image.oc1..aaaaaaaa253cvjattvnzdkpok4jaur7ujtl7savbtqstzb6mdfrts6tebswq
//PAYG 7.6.4 16ocup:  ocid1.image.oc1..aaaaaaaanrwk6ajdmtedmw6vlkslhnxnd7qwzarbd2rslruhi5p4jzerwdda
//PAYG 7.6.4 24ocup:  ocid1.image.oc1..aaaaaaaaa3xulwhsdlgmvm7eroihoovqtmulatqsnqul4ljjtkhdhmqdjt6q

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaa6qqlsuqbpezqqzlrldld4hfhjjw7lkedfwhtmnx4lp2q7tptytaa"
}

// Version
// everythign is 7.6.4_(_X64_)
variable "mp_listing_resource_version" {
  default = "7.6.4_(_X64_)"
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

variable "x86" {
  type    = bool
  default = true
}

// instance shape
// "VM.Standard.E4.Flex" //x86
// "VM.Standard.A1.Flex" //arm
variable "instance_shape" {
  type    = string
  default = "VM.Standard.E4.Flex" //x86
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
