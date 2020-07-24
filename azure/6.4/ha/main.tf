// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "fgtRSG"
  location = var.location

  tags = {
    environment = "Terraform Demo"
  }
}
