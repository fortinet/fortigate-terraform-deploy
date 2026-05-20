resource "ibm_is_vpc" "vpc1" {
  name                      = "terraform-vpc1-${random_string.random_name_post.result}"
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
  name            = "terraform-vpc1-subnet1-${random_string.random_name_post.result}"
  ipv4_cidr_block = var.subnet1prefix
  vpc             = ibm_is_vpc.vpc1.id
  zone            = var.zone1
  public_gateway  = ibm_is_public_gateway.publicgateway.id
}

resource "ibm_is_subnet" "subnet2" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc]
  name            = "terraform-vpc1-subnet2-${random_string.random_name_post.result}"
  vpc             = ibm_is_vpc.vpc1.id
  ipv4_cidr_block = var.subnet2prefix
  zone            = var.zone1
  routing_table   = ibm_is_vpc_routing_table.terraform_routing_table.routing_table
}

resource "ibm_is_subnet" "subnet3" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc]
  name            = "terraform-vpc1-subnet3-${random_string.random_name_post.result}"
  vpc             = ibm_is_vpc.vpc1.id
  ipv4_cidr_block = var.subnet3prefix
  zone            = var.zone1
}

resource "ibm_is_subnet" "subnet4" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc]
  name            = "terraform-vpc1-subnet4-${random_string.random_name_post.result}"
  vpc             = ibm_is_vpc.vpc1.id
  ipv4_cidr_block = var.subnet4prefix
  zone            = var.zone1
}

resource "ibm_is_public_gateway" "publicgateway" {
  depends_on = [ibm_is_vpc.vpc1]
  name       = "public-gateway-${random_string.random_name_post.result}"
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
  name                          = "terraform-rt-${random_string.random_name_post.result}"
  route_direct_link_ingress     = false
  route_transit_gateway_ingress = false
  route_vpc_zone_ingress        = false
}

resource "ibm_is_vpc_routing_table_route" "terraform_routing_table_route" {
  vpc           = ibm_is_vpc.vpc1.id
  routing_table = ibm_is_vpc_routing_table.terraform_routing_table.routing_table
  zone          = var.zone1
  name          = "egress-route-${random_string.random_name_post.result}"
  destination   = "0.0.0.0/0"
  action        = "deliver"
  next_hop      = var.fgtaport2
}

# ingress route table for the par
resource "ibm_is_vpc_routing_table" "terraform_ingressrouting_table" {
  count                         = var.par ? 1 : 0
  vpc                           = ibm_is_vpc.vpc1.id
  name                          = "terraform-rt-ing-${random_string.random_name_post.result}"
  route_direct_link_ingress     = false
  route_transit_gateway_ingress = false
  route_vpc_zone_ingress        = false
  route_internet_ingress        = true
}

resource "ibm_is_public_address_range" "par-fgtha" {
  count              = var.par ? 1 : 0
  ipv4_address_count = var.par_address
  name               = "fgtha-par-${random_string.random_name_post.result}"
  target {
    vpc {
      id = ibm_is_vpc.vpc1.id
    }
    zone {
      name = var.zone1
    }
  }
}

# ingress route table route for the par
resource "ibm_is_vpc_routing_table_route" "terraform_ingressrouting_table_route" {
  count         = var.par ? 1 : 0
  vpc           = ibm_is_vpc.vpc1.id
  routing_table = ibm_is_vpc_routing_table.terraform_ingressrouting_table[count.index].routing_table
  zone          = var.zone1
  name          = "ingress-route-${random_string.random_name_post.result}"
  destination   = ibm_is_public_address_range.par-fgtha[count.index].cidr
  action        = "deliver"
  next_hop      = var.fgtaport1
}

