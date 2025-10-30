// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

//x86
//BYOL 7.4.9:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.9 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.9 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.9 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.9 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.9 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.4.9:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.9 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.9 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.9 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.9 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.9 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq" //x86 4 cores
}

//x86
//BYOL 7.4.9:  ocid1.image.oc1..aaaaaaaa3jzlu266v4duvkvu4l5lziu3rhpfyjj2vofbpptswmkog3nccehq
//PAYG 7.4.9 2ocpu: ocid1.image.oc1..aaaaaaaaqla3waj3lpy6xirop5vivep35d66sqpqstjtrt5diff3cydonmja 
//PAYG 7.4.9 4ocup: ocid1.image.oc1..aaaaaaaal2h75734ckxmq5z5vgjbmznqk2ujagpuhdvia6slfsbhldvhakha 
//PAYG 7.4.9 8ocup: ocid1.image.oc1..aaaaaaaa5dbwvlsosqwoizum5ofm5uvnzvpsmkppy4xsoovchkyihaqo243a 
//PAYG 7.4.9 16ocup: ocid1.image.oc1..aaaaaaaa4bto4gkyr3ih4tugcgulr4kilbupvvs6iowohycrgi3nwzinxp2a 
//PAYG 7.4.9 24ocup: ocid1.image.oc1..aaaaaaaayacizfybvrkzix3znb54bblrgmg3eyx6njaugswcrym56yrebena
//ARM
//BYOL 7.4.9:  ocid1.image.oc1..aaaaaaaadjbuji7ltjrimr3d5yfavmugkdpmex2nh7wxpvdq7mvivfmtrjtq
//PAYG 7.4.9 2ocpu:  ocid1.image.oc1..aaaaaaaarf677hv6jv5hgzjmdpz6dzowrv6tlyh3db2cz7fnwnwcm4cawcya
//PAYG 7.4.9 4ocup:  ocid1.image.oc1..aaaaaaaawwp3frc6xkoqm6tureogq6annnoegv2vorrk46mlncmv2ymjvoua
//PAYG 7.4.9 8ocup:  ocid1.image.oc1..aaaaaaaaa7uyew2zzfo3ttfcfxr26eugwkmxvjuttxg2rbbdbx7keclq57ra
//PAYG 7.4.9 16ocup:  ocid1.image.oc1..aaaaaaaawrajcygnfwzjo2hfcjrhbnxkzasozmstvyutkyc5xo3skwgncu2q
//PAYG 7.4.9 24ocup:  cid1.image.oc1..aaaaaaaaxwtqpse6c44nrumc4pgvmleqaqeggpov6nhunasnd5qrgiekz63q

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaal2h75734ckxmq5z5vgjbmznqk2ujagpuhdvia6slfsbhldvhakha" //x86 payg 4 cores
}

// Version
// x64 - 7.4.9_(_X64_)
// ARM - 7.4.9_(_ARM64_)
variable "mp_listing_resource_version" {
  default = "7.4.9_(_X64_)"
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
