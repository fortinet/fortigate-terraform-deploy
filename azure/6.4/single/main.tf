// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "fgtsingle"
  location = var.location

  tags = {
    environment = "Terraform Demo"
  }
}
