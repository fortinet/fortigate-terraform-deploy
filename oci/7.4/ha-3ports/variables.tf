// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

//x86
//BYOL 7.4.8:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.8 2ocpu: ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.8 4ocup: ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.8 8ocup: ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.8 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.8 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa
//ARM
//BYOL 7.4.8:  ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q
//PAYG 7.4.8 2ocpu:  ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba
//PAYG 7.4.8 4ocup:  ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq
//PAYG 7.4.8 8ocup:  ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q
//PAYG 7.4.8 16ocup: ocid1.appcataloglisting.oc1..aaaaaaaawyxdympmdyxagwj2kr77zybopywouiivxd7vxfttwftkvnw2lqla
//PAYG 7.4.8 24ocup: ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaabepjdf2sw2jkr77a7zrbog7ukzxepoexzgkoyvbw2j2jn7l4y7lq" //x86 4 cores
}

//x86
//BYOL 7.4.8:  ocid1.image.oc1..aaaaaaaashmz5wtows3no5ghone3gujr77zhotjtqucwdqjx5tmx4stdaajq
//PAYG 7.4.8 2ocpu:  ocid1.image.oc1..aaaaaaaayveqayo24foiwkod4rsiyo7zgori7db57xregc2uippquz5z2f5a
//PAYG 7.4.8 4ocup:  ocid1.image.oc1..aaaaaaaamm3fpf4dv37erexdxumhotwfs2b2fgjwgwqmdpa3ho7lvgwadhwa
//PAYG 7.4.8 8ocup:  ocid1.image.oc1..aaaaaaaafon4ayxkghhufoxe3npywvpgv7bqzp2q4lmwtlmf5nbxqyckhila
//PAYG 7.4.8 16ocup: ocid1.image.oc1..aaaaaaaacoozagjtio2cjxbplytjclf27er66wxicx32dy7vltwonqrw4wkq
//PAYG 7.4.8 24ocup: ocid1.image.oc1..aaaaaaaadukflcmalmtmvrxhbhoesyh75z2hn3w5jruj54bcjkcdlxpnfzeq
//ARM
//BYOL 7.4.8:  ocid1.image.oc1..aaaaaaaal5pyfhxjb7imbdtftxwexfg237pwgefy23idjds7th62ltnboctq
//PAYG 7.4.8 2ocpu:  ocid1.image.oc1..aaaaaaaam2yjhl3etkyvjdsvjdf4yrpl2pnhss6ez4woyd4ktd5hiuuqvsaq
//PAYG 7.4.8 4ocup:  ocid1.image.oc1..aaaaaaaao3pfypfcsq6snd6xuuw4ipsk6vhe7gn62awke6bqxsqqwc4wpxqa
//PAYG 7.4.8 8ocup:  ocid1.image.oc1..aaaaaaaahqcdm2trj53xoby6gfbwmtigrea7qj7rh3lgshv4nr6y6bgtmcra
//PAYG 7.4.8 16ocup:  ocid1.image.oc1..aaaaaaaar6g4wopzw6imymobqeiz6h4dioulrqdlg22fhjegdhwmabyb2y3a
//PAYG 7.4.8 24ocup:  ocid1.image.oc1..aaaaaaaaqfjiettahkyogmyfbgdpsdgaqlhblt32sk2n5xx3t5vivq354pla

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaamm3fpf4dv37erexdxumhotwfs2b2fgjwgwqmdpa3ho7lvgwadhwa" //x86 payg 4 cores
}

// Version
// x64 - 7.4.8_(_X64_)
// ARM - 7.4.8_(_ARM64_)
variable "mp_listing_resource_version" {
  default = "7.4.8_(_X64_)"
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
// "VM.Standard.E4.Flex" //x86
// "VM.Standard.A1.Flex" //arm
variable "instance_shape" {
  type    = string
  default = "VM.Standard.E4.Flex" //x86
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
