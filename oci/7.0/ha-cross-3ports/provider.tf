provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

terraform {
  required_version = ">=0.12.0"
  required_providers {
    oci      = ">=3.69.0"
    template = ">=2.1.2"
  }
}

