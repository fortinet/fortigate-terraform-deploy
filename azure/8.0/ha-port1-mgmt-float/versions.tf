terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    random = {
      source = "hashicorp/random"
    }
    #    template = {
    #      source = "hashicorp/template"
    #    }
  }
  required_version = ">= 0.13"
}
