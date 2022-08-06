// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "Terraformdemo"
  location = var.location

  tags = {
    environment = "Terraform Demo"
  }
}
