# GCP region
variable "region" {
  type    = string
  default = "us-central1" #Default Region
}
# GCP zone
variable "zone" {
  type    = string
  default = "us-central1-a" #Default Zone
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
# 7.4.7 x86 payg is projects/fortigcp-project-001/global/images/fortinet-fgtondemand-747-20250123-001-w-license 
# 7.4.7 x86 byol is projects/fortigcp-project-001/global/images/fortinet-fgt-747-20250123-001-w-license
# 7.4.7 arm payg is projects/fortigcp-project-001/global/images/fortinet-fgtondemand-arm64-747-20250123-001-w-license
# 7.4.7 arm byol is projects/fortigcp-project-001/global/images/fortinet-fgt-arm64-747-20250123-001-w-license

variable "image" {
  type    = string
  default = "projects/fortigcp-project-001/global/images/fortinet-fgtondemand-747-20250123-001-w-license"
}

# GCP VNIC type
# either GVNIC or VIRTIO_NET
# arm mus use GVNIC
variable "nictype" {
  type    = string
  default = "GVNIC"
}
# GCP instance machine type
# ARM platform needs to use t2a-standard-1
# x86 can uses n1-standard-1
variable "machine" {
  type    = string
  default = "n1-standard-1"
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
  default = "bootstrap.conf"
}

# user data for bootstrap fgt license file
variable "license_file" {
  type    = string
  default = "license.lic" #FGT BYOL license
}
