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
  default = "<gcp project>"
}
# GCP Fortinet official project
variable "ftntproject" {
  type    = string
  default = "fortigcp-project-001"
}
# GCP oauth access token
variable "token" {
  type    = string
  default = "<gcp oauth access token>"
}
# FortiGate Image name
# 7.2.12 x86 payg is projects/fortigcp-project-001/global/images/fortinet-fgtondemand-7212-20250910-001-w-license
# 7.2.12 x86 byol is projects/fortigcp-project-001/global/images/fortinet-fgt-7212-20250910-001-w-license
# 7.2.12 arm payg is projects/fortigcp-project-001/global/images/fortinet-fgtondemand-arm64-7212-20250910-001-w-license
# 7.2.12 arm byol is projects/fortigcp-project-001/global/images/fortinet-fgt-arm64-7212-20250910-001-w-license
variable "image" {
  type    = string
  default = "projects/fortigcp-project-001/global/images/fortinet-fgtondemand-7212-20250910-001-w-license"
}
# GCP VNIC type
# either GVNIC or VIRTIO_NET
# ARM must use GVNIC
variable "nictype" {
  type    = string
  default = "GVNIC"
}
# GCP instance machine type
# ARM platform needs to use t2a-standard-4
# x86 can uses n1-standard-4
# GCP instance machine type
variable "machine" {
  type    = string
  default = "n1-standard-4"
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

# user data for bootstrap fgt license file
variable "license_file" {
  type    = string
  default = "license.lic" #FGT BYOL license
}
