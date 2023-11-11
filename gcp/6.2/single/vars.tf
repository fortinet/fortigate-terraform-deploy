# GCP region
variable "region" {
  type    = string
  default = "us-central1" #Default Region
}
# GCP zone
variable "zone" {
  type    = string
  default = "us-central1-c" #Default Zone
}
# GCP project name
variable "project" {
  type    = string
  default = "<gcp project name>"
}
# GCP oauth access token
variable "token" {
  type    = string
  default = "<gcp oauth access token>"
}
# FortiGate Image name
# 6.2.5 payg is projects/fortigcp-project-001/global/images/fortinet-fgtondemand-625-20200831-001-w-license
# 6.2.5 byol is projects/fortigcp-project-001/global/images/fortinet-fgt-625-20200831-001-w-license
variable "image" {
  type    = string
  default = "projects/fortigcp-project-001/global/images/fortinet-fgtondemand-625-20200831-001-w-license"
}
# GCP instance machine type
variable "machine" {
  type    = string
  default = "n1-standard-1"
}
# VPC CIDR
variable "vpc_cidr" {
  type    = string
  default = "172.16.0.0/16"
}
# Public Subnet CIDR
variable "public_subnet" {
  type    = string
  default = "172.16.0.0/24"
}
# Private Subnet CIDR
variable "protected_subnet" {
  type    = string
  default = "172.16.1.0/24"
}

# user data for bootstrap fgt configuration
variable "user_data" {
  type    = string
  default = "config.txt"
}


# user data for bootstrap fgt configuration
variable "license_file" {
  type    = string
  default = "license.lic" #FGT BYOL license
}
