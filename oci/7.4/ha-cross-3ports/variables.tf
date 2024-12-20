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

//x86
//BYOL 7.4.6: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q 
//PAYG 7.4.6 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.6 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.6 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.6 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.6 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.4.6: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q 
//PAYG 7.4.6 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.6 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.6 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.6 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.6 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq" //x86 4 cores
}

//x86
//BYOL 7.4.6: ocid1.image.oc1..aaaaaaaarek6z7oszhvr6hur27ue2oakqpc6imp34eezakb33vrtyxkavt4q
//PAYG 7.4.6 2ocpu: ocid1.image.oc1..aaaaaaaaeyyhcmlf2fbt2wdbyobhebwguy2zzaox6tghscyco5vgnxp75tnq 
//PAYG 7.4.6 4ocup: ocid1.image.oc1..aaaaaaaacvsilpxrbtyrnaw2qxy2yhouorf3v7etdacyx6slywkgmnalmxpa
//PAYG 7.4.6 8ocup: ocid1.image.oc1..aaaaaaaafljvjh7homsgsw5ezyvqvth7mgwren77w2he7qori6tjsmhnbxxq
//PAYG 7.4.6 16ocup: ocid1.image.oc1..aaaaaaaa4ia3qv6u7ciw42mrrpbisiul4lno7nzgb3bgwofrmhhereg4yrca
//PAYG 7.4.6 24ocup: ocid1.image.oc1..aaaaaaaaqp4a6pnr7zkn3aprd6ky3gii3hw4ys47xmjg6zqspmniziyzvsna
//ARM
//BYOL 7.4.6:  ocid1.image.oc1..aaaaaaaav2xhiv46cjchtazwivlywtejrgikyknndnfrsxdum25p5zg6rjuq
//PAYG 7.4.6 2ocpu:  ocid1.image.oc1..aaaaaaaapnkx52rikkwk6m5d4r2uhaqt7uwqm32yfexonhlropnv244z3xga
//PAYG 7.4.6 4ocup:  ocid1.image.oc1..aaaaaaaag4ap5r75vprra5xvwkiruwo3lbhy2tmtbzp5h4mqylsalk4tegvq
//PAYG 7.4.6 8ocup:  ocid1.image.oc1..aaaaaaaak3sgznogu4hskdp3eazmbyxtazcahjv4witfrqybnh7nks745a7q
//PAYG 7.4.6 16ocup:  ocid1.image.oc1..aaaaaaaaovwh3dcp3po6nyialg2prcyngzkhunwikgdooxatoarw2ft24tga
//PAYG 7.4.6 24ocup:  ocid1.image.oc1..aaaaaaaay3t3wx34njceip3tlujlu5m53pxf74bjzinaj24fn2mrwyij4otq

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaacvsilpxrbtyrnaw2qxy2yhouorf3v7etdacyx6slywkgmnalmxpa" //x86 payg 4 cores
}

// Version
// x64 - 7.4.6_(_X64_)
// ARM - 7.4.6_(_ARM64_)
variable "mp_listing_resource_version" {
  default = "7.4.6_(_X64_)"
}

// instance shape
// "VM.Standard.E4.Flex" //x86
// "VM.Standard.A1.Flex" //arm
variable "instance_shape" {
  type    = string
  default = "VM.Standard.E4.Flex" //x86
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
