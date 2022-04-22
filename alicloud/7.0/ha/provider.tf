terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.162.0"
    }
  }
}
provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

