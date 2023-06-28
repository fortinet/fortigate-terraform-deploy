// Alicloud configuration
variable "access_key" {}
variable "secret_key" {}


variable "region" {
  type    = string
  default = "us-east-1" //Default Region
}

variable "vpc_cidr" {
  type    = string
  default = "172.16.0.0/16"
}

variable "vswitch_cidr_ext" {
  type    = string
  default = "172.16.0.0/24"
}

variable "vswitch_cidr_int" {
  type    = string
  default = "172.16.1.0/24"
}

variable "vswitch_cidr_interal_ZoneB" {
  type    = string
  default = "172.16.9.0/24"
}
//Default VPC Egress Route
variable "default_egress_route" {
  type    = string
  default = "0.0.0.0/0"
}

// FGT port1 private ip
variable "fortigate_private_ip" {
  type    = string
  default = "172.16.0.100"
}

//If an AMI is specified it will be chosen
//Otherwise the ESS config will default to the latest Fortigate version
variable "instance_ami" {
  type    = string
  default = ""
}

variable "adminsport" {
  default = "8443"
}

//Define the instance family to be used.
//Different regions will contain various instance families
//default family : ecs.sn1ne
variable "instance" {
  type    = string
  default = "ecs.sn1ne"
}

data "alicloud_account" "current" {
}

//Get Instance types with min requirements in the region.
//If left with no instance_type_family the return may include shared instances.
data "alicloud_instance_types" "types_ds" {
  cpu_core_count       = 2
  memory_size          = 4
  instance_type_family = var.instance //ecs.g5 is default
}

// license file for the fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// FortiGate Image.  Default is payg.
// Options are either payg or byol
variable "license_type" {
  default = "byol"
}

// FortiOS Version
variable "fosversion" {
  default = "7.0.8"
}


data "alicloud_images" "ecs_image" {
  owners      = "marketplace"
  most_recent = true
  name_regex  = var.license_type == "byol" ? "^Fortinet FortiGate.*BYOL.*${var.fosversion}" : "^Fortinet FortiGate.*PAYG.*${var.fosversion}"
  //output_file  = "output.txt"
}
