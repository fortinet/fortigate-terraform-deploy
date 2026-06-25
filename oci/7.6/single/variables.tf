// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

# FOS 7.6.7
#BYOL
#x64 : ocid1.image.oc1..aaaaaaaa56z2rxorqqbkdgfxc6xyqnauxlpj42h6gk7dwpuri35mqwxnwzqq
#ARM64 : ocid1.image.oc1..aaaaaaaadzk5rl2civ6ws5mnkdur2otdybr7m7s7mdlxlev5vt7snrare54a
#
#2core
#x64 : ocid1.image.oc1..aaaaaaaavfkuner4b7l7wmbkbwpufqjett4qw6tq76vd2m44i6wwb7bw4yzq
#ARM64 : ocid1.image.oc1..aaaaaaaagwsaopxxs7mpq7oujzrc4kyn5cje3dnpwj3625zxng5m2zx33hiq
#
#4core
#x64 : ocid1.image.oc1..aaaaaaaa2rbixjjw7u6l6qm23xyf7y6fxwhuzodc57yr2hmyrsb7h3rddjca
#ARM64 : ocid1.image.oc1..aaaaaaaayol4ia5sfxjs5pbmntrzbnoophgpe6u5olp7miurdxqcdyya4njq
#
#8core
#x64 : ocid1.image.oc1..aaaaaaaat7qg7xdvpzs6bn5hx64ndjv6okxvo2de6ds2gvgxepqjon3qsyca
#ARM64 : ocid1.image.oc1..aaaaaaaapvkyffw4pi3hoh3ia56ehtg63aljr7jcj4ivbeq6qp5uqjhvapza
#
#16core
#x64 : ocid1.image.oc1..aaaaaaaadn6jadrrxamo7ft5lbuxtgb5y2f4w4sg3gviv3eora7kz5aa7x5q
#ARM64 : ocid1.image.oc1..aaaaaaaa26fi62ioazittm7k4zvjrlihysbancmtgeasyioj6ryemavbleyq
# 
#24core
#x64 : ocid1.image.oc1..aaaaaaaai2a3g54zgjqvnxwvv2pcoy2xty2iuj6xxi237hm4hzptn6ivww7q
#ARM64 : ocid1.image.oc1..aaaaaaaariui24ro2rdiu7pe66jxavbpvkdwwlfsx5sodsnzo7lybwd47w6a
// Image
variable "oci_image" {
  //     default = "ocid1.image.oc1..aaaaaaaavfkuner4b7l7wmbkbwpufqjett4qw6tq76vd2m44i6wwb7bw4yzq"
  default = "ocid1.image.oc1..aaaaaaaagwsaopxxs7mpq7oujzrc4kyn5cje3dnpwj3625zxng5m2zx33hiq"
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

// instance shape
// "VM.Standard.E5.Flex" //x86
// "VM.Standard.A1.Flex" //arm
variable "instance_shape" {
  type = string
  //  default = "VM.Standard.E5.Flex" //x86
  default = "VM.Standard.A1.Flex" //arm
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
