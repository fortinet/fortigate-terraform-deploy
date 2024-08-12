// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

//x86
//BYOL 7.2.8: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.2.8 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.2.8 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.2.8 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.2.8 16ocup:  ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.2.8 24ocup:  ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.2.8: ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.2.8 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.2.8 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.2.8 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.2.8 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.2.8 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
variable "mp_listing_id" {
 default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq"
}

//x86
//BYOL 7.2.8:  ocid1.image.oc1..aaaaaaaatktefn4ur7muxvost7ijpr4w6bxk4vxdpj3fx5ousyuwmfmdsuhq
//PAYG 7.2.8 2ocpu: ocid1.image.oc1..aaaaaaaawrfcb5qozsqotq2g3lmyleipzlr2mtaj5ocgoo3vbyqdjwsktwwa
//PAYG 7.2.8 4ocup: ocid1.image.oc1..aaaaaaaa6kasqbfch27kzfvhj6qobs2ut6w4f6znggjdjkulgeb5qomo57bq
//PAYG 7.2.8 8ocup: ocid1.image.oc1..aaaaaaaaqvlljs3ca7bipzdru5xnn362p4xgv6y2bvuahc24wynksnymurda
//PAYG 7.2.8 16ocup: ocid1.image.oc1..aaaaaaaae5ldvhqs5c5kwv3imz2t7w3bswmoweij75u2chs4bgc4rwhccayq
//PAYG 7.2.8 24ocup: ocid1.image.oc1..aaaaaaaabmdabpofzcdqmcautoz3izdipjpqaisaxqnfyh4urequz4hsz64q
//ARM
//BYOL 7.2.8:  ocid1.image.oc1..aaaaaaaawrlnxyqwuxv4ksmilm5ocuky66vfdd2cnkfnrhimo4g4zunyoy3a
//PAYG 7.2.8 2ocpu:  ocid1.image.oc1..aaaaaaaa5rkme66zvasmgh4hycs4s27c7f2wsb2ucyb7shtnnaerof5d4kpa
//PAYG 7.2.8 4ocup:  ocid1.image.oc1..aaaaaaaansaudp2he6x5wtwejkhxgtrpnmr6aqg5c7aqkjb5p2betth6crra
//PAYG 7.2.8 8ocup:  ocid1.image.oc1..aaaaaaaazbpuy6cvmphgr5rlbk5lf43wtgme3ybx2ppey7tp5besrzl5wxpq
//PAYG 7.2.8 16ocup:  ocid1.image.oc1..aaaaaaaarj7h2qguwwaaecbu7gvvtg6d4zj2zjn2by6fbc6lsclb4dcwl66q
//PAYG 7.2.8 24ocup: ocid1.image.oc1..aaaaaaaasokjk6vrs625o3mniccmalku6vnhmyfwyr3nahjm3jiv5doci5ka
variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaa6kasqbfch27kzfvhj6qobs2ut6w4f6znggjdjkulgeb5qomo57bq"
}

// Version
// either - "7.2.8_(_ARM64_)" or "7.2.8_(_X64_)"
//
variable "mp_listing_resource_version" {
  default = "7.2.8_(_X64_)"
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

// private ip for active fgt on mgmt subnet
variable "mgmt_private_ip_active" {
  type    = string
  default = "10.1.0.3"
}

// private ip for passive fgt on mgmt subnet
variable "mgmt_private_ip_passive" {
  type    = string
  default = "10.1.0.4"
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
  default = "10.1.1.5"
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
  default = "10.1.2.5"
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
