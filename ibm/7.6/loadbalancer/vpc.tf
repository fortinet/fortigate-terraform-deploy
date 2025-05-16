resource "ibm_is_vpc" "vpc1" {
  name                      = "terraform-vpc1-${random_string.random_name_post.result}"
  address_prefix_management = "manual"
}

resource "ibm_is_vpc_address_prefix" "vpc" {
  cidr = var.vpcprefix
  name = "vpcprefix-${random_string.random_name_post.result}"
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

resource "ibm_is_network_acl" "fgtacl" {
  name = "fgtacl-${random_string.random_name_post.result}"
  vpc  = ibm_is_vpc.vpc1.id
}

resource "ibm_is_network_acl_rule" "fgtaclrule" {
  network_acl = ibm_is_network_acl.fgtacl.id
  name        = "outbound-${random_string.random_name_post.result}"
  action      = "allow"
  source      = "0.0.0.0/0"
  destination = "0.0.0.0/0"
  direction   = "outbound"
}

resource "ibm_is_network_acl_rule" "example1" {
  network_acl = ibm_is_network_acl.fgtacl.id
  name        = "inbound-${random_string.random_name_post.result}"
  action      = "allow"
  source      = "0.0.0.0/0"
  destination = "0.0.0.0/0"
  direction   = "inbound"
}

resource "ibm_is_vpc_routing_table" "terraform_routing_table" {
  vpc                           = ibm_is_vpc.vpc1.id
  name                          = "terraform-rt-${random_string.random_name_post.result}"
  route_direct_link_ingress     = false
  route_transit_gateway_ingress = false
  route_vpc_zone_ingress        = false
}

# load balaner
resource "ibm_is_lb" "ext-lb" {
  name            = "external-lb-${random_string.random_name_post.result}"
  subnets         = [ibm_is_subnet.subnet1.id]
  profile         = "network-fixed"
  security_groups = [ibm_is_security_group.fgt_security_group.id]
  type            = "public"
}


# load balaner
resource "ibm_is_lb" "int-lb" {
  name            = "internal-lb-${random_string.random_name_post.result}"
  subnets         = [ibm_is_subnet.subnet2.id]
  profile         = "network-fixed"
  security_groups = [ibm_is_security_group.fgt_security_group.id]
  route_mode      = "true"
  type            = "private"
}


# internal load balancer pool
resource "ibm_is_lb_pool" "intfgtpool" {
  name                = "fgt-int-pool-${random_string.random_name_post.result}"
  lb                  = ibm_is_lb.int-lb.id
  algorithm           = "round_robin"
  protocol            = "tcp"
  health_monitor_port = "8008"
  health_delay        = 60
  health_retries      = 5
  health_timeout      = 30
  health_type         = "tcp"
}



# load balancer pool
resource "ibm_is_lb_pool" "fgtpool" {
  name                = "fgt-pool-${random_string.random_name_post.result}"
  lb                  = ibm_is_lb.ext-lb.id
  algorithm           = "round_robin"
  protocol            = "tcp"
  health_monitor_port = "8008"
  health_delay        = 60
  health_retries      = 5
  health_timeout      = 30
  health_type         = "tcp"
}


# internal load balancer pool member
resource "ibm_is_lb_pool_member" "fgtint" {
  lb        = ibm_is_lb.int-lb.id
  pool      = element(split("/", ibm_is_lb_pool.intfgtpool.id), 1)
  port      = 443
  target_id = ibm_is_instance.fgt1.id
  weight    = 60
}



# load balancer pool member
resource "ibm_is_lb_pool_member" "fgt" {
  lb        = ibm_is_lb.ext-lb.id
  pool      = element(split("/", ibm_is_lb_pool.fgtpool.id), 1)
  port      = 443
  target_id = ibm_is_instance.fgt1.id
  weight    = 60
}

# internal load balancer pool member2
resource "ibm_is_lb_pool_member" "fgt2int" {
  lb        = ibm_is_lb.int-lb.id
  pool      = element(split("/", ibm_is_lb_pool.intfgtpool.id), 1)
  port      = 443
  target_id = ibm_is_instance.fgt2.id
  weight    = 60
}


# load balancer pool member2
resource "ibm_is_lb_pool_member" "fgt2" {
  lb        = ibm_is_lb.ext-lb.id
  pool      = element(split("/", ibm_is_lb_pool.fgtpool.id), 1)
  port      = 443
  target_id = ibm_is_instance.fgt2.id
  weight    = 60
}

#
resource "ibm_is_lb_listener" "fgt-front-int" {
  lb           = ibm_is_lb.int-lb.id
  default_pool = ibm_is_lb_pool.intfgtpool.id
  protocol     = "tcp"
  port_min     = "1"
  port_max     = "65535"
}

#
resource "ibm_is_lb_listener" "fgt-front" {
  lb           = ibm_is_lb.ext-lb.id
  default_pool = ibm_is_lb_pool.fgtpool.id
  protocol     = "tcp"
  port_min     = "443"
  port_max     = "443"
}


resource "ibm_is_vpc_routing_table_route" "terraform_routing_table_route" {
  vpc           = ibm_is_vpc.vpc1.id
  routing_table = ibm_is_vpc_routing_table.terraform_routing_table.routing_table
  zone          = var.zone1
  name          = "egress-route-${random_string.random_name_post.result}"
  destination   = "0.0.0.0/0"
  action        = "deliver"
  next_hop      = ibm_is_lb.int-lb.private_ip[0].address
  #next_hop      = var.fgtaport2
}


