// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

# FOS 8.0.0
# BYOL
# x64:  ocid1.image.oc1..aaaaaaaazacuc3dgo7pfsqgvbkg5crwjxcvzohv6frbvj7jtmz63omxgz75a
# ARM64: ocid1.image.oc1..aaaaaaaa3wgxsyqcdcfcgawewlttsjilzxpuwr64rdxftdzftdfd4hb7tk5a
#2 OCPU
#  x64: ocid1.image.oc1..aaaaaaaaaankgxcsnrrcjlvgwixwl3brl3hsum6ie2lozj7y37rlu5yttlha
#  ARM64: ocid1.image.oc1..aaaaaaaaw6iuqo5e7twpkyprvn5d2bo3ce63yryukirakdb2haelngveds2q
#4 OCPU
#  x64: ocid1.image.oc1..aaaaaaaa43wo4z7av4q25lfxq5pziujszzivs47jmxbspotowpgb5hc5kyla
#  ARM64: ocid1.image.oc1..aaaaaaaau6a52q4deltnqljnjnmrifduv5v3dfiu5snors3bph3anz7y6nza
#8 OCPU
#  x64: ocid1.image.oc1..aaaaaaaaz7dl6fglwotae4f2gwro4z55arkmgujitpq3jogvpvvr22wrbgka
#  ARM64: ocid1.image.oc1..aaaaaaaazjjpgvvfhzuxivepm7mx4mgkvuywaktcrqlr77xopeqjwvbnthfq
#16 OCPU
#  x64: ocid1.image.oc1..aaaaaaaa6bycl4cdlqomr7ntj6jtofly2rh5csuupz5sjikgb2gkliqlyggq
#  ARM64: ocid1.image.oc1..aaaaaaaaknryvvv4phygodf7x7t64dbpi5bjp7rz6g7bjbi6mxdebbm2yqya
#24 OCPU
# x64: ocid1.image.oc1..aaaaaaaapfdq7m5plo6wxyphfaqspthbbutbap5blkhryvlut46n3jipuy7a
#  ARM64: ocid1.image.oc1..aaaaaaaaumefg5lobcpgwnldne4mfdmajytwnk7ssahil6vrp54u3zcde2ia

// Image
variable "oci_image" {
  default = "ocid1.image.oc1..aaaaaaaaz7dl6fglwotae4f2gwro4z55arkmgujitpq3jogvpvvr22wrbgka"
  //   default = "ocid1.image.oc1..aaaaaaaazjjpgvvfhzuxivepm7mx4mgkvuywaktcrqlr77xopeqjwvbnthfq"
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

variable "hasync_subnet_cidr" {
  type    = string
  default = "10.1.3.0/24"
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

// private ip for active fgt on hbdev
variable "hasync_private_ip_active" {
  type    = string
  default = "10.1.3.3"
}

// private ip for passive fgt on hbdev
variable "hasync_private_ip_passive" {
  type    = string
  default = "10.1.3.4"
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

variable "hasync_private_mask" {
  type    = string
  default = "255.255.255.0"
}

// instance cpu
variable "instance_cpu" {
  type    = string
  default = "8"
}

// instance memory
variable "instance_memory" {
  type    = string
  default = "8"
}

// instance shape
// "VM.Standard3.Flex" //x86
// "VM.Standard.A1.Flex" //arm
variable "instance_shape" {
  type = string
  //default = "VM.Standard.A1.Flex" //arm
  default = "VM.Standard3.Flex" //x86
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
