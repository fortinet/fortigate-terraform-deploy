// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "terraform-ha-ap-fgt-port1-mgmt"
  location = var.location

  tags = {
    environment = "Terraform HA AP SDN FortiGates - Port1 Mgmt"
  }
}
