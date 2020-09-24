variable "user_name" {}
variable "password" {}
variable "auth_url" {}
variable "user_domain_name" {}
variable "region" {}
variable "tenant_name" {}

// FGTVM image id
variable "image_id" {
  default = "<FGT Image ID>"
}

// Flavor ID
variable "flavor_id" {
  default = "<flavor id>"
}

// Bootstrap FGT configuration file
variable "boostrap_file" {
  default = "userdata.txt"
}

// network for port1
variable "unprotect_network" {
  default = "<openstack network name>"
}

// network for port2
variable "protect_network" {
  default = "<openstack network name>"
}

// security group
variable "security_group" {
  default = "<openstack security group>"
}

// Flex VM token
// token variable needs to follow this format
// LICENSE-TOKEN:<TOKEN>
// One token per instance
// To add more instances with new token
// "second" = {
//   "name" = "<fgt name>",
//   "token" = "LICENSE-TOKEN: <Flex VM token>"
// }
variable "flextoken" {
  default = {
    "first" = {
      "name"  = "fgt-first",
      "token" = "LICENSE-TOKEN:XXXXXXXXXXX"
    },
    "second" = {
      "name"  = "fgt-second",
      "token" = "LICENSE-TOKEN:XXXXXXXXXXX"
    }
  }
}
