provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}



terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.13.2"
    }
  }
}

provider "fortios" {
  hostname = var.onpremiseip
  token    = var.fosapikey
  insecure = "true"
}
