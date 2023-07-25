// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "terraform-ha-ap-fgt-crosszone"
  location = var.location

  tags = {
    environment = "Terraform HA AP SDN FortiGates - Crosszone"
  }
}
