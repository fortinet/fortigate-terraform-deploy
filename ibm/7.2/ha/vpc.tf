resource "ibm_is_vpc" "vpc1" {
  name                      = "terraform-vpc1"
  address_prefix_management = "manual"
}

resource "ibm_is_vpc_address_prefix" "vpc" {
  cidr = var.vpcprefix
  name = "vpcprefix"
  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone1
}

resource "ibm_is_subnet" "subnet1" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc]
  name            = "terraform-vpc1-subnet1"
  ipv4_cidr_block = var.subnet1prefix
  vpc             = ibm_is_vpc.vpc1.id
  zone            = var.zone1
  public_gateway  = ibm_is_public_gateway.publicgateway.id
}

resource "ibm_is_subnet" "subnet2" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc]
  name            = "terraform-vpc1-subnet2"
  vpc             = ibm_is_vpc.vpc1.id
  ipv4_cidr_block = var.subnet2prefix
  zone            = var.zone1
  routing_table   = ibm_is_vpc_routing_table.terraform_routing_table.routing_table
}

resource "ibm_is_subnet" "subnet3" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc]
  name            = "terraform-vpc1-subnet3"
  vpc             = ibm_is_vpc.vpc1.id
  ipv4_cidr_block = var.subnet3prefix
  zone            = var.zone1
}

resource "ibm_is_subnet" "subnet4" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc]
  name            = "terraform-vpc1-subnet4"
  vpc             = ibm_is_vpc.vpc1.id
  ipv4_cidr_block = var.subnet4prefix
  zone            = var.zone1
}

resource "ibm_is_public_gateway" "publicgateway" {
  depends_on = [ibm_is_vpc.vpc1]
  name       = "public-gateway"
  vpc        = ibm_is_vpc.vpc1.id
  zone       = var.zone1

  //User can configure timeouts
  timeouts {
    create = "90m"
  }
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

resource "ibm_is_vpc_routing_table" "terraform_routing_table" {
  vpc                           = ibm_is_vpc.vpc1.id
  name                          = "terraform-rt"
  route_direct_link_ingress     = false
  route_transit_gateway_ingress = false
  route_vpc_zone_ingress        = false
}

resource "ibm_is_vpc_routing_table_route" "terraform_routing_table_route" {
  vpc           = ibm_is_vpc.vpc1.id
  routing_table = ibm_is_vpc_routing_table.terraform_routing_table.routing_table
  zone          = var.zone1
  name          = "egress-route"
  destination   = "0.0.0.0/0"
  action        = "deliver"
  next_hop      = var.fgtaport2
}
