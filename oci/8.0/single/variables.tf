// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

//BYOL  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//2 OCPU   ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//4 core ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//8 OCPU   ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//16 OCPU   ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//24 core ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba" //
}


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
variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaaxmsln56cd6anqiez3asdslvlbwkzqjt5schf3aupo7vvyfwvdruq" //x86
  //default = "ocid1.image.oc1..aaaaaaaadzk4sc6bnppei7m62eqcxttgadugast3zbqhpdvq3z25wy3n53tq"   //arm
}

// Version
variable "mp_listing_resource_version" {
  default = "8.0.2_(_X64_)"
  //default = "8.0.2_(_ARM64_)"
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
