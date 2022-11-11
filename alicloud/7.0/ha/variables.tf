// Alicloud configuration
variable "access_key" {}
variable "secret_key" {}


variable "region" {
  type    = string
  default = "us-east-1" //Default Region
}

// IAM role that has proper permission for HA
// https://docs.fortinet.com/document/fortigate-public-cloud/6.4.0/alicloud-administration-guide/310017/deploying-fortigate-vm-ha-on-alicloud-using-routing-tables-and-eips
variable "iam" {
  default = "<IAM ROLE>"
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

variable "vswitch_cidr_hasync" {
  type    = string
  default = "172.16.2.0/24"
}

variable "vswitch_cidr_hamgmt" {
  type    = string
  default = "172.16.3.0/24"
}

variable "activeport1" {
  default = "172.16.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  default = "172.16.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  default = "172.16.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}


variable "passiveport1" {
  default = "172.16.0.11"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  default = "172.16.1.11"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  default = "172.16.2.11"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "172.16.0.1"
}

variable "activeport2gateway" {
  default = "172.16.1.1"
}

variable "activeport3gateway" {
  default = "172.16.2.1"
}

//Default VPC Egress Route
variable "default_egress_route" {
  type    = string
  default = "0.0.0.0/0"
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
//Refer to: https://www.alibabacloud.com/help/en/elastic-compute-service/latest/instance-family#sn2ne
//default family : ecs.sn2ne
variable "instance" {
  type    = string
  default = "ecs.sn1ne"
}

data "alicloud_account" "current" {
}

//Get Instance types with min requirements in the region.
//If left with no instance_type_family the return may include shared instances.
data "alicloud_instance_types" "types_ds" {
  cpu_core_count       = 4
  memory_size          = 8
  instance_type_family = var.instance
}

// license file for the fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

variable "license2" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license2.lic"
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
  name_regex  = var.license_type == "byol" ? "^Fortinet FortiGate.*BYOL.*${var.fosversion}" : "^Fortinet FortiGate.*PAYG.*4.*vCPUs.*${var.fosversion}"
  //  output_file = "output.txt"
}
