// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

# FOS 8.0.2
# BYOL
#X64: ocid1.image.oc1..aaaaaaaaoapaaxm2ffo5jirk6d46et7fcotghvj3royqozia32fn7m72enha
#ARM64: ocid1.image.oc1..aaaaaaaatkpizouts3h25us7e6f5phnuby4sdpjzxfj5y3azmppi65k2xb7a
#PAYG 2OCPU
#X64: ocid1.image.oc1..aaaaaaaaxmsln56cd6anqiez3asdslvlbwkzqjt5schf3aupo7vvyfwvdruq
#ARM64: ocid1.image.oc1..aaaaaaaadzk4sc6bnppei7m62eqcxttgadugast3zbqhpdvq3z25wy3n53tq
#PAYG 4OCPU
#X64: ocid1.image.oc1..aaaaaaaajgbaawq3dhcz63rnz7q4u5di2nlnzbyun3hdw3wxlmkhdrqwse5q
#ARM64: ocid1.image.oc1..aaaaaaaat6j7zukj5xqya5rxrqpvy7u2s6orfiuhd6fl3qrtnb354lwstd3q
#PAYG 8OCPU
#X64: ocid1.image.oc1..aaaaaaaa5tbtkqtqd25amgtvimhgiummllfkfcmaohyibu4n4pz45cyevp4a
#ARM64: ocid1.image.oc1..aaaaaaaasvnnkxhhk4u5nbjuhkm5amotpiahk4tkujb67xdbb3wb4mc46orq
#PAYG 16OCPU
#X64: ocid1.image.oc1..aaaaaaaa2vihwodk53lsjzwugaq7ew6xoodfuqrrpgnyybwftjn2d4qqhpda
#ARM64: ocid1.image.oc1..aaaaaaaa2q5lt574wokbeupjuzovg6j63ql2d4ixc3y6jn57xoglywi57hzq
#PAYG 24OCPU
#X64: ocid1.image.oc1..aaaaaaaakibjlm3btsxgj2yoocjankn5oqsdzfwbr6ybtwvtdnbj7e7eslnq
#ARM64: ocid1.image.oc1..aaaaaaaakl7oxz6y5jxbjt3uxlyxfgdt4rwe26yfszrm4ichikdgr7imimiq

// Image
variable "oci_image" {
  default = "ocid1.image.oc1..aaaaaaaa5tbtkqtqd25amgtvimhgiummllfkfcmaohyibu4n4pz45cyevp4a"
  //   default = "ocid1.image.oc1..aaaaaaaasvnnkxhhk4u5nbjuhkm5amotpiahk4tkujb67xdbb3wb4mc46orq"
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
  type    = string
  default = "VM.Standard.E5.Flex" //x86
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
