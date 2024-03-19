// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

// instance cpu
variable "instance_cpu" {
  type    = string
  default = "4"
}

// instance memory
variable "instance_memory" {
  type    = string
  default = "8"
}

/x86
//BYOL 7.4.3: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.3 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.3 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.3 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.3 16ocup:  ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.3 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.4.3: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.3 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.3 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.3 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.3 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.3 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq" //x86 4 cores
}

//x86
//BYOL 7.4.3:  ocid1.image.oc1..aaaaaaaaq57pywudjr5yogjtl6qf3zs3yrwv66b5ooeiqykjgnneuerhfnia
//PAYG 7.4.3 2ocpu:  ocid1.image.oc1..aaaaaaaaar3ixywupg2osmaaqxhknw4y7vqe3mc565nh45zo6zy5nb5dbaxa
//PAYG 7.4.3 4ocup: ocid1.image.oc1..aaaaaaaafxpuqixoz4oifanzdpzjn3kpap4i6zmr3vz2ykevxefe34hvkoqq
//PAYG 7.4.3 8ocup: ocid1.image.oc1..aaaaaaaaytxx2luau4rukn6forinnagzjdddqxe3abaafukrnxwxsab2edxq
//PAYG 7.4.3 16ocup: ocid1.image.oc1..aaaaaaaapppoue5tmnc4nq56p5mttcikrp37oy2nvsreshd4f5f3vdzooxuq
//PAYG 7.4.3 24ocup: ocid1.image.oc1..aaaaaaaavszdkeekbvamoelfuxdokzqn7rxbzjmmxjwi26uhnae3voozpggq
//ARM
//BYOL 7.4.3:  ocid1.image.oc1..aaaaaaaa232uwkhl5d6tvjk63uchznv7rrjnzonql6m4ynf6nqmskuujx5iq
//PAYG 7.4.3 2ocpu:  ocid1.image.oc1..aaaaaaaaj6gb4m6tim4lf3gv4zdusu7hjwb25hka2kb7ich4hdfe4kabxv7q
//PAYG 7.4.3 4ocup:  ocid1.image.oc1..aaaaaaaarwt2hkj5o24fngjambnt3r72dan67jyppn6pgylgscmtg5rw6aaa
//PAYG 7.4.3 8ocup: ocid1.image.oc1..aaaaaaaaewhsoyjl4qrd7667kmzuqfjpteyvmchfjrbrbdwg2kvdcxkdn4wq
//PAYG 7.4.3 16ocup:  ocid1.image.oc1..aaaaaaaamdyng4uicaektz24wkbqf6i4ot2evudxtr2u4lovayoxv63icdfq
//PAYG 7.4.3 24ocup: ocid1.image.oc1..aaaaaaaasp3wjkouan4ohe2y5wxk6hu5yn6kfkvzd72ujxlmlozo32glp6la

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaafxpuqixoz4oifanzdpzjn3kpap4i6zmr3vz2ykevxefe34hvkoqq" //x86 payg 4 cores
}

// Version
// either - "7.4.3_(_ARM64_)" or "7.4.3_(X64)"
//
variable "mp_listing_resource_version" {
  default = "7.4.3_(X64)"
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

variable "mgmt_subnet_cidr_ad2" {
  type    = string
  default = "10.1.10.0/24"
}

variable "public_subnet_cidr_ad2" {
  type    = string
  default = "10.1.11.0/24"
}

variable "trust_subnet_cidr_ad2" {
  type    = string
  default = "10.1.12.0/24"
}

// private ip for active fgt on mgmt subnet
variable "mgmt_private_ip_active" {
  type    = string
  default = "10.1.0.3"
}

// private ip for passive fgt on mgmt subnet
variable "mgmt_private_ip_passive" {
  type    = string
  default = "10.1.10.4"
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
  default = "10.1.11.5"
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
  default = "10.1.12.5"
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

# Choose an Availability Domain (1,2,3)
variable "availability_domain" {
  type    = string
  default = "1"
}

variable "availability_domain2" {
  type    = string
  default = "2"
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
