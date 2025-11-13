// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

//x86
//BYOL 7.0.17:byol: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.0.17 2ocpu  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.0.17 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.0.17 8ocup  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.0.17 16ocup:  ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.0.17 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq"
}


//x86
//BYOL 7.0.17:byol:  ocid1.image.oc1..aaaaaaaaf6midpco2fwyamddruayonhavc6evwqbvpn5qapgtitn7ux4aofa
//PAYG 7.0.17 2ocpu: ocid1.image.oc1..aaaaaaaalpddbyumhik2gjtptjk7aocu7kjbmbgezvvl4vc5gmrqamrvoexq
//PAYG 7.0.17 4ocup: ocid1.image.oc1..aaaaaaaaihvuug2a32izrwzkiydjt3u5ujpciq73in7qqqr2zp6zqudrh3ha
//PAYG 7.0.17 8ocup: ocid1.image.oc1..aaaaaaaadpvtxoh4gl34yiedmg7azwbk6abg4wthu52kpulkhd2xoszlgh7q
//PAYG 7.0.17 16ocup:  ocid1.image.oc1..aaaaaaaalvdqrdcy55qml23ggm4zenatkrrvawxjdpmwxq5jjypb5o7aa3na
//PAYG 7.0.17 24ocup:  ocid1.image.oc1..aaaaaaaaf7yshp6b4cgzji5xkwmo3l4n36mblk6dtf2ietnoenhfmi6beppq

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaaihvuug2a32izrwzkiydjt3u5ujpciq73in7qqqr2zp6zqudrh3ha"
}

// Version
variable "mp_listing_resource_version" {
  default = "7.0.17_(_X64_)"
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

variable "instance_shape" {
  type    = string
  default = "VM.Standard2.4"
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
