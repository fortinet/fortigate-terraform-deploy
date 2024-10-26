##############################################################################################################
# Terraform state
##############################################################################################################

terraform {
  required_version = ">= 0.12"
}

# Randomize string to avoid duplication
resource "random_string" "random_name_post" {
  length           = 3
  special          = true
  override_special = ""
  min_lower        = 3
}

##############################################################################################################
# Deployment in AWS
##############################################################################################################
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
  # Uncomment if using AWS SSO:
  # token      = var.token
}
