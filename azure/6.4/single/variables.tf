// Azure configu ation
variable subscription_id {}
variable client_id {}
variable client_secret {}
variable tenant_id {}

variable "size" {
  type    = string
  default = "Standard_F4"
}

// To use custom image
// by default is false
variable "custom" {
  default = false
}

//  Custom image blob uri
variable "customuri" {
  type    = string
  default = "<custom image blob uri>"
}

variable "custom_image_name" {
  type    = string
  default = "<custom image name>"
}

variable "custom_image_resource_group_name" {
  type    = string
  default = "<custom image resource group>"
}

variable "publisher" {
  type    = string
  default = "fortinet"
}

variable "fgtoffer" {
  type    = string
  default = "fortinet_fortigate-vm_v5"
}

variable "fgtsku" {
  type    = string
  default = "fortinet_fg-vm_payg_20190624"
}

variable "fgtversion" {
  type    = string
  default = "6.4.1"
}

variable "adminusername" {
  type    = string
  default = "azureadmin"
}

variable "adminpassword" {
  type    = string
  default = "Fortinet123#"
}

variable "location" {
  type    = string
  default = "westus2"
}

variable "vnetcidr" {
  default = "10.1.0.0/16"
}

variable "publiccidr" {
  default = "10.1.0.0/24"
}

variable "privatecidr" {
  default = "10.1.1.0/24"
}

variable "bootstrap-fgtvm" {
  // Change to your own path
  type    = string
  default = "fgtvm.conf"
}

