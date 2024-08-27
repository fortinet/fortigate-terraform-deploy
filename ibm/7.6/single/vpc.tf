resource "ibm_is_vpc" "vpc1" {
  name = "terraform-vpc-${random_string.random_name_post.result}"
}

resource "ibm_is_subnet" "subnet1" {
  name                     = "terraform-vpc-${random_string.random_name_post.result}-subnet1"
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = var.zone1
  total_ipv4_address_count = var.subnetipv4count
}

resource "ibm_is_subnet" "subnet2" {
  name                     = "terraform-vpc-${random_string.random_name_post.result}-subnet2"
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = var.zone1
  total_ipv4_address_count = var.subnetipv4count
}

resource "ibm_is_security_group" "fgt_security_group" {
  name = "fgt-sg"
  vpc  = ibm_is_vpc.vpc1.id
}

resource "ibm_is_security_group_rule" "fgt_security_group_rule_inbound_all" {
  group     = ibm_is_security_group.fgt_security_group.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
}

resource "ibm_is_security_group_rule" "fgt_security_group_rule_outbound_all" {
  group     = ibm_is_security_group.fgt_security_group.id
  direction = "outbound"
  remote    = "0.0.0.0/0"
}
