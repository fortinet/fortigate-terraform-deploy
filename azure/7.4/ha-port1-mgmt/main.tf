// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "terraform-ha-ap-fgt-port1-mgmt"
  location = var.location

  tags = {
    environment = "Terraform HA AP SDN FortiGates - Port1 Mgmt"
  }
}

// Marketplace agreement.
resource "azurerm_marketplace_agreement" "fortinet" {
  count     = var.accept ? 1 : 0
  publisher = var.publisher
  offer     = var.fgtoffer
  plan      = var.license_type == "byol" ? var.fgtsku["byol"] : var.fgtsku["payg"]
}
