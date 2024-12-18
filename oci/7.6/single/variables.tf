// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

//x86
//BYOL 7.6.1:byol:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.6.1 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.6.1 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.6.1 8ocup  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.6.1 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.6.1 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.6.1: byol: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.6.1 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.6.1 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.6.1 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.6.1 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.6.1 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq"
}


//x86
//BYOL 7.6.1:byol:  ocid1.image.oc1..aaaaaaaa7jlxn7rfwtdzcg3uuc3p2zl2oc5raybki6msmwuxtgxqgxblntpa
//PAYG 7.6.1 2ocpu: ocid1.image.oc1..aaaaaaaauuhtdjcrhpa7mcrcqvmenx5ktap45xg7f72mwayoikshysant6la
//PAYG 7.6.1 4ocup: ocid1.image.oc1..aaaaaaaapl4lledlyfxjyrv7owj5ggzjp3bend57fouk4meq4itlqoqb37nq
//PAYG 7.6.1 8ocup: ocid1.image.oc1..aaaaaaaaxldxntymn6jc26vdxdf47mxe7g5th3orfj2v63zjyyjczwsvu34q
//PAYG 7.6.1 16ocup: ocid1.image.oc1..aaaaaaaaelmsvyonvqcwdzxl42htkyc5fmzfafb3qc5nhb3cotm62t5uxxdq
//PAYG 7.6.1 24ocup: ocid1.image.oc1..aaaaaaaao5g35a4qmpqlc2eut5zozi2l7po7maqfghn2a63lrrilt2xr4ajq
//ARM
//BYOL 7.6.1:byol ocid1.image.oc1..aaaaaaaaidtngxgub37fdju52552hqlhshncg4uszz6drifwsv5uc5f57f4q
//PAYG 7.6.1 2ocpu:ocid1.image.oc1..aaaaaaaamnxjjeamzi2qcie34nbisdxzjr6jau2bbti3bixgby5mb3aeyrfq
//PAYG 7.6.1 4ocup: ocid1.image.oc1..aaaaaaaalqqpp5i3wzfemccx54bwzflhbs7cfezlbk4joenibfxmuxdmnh2q
//PAYG 7.6.1 8ocup: ocid1.image.oc1..aaaaaaaaagzyw34ffc7tl5k36tycz4v23u7tvemwkger56ubhdmz53osh3ga
//PAYG 7.6.1 16ocup: ocid1.image.oc1..aaaaaaaah5ook4zsdssxz3ed3xj3d3d2idexkwgcjweax7dzyt2e7ylth4ea
//PAYG 7.6.1 24ocup: ocid1.image.oc1..aaaaaaaas4duchs2dxtw5vqrh6xrq2p34zqg7sdrdlozxynpjasoq3c3ppwa

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaapl4lledlyfxjyrv7owj5ggzjp3bend57fouk4meq4itlqoqb37nq"
}

// Version
// ARM is 7.6.1_(_ARM64_)
// x64 is  7.6.1_(_X64_)
variable "mp_listing_resource_version" {
  default = "7.6.1_(_X64_)"
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
