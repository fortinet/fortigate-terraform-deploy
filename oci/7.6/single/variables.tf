// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

//x86
//BYOL 7.6.3:byol: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.6.3 2ocpu  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba: 
//PAYG 7.6.3 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.6.3 8ocup  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.6.3 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.6.3 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.6.3: byol: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.6.3 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba 
//PAYG 7.6.3 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.6.3 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.6.3 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.6.3 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq"
}

//x86
//BYOL 7.6.3:byol:  ocid1.image.oc1..aaaaaaaapsgghvaxb7wpmrsknhn5xhpophzmuqsv5bsh6w2x2o26f7cb753q
//PAYG 7.6.3 2ocpu: ocid1.image.oc1..aaaaaaaavegh2evlmlijtjkp4q3isfql5y67nqzzhqjo3ck4vuxngaqyflma
//PAYG 7.6.3 4ocup: ocid1.image.oc1..aaaaaaaan3lqkje2xpjbakvx642kzmdkudky2wbx3v2j4uizwtvprpa2kelq
//PAYG 7.6.3 8ocup: ocid1.image.oc1..aaaaaaaanxu3qyjbsai3twbfyh5ce52yqhydj5fia62nrkppp5clkfvwy4ea
//PAYG 7.6.3 16ocup: ocid1.image.oc1..aaaaaaaajy2zldcd7g7h7i6wmqsfvbt4t2ib5tpgs3mhdxmec23egs6wcnoa
//PAYG 7.6.3 24ocup: ocid1.image.oc1..aaaaaaaa6tmhjvkyrmg6iwxw67dur2lbhpo6jnqqqyb3mtoge5wyls55x7ua
//ARM
//BYOL 7.6.3:byol   ocid1.image.oc1..aaaaaaaafgr2rx3n6s5z5jo7rlfy7tnrceb7vrqzppk7ggambtbad6ved6ua
//PAYG 7.6.3 2ocpu: ocid1.image.oc1..aaaaaaaa4d5tlhwiml6pyn23nrdevxgut3ppqfskg4zsmivc6x6cncyonxoq
//PAYG 7.6.3 4ocup: ocid1.image.oc1..aaaaaaaawka3nykyrgkb6i5urytfxdy5awwja5qatnj4krhxsy4goaqxubva
//PAYG 7.6.3 8ocup: ocid1.image.oc1..aaaaaaaaw4qqnhbbamq32guagyjqmq4qn3vuc7f75dksahnjjr3pvyoklxka
//PAYG 7.6.3 16ocup:  ocid1.image.oc1..aaaaaaaarkhn356m2czpk25qi4dctizkrxwbxbwo47kgna6wd2oxcjyjfqjq
//PAYG 7.6.3 24ocup: ocid1.image.oc1..aaaaaaaa2ahgiz7qlhkcqzz5gnivoff6uqbfvhbpm7scwoamj5j2qbay6vwa

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaan3lqkje2xpjbakvx642kzmdkudky2wbx3v2j4uizwtvprpa2kelq"
}

// Version
// ARM is 7.6.3_(_ARM64_)
// x64 is  7.6.3_(_X64_)
variable "mp_listing_resource_version" {
  default = "7.6.3_(_X64_)"
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
