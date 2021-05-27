provider "openstack" {
  user_name        = var.user_name
  password         = var.password
  auth_url         = var.auth_url
  user_domain_name = var.user_domain_name
  region           = var.region
  tenant_name      = var.tenant_name
}
