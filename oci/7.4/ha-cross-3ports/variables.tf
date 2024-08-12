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
