// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}


//x86
//BYOL 7.4.2: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.2 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.2 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.2 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.2 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.2 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.4.2: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.2 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.2 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.2 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.2 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.2 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba" //x86 2cores
}

//x86
//BYOL 7.4.2:  ocid1.image.oc1..aaaaaaaaydhtoikm7qitqvsuhq435asbcggdhp6vwook73ct4b3h7yqigo3a
//PAYG 7.4.2 2ocpu: ocid1.image.oc1..aaaaaaaapr46d7efbcsws4oqdxyn34oke52mizpb3r3jd6otmkpbd4irkb5a
//PAYG 7.4.2 4ocup: ocid1.image.oc1..aaaaaaaaxrtwvf662z6cyc7tmqdziczaxhsw3lauht2nsobjii2nzwmdid4q
//PAYG 7.4.2 8ocup: ocid1.image.oc1..aaaaaaaa4qkthjuokxnpimykv7exflqjsekxyudzqg4inbw7z6syrcxwzlua
//PAYG 7.4.2 16ocup: ocid1.image.oc1..aaaaaaaajijjfl3bnhursqvguuwqm4ha2bs6a3ovjxho33zj2te2cxq5b36q
//PAYG 7.4.2 24ocup: ocid1.image.oc1..aaaaaaaa7hquc4wqt2rdjsaihy3qtewtntu4upa2sp62o2fvdfugm4eerdwq
//ARM
//BYOL 7.4.2: ocid1.image.oc1..aaaaaaaalmipldxavqwtaogyaxwlyv6aa6ijviqt4x4dqpl2wmvnzjuiuwda
//PAYG 7.4.2 2ocpu: ocid1.image.oc1..aaaaaaaazcokz7v3zrjv5fxoiogm7scpm7mgofuivafo5bxxeo3nepwtrlqq
//PAYG 7.4.2 4ocup: ocid1.image.oc1..aaaaaaaawhin62aoexjb6mkdei3isfj7on2xfidmnr6zccmvk37zzrulgwpa
//PAYG 7.4.2 8ocup: ocid1.image.oc1..aaaaaaaaehrqvxhxhz3tfxnhncap4n574aqzlbshvbqpvaqvuofnoz7q2nra
//PAYG 7.4.2 16ocup: ocid1.image.oc1..aaaaaaaadyuwg4gx7ve5ehwma7pwjs7vv5pglhqomckg7xcdqbwvyv76764a
//PAYG 7.4.2 24ocup: ocid1.image.oc1..aaaaaaaaitk5a64pvazc7keovgvmhcyofzy6327zlj3kvwyhtlairjlz5qvq
variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaalde5qyzwbmwvvdcnwh5eu4xjdicchd355qm6glzfwdxna634ir7q" //x86 payg 2 cores
}

// Version
// either - "7.4.2_(_ARM64_)" or "7.4.2_(_X64_)"
//
variable "mp_listing_resource_version" {
  default = "7.4.2_(_X64_)"
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
