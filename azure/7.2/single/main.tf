// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "terraform-single-fgt"
  location = var.location

  tags = {
    environment = "Terraform Single FortiGate"
  }
}
