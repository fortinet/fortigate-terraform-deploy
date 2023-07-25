// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "terraform-ha-ap-fgt-crosszone-3-port"
  location = var.location

  tags = {
    environment = "Terraform HA AP SDN FortiGates - Crosszone 3 Ports"
  }
}
