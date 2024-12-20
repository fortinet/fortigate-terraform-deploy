// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

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
  default = "2"
}

// instance memory
variable "instance_memory" {
  type    = string
  default = "2"
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
