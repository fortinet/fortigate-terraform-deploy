// Azure configuration
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

// Azure Side of variables
variable "vwanname" {
  description = "VWan name"
  default     = "vwan"
}

variable "resourcename" {
  description = "Resource Group name"
  default     = "terraformvwan-rg"
}

variable "hubprefix" {
  description = "Address prefix for hub"
  default     = "10.0.0.0/16"
}

variable "location" {
  description = "Location the Hub"
  default     = "eastus2"
}

variable "connectionname" {
  description = "VPN gateway connection name"
  default     = "connection"
}

variable "linkname" {
  description = "VPN gateway link name"
  default     = "link1"
}

variable "vpnname" {
  description = "VPN Site name"
  default     = "Site1"
}

variable "gatewayname" {
  description = "Gateway name"
  default     = "gateway-01"
}

variable "hubname" {
  description = "Hub name"
  default     = "hub-01"
}

variable "networkname" {
  description = "Virtual network name"
  default     = "terraform_vnet"
}

variable "networkprefix" {
  description = "Virtual network prefix"
  default     = "20.0.0.0/16"
}

variable "subnet1prefix" {
  description = "Virtual Subnet name"
  default     = "20.0.1.0/24"
}

variable "subnet1name" {
  description = "Virtual Subnet name"
  default     = "GatewaySubnet"
}

variable "subnet2prefix" {
  description = "Virtual Subnet name"
  default     = "20.0.0.0/24"
}

variable "subnet2name" {
  description = "Virtual Subnet name"
  default     = "ApplicationSubnet"
}


// On-Premise FortiGate Side of variables
variable "onpremiseip" {
  description = "Public IP for the On-Premise FGT"
  default     = "X.X.X.X"
}

variable "sourceport" {
  description = "Source Port for Ipsec policy"
  default     = "port2"
}

variable "fosapikey" {
  description = "API KEY"
  default     = "XXXXXXXXXXXX"
}

variable "bgpremoteasn" {
  description = "BGP Remote ASN Number"
  default     = "65515"
}

variable "bgpasn" {
  description = "BGP Local ASN Number"
  default     = "7224"
}

variable "presharekey" {
  description = "IPSEC preshare key"
  default     = "Fortinet123#"
}

variable "bgppeerip" {
  description = "BGP Peer IP Address"
  default     = "169.254.24.27"
}

variable "publicip" {
  description = "Premise Public IP"
  default     = "52.154.202.24"
}

variable "vpncidr" {
  description = "On-Premise VPN cidr"
  default     = "172.16.0.0/16"
}

