// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

variable "mp_listing_id" {
  //default = "ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba" //x86 2cores
  //     default = "ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa" //x86 24 cores
  //     default = "ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q" //x86 8 cores
  default = "ocid1.appcataloglisting.oc1..aaaaaaaa6d5wbjlrlihw7l33nvdso74lv2s66snabevr33awotpgjownggiq" //x86 4 cores
  //     default = "ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q" //byol x86
}

variable "mp_listing_resource_id" {
  //    default = "ocid1.image.oc1..aaaaaaaavuhxpr5aszekp3ky6h4cm7at4hu67ibewp2adsdbmaut7ir5n2gq" //x86 byol
  //    default = "ocid1.image.oc1..aaaaaaaaoyfxijszlxjmwra5typ4rl3rhlmxiagwgi5zg62bpl6ozp6dtida" //x86 payg 24 cores
  //    default = "ocid1.image.oc1..aaaaaaaacxjbje3eidohvy6xep4qnbkgwyp4ymdiwdsetwwaui5u6d3pon5q" //x86 payg 8 cores
  default = "ocid1.image.oc1..aaaaaaaanpziqsvtarsq6s7xp4r54i67dyuoha7yx224qeyh5aqceqgez47a" //x86 payg 4 cores
  //default = "ocid1.image.oc1..aaaaaaaalde5qyzwbmwvvdcnwh5eu4xjdicchd355qm6glzfwdxna634ir7q" //x86 payg 2 cores
}

// Version
variable "mp_listing_resource_version" {
  default = "7.4.0_(_X64_)"
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

variable "hasync_subnet_cidr_ad2" {
  type    = string
  default = "10.1.13.0/24"
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


// private ip for active fgt on hbdev
variable "hasync_private_ip_active" {
  type    = string
  default = "10.1.3.3"
}

// private ip for passive fgt on hbdev
variable "hasync_private_ip_passive" {
  type    = string
  default = "10.1.13.4"
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

// instance shape
variable "instance_shape" {
  type    = string
  default = "VM.Standard.E4.Flex" //x86
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
