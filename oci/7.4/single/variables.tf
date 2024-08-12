// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

/x86
//BYOL 7.4.4: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.4 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.4 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.4 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.4 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.4 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.4.4:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.4 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.4 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.4 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.4 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.4 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq" //x86 4 cores
}


//x86
//BYOL 7.4.4: ocid1.image.oc1..aaaaaaaaqtn5zzxeq2umyspk72ge7byv4sdrmuyz2moera44ms2d3i66ge5a
//PAYG 7.4.4 2ocpu: ocid1.image.oc1..aaaaaaaacpburqahlsonu65tjpe35ebs3zocjbl3rkxqueifc4fmgknchhrq
//PAYG 7.4.4 4ocup: ocid1.image.oc1..aaaaaaaa5gjppe75polatsasipzuv3g5x7ectgrlybocfbojr4izqhpsxega
//PAYG 7.4.4 8ocup: ocid1.image.oc1..aaaaaaaarcaxxtxyfi6i6tj4ukkxaa3un4xmjriznhrmcrly4rlvcye43faq
//PAYG 7.4.4 16ocup: ocid1.image.oc1..aaaaaaaarmoubcdil5nhouymlsgbvdxyzmxcfxnrogejehwtmfppwbski2eq
//PAYG 7.4.4 24ocup: ocid1.image.oc1..aaaaaaaadx2vibovdtqd5b5hpvnrkbwkplqdy52kq5o246ggy3m7p3lveppq
//ARM
//BYOL 7.4.4:  ocid1.image.oc1..aaaaaaaalcoyndcss27grmh4vwaw56wmwupx6dgilfecvcs6evhrqz2glpcq
//PAYG 7.4.4 2ocpu:  ocid1.image.oc1..aaaaaaaasb4t6k2mwv6pis3lwpkjlklctyq525pmnug66476oo4rr6acoxra
//PAYG 7.4.4 4ocup:  ocid1.image.oc1..aaaaaaaafym7xlmnjuadlbdggjfpw7hidqfuduyj7czast2we5cdqy7lggaq
//PAYG 7.4.4 8ocup:  ocid1.image.oc1..aaaaaaaauybk4ksm3mru3bfuyzx77r3ster2ne3niksdp52rklvpmr5r6eta
//PAYG 7.4.4 16ocup:  ocid1.image.oc1..aaaaaaaaan5gyn535gk4beydy3cfpbigd4cn2e6nobtyuvvdwci4vnj33f3q
//PAYG 7.4.4 24ocup:  ocid1.image.oc1..aaaaaaaagbrmmqrksh4g4xwxvaqe2ppr34ugfteovr7m7zjwhhhfz4ho5nea

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaa5gjppe75polatsasipzuv3g5x7ectgrlybocfbojr4izqhpsxega" //x86 payg 4 cores
}

// Version
// either - "7.4.4_(_ARM64_)" or "7.4.4_(X64)"
//
variable "mp_listing_resource_version" {
  default = "7.4.4_(X64)"
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
