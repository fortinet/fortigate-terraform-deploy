// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "terraform-ha-ap-fgt-3-port"
  location = var.location

  tags = {
    environment = "Terraform HA AP SDN FortiGates - 3 Ports"
  }
}
