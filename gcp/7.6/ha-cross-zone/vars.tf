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
variable "zone2" {
  type    = string
  default = "us-central1-a" #Default Zone 2
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
# 7.6.3 x86 payg is projects/fortigcp-project-001/global/images/fortinet-fgtondemand-763-20250423-001-w-license
# 7.6.3 x86 byol is projects/fortigcp-project-001/global/images/fortinet-fgt-763-20250423-001-w-license
# 7.6.3 arm payg is projects/fortigcp-project-001/global/images/fortinet-fgtondemand-arm64-763-20250423-001-w-license
# 7.6.3 arm byol is projects/fortigcp-project-001/global/images/fortinet-fgt-arm64-763-20250423-001-w-license

variable "image" {
  type    = string
  default = "projects/fortigcp-project-001/global/images/fortinet-fgtondemand-763-20250423-001-w-license"
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
# HA Subnet CIDR
variable "ha_subnet" {
  type    = string
  default = "172.16.2.0/24"
}
# MGMT Subnet CIDR
variable "mgmt_subnet" {
  type    = string
  default = "172.16.3.0/24"
}
# license file for active
variable "licenseFile" {
  type    = string
  default = "license1.lic"
}
# license file for passive
variable "licenseFile2" {
  type    = string
  default = "license2.lic"
}

# hamgmt gateway ip, depends on your mgmt subnet cidr
variable "mgmt_gateway" {
  type    = string
  default = "172.16.3.1"
}
variable "mgmt_mask" {
  type    = string
  default = "255.255.255.0"
}

# active interface ip assignments
# active ext
variable "active_port1_ip" {
  type    = string
  default = "172.16.0.2"
}
variable "active_port1_mask" {
  type    = string
  default = "32"
}
# active int
variable "active_port2_ip" {
  type    = string
  default = "172.16.1.2"
}
variable "active_port2_mask" {
  type    = string
  default = "32"
}
# active sync
variable "active_port3_ip" {
  type    = string
  default = "172.16.2.2"
}
variable "active_port3_mask" {
  type    = string
  default = "24"
}
# active hamgmt
variable "active_port4_ip" {
  type    = string
  default = "172.16.3.2"
}
variable "active_port4_mask" {
  type    = string
  default = "24"
}


# passive sync interface ip assignments
#passive ext
variable "passive_port1_ip" {
  type    = string
  default = "172.16.0.3"
}
variable "passive_port1_mask" {
  type    = string
  default = "24"
}

# passive int
variable "passive_port2_ip" {
  type    = string
  default = "172.16.1.3"
}
variable "passive_port2_mask" {
  type    = string
  default = "24"
}

# passive sync
variable "passive_port3_ip" {
  type    = string
  default = "172.16.2.3"
}
variable "passive_port3_mask" {
  type    = string
  default = "24"
}

# passive hamgmt
variable "passive_port4_ip" {
  type    = string
  default = "172.16.3.3"
}
variable "passive_port4_mask" {
  type    = string
  default = "24"
}
