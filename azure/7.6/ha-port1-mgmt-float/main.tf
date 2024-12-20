// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "Terraformdemo"
  location = var.location

  tags = {
    environment = "Terraform Demo"
  }
}

// Marketplace agreement.
resource "azurerm_marketplace_agreement" "fortinet" {
  count     = var.accept ? 1 : 0
  publisher = var.publisher
  offer     = var.fgtoffer
  plan      = var.fgtsku[var.arch][var.license_type]
}

