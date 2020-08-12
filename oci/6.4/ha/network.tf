####################################
## VCN SETTINGS   ##
###################################

resource "oci_core_virtual_network" "my_vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "fgt-vcn"
  dns_label      = "fgtvcn"
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  display_name   = "fgt-igw"
  vcn_id         = oci_core_virtual_network.my_vcn.id
}

####################################
## MANAGEMENT NETWORK SETTINGS   ##
###################################

resource "oci_core_route_table" "mgmt_routetable" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt-mgmt-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

resource "oci_core_subnet" "mgmt_subnet" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1], "name")
  cidr_block          = var.mgmt_subnet_cidr
  display_name        = "fgt-mgmt"
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn.id
  route_table_id      = oci_core_route_table.mgmt_routetable.id
  security_list_ids   = ["${oci_core_virtual_network.my_vcn.default_security_list_id}", "${oci_core_security_list.mgmt_security_list.id}"]
  dhcp_options_id     = oci_core_virtual_network.my_vcn.default_dhcp_options_id
  dns_label           = "fgtmgmt"
}

resource "oci_core_security_list" "mgmt_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt-mgmt-security-list"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  // allow inbound http (port 80) traffic
  ingress_security_rules {
    protocol = "6" // tcp
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  // allow inbound http (port 443) traffic
  ingress_security_rules {
    protocol = "6" // tcp
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol = 1
    source   = "0.0.0.0/0"
  }
}


###############################
## PUBLIC NETWORK SETTINGS   ##
###############################


resource "oci_core_route_table" "public_routetable" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt-public-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}


resource "oci_core_subnet" "public_subnet" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1], "name")
  cidr_block          = var.public_subnet_cidr
  display_name        = "fgt-public"
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn.id
  route_table_id      = oci_core_route_table.public_routetable.id
  security_list_ids   = ["${oci_core_virtual_network.my_vcn.default_security_list_id}", "${oci_core_security_list.public_security_list.id}"]
  dhcp_options_id     = oci_core_virtual_network.my_vcn.default_dhcp_options_id
  dns_label           = "fgtpublic"
}

resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt-public-security-list"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  // allow inbound http (port 80) traffic
  ingress_security_rules {
    protocol = "6" // tcp
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  // allow inbound http (port 443) traffic
  ingress_security_rules {
    protocol = "6" // tcp
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol = 1
    source   = "0.0.0.0/0"
  }
}


###############################
## TRUST NETWORK SETTINGS    ##
###############################

resource "oci_core_subnet" "trust_subnet" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1], "name")
  cidr_block          = var.trust_subnet_cidr
  display_name        = "fgt-trust"
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn.id
  //  route_table_id             = "${oci_core_route_table.trust_routetable.id}"
  security_list_ids          = ["${oci_core_virtual_network.my_vcn.default_security_list_id}", "${oci_core_security_list.internal_security_list.id}"]
  dhcp_options_id            = oci_core_virtual_network.my_vcn.default_dhcp_options_id
  dns_label                  = "fgttrust"
  prohibit_public_ip_on_vnic = true
}


// route table attachment
//resource "oci_core_route_table_attachment" "trust_route_table_attachment" {
//  subnet_id      = oci_core_subnet.trust_subnet.id
//  route_table_id = oci_core_route_table.trust_routetable.id
//}


// private ip
//resource "oci_core_private_ip" "trust_private_ip" {
//  //Get Primary VNIC id
//  vnic_id = oci_core_vnic_attachment.vnic_attach_trust.vnic_id
//vnic_id = element(oci_core_vnic_attachment.vnic_attach_trust.*.vnic_id, 0)
//vnic_id        = oci_core_vnic_attachment.example_vnic_attachment.vnic_id

//  display_name   = "fgtactive-trust_ip"
//  hostname_label = "fgtactive-trust"
//  ip_address     = var.trust_private_ip_floating
//}


// roue table
//resource "oci_core_route_table" "trust_routetable" {
//  compartment_id = var.compartment_ocid
//  vcn_id         = oci_core_virtual_network.my_vcn.id
//  display_name   = "fgt-trust-routetable"


//Route to fortigate
//  route_rules {
//    description       = "Default Route to FGT int"
//    destination       = "0.0.0.0/0"
//    network_entity_id = oci_core_private_ip.trust_private_ip.id
//  }

//}

resource "oci_core_security_list" "internal_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt-internal-security-list"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  // allow inbound http (port 80) traffic
  ingress_security_rules {
    protocol = "all" // tcp
    source   = "0.0.0.0/0"
  }
}

###############################
## HASYNC NETWORK SETTINGS   ##
###############################


resource "oci_core_subnet" "hasync_subnet" {
  availability_domain        = lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1], "name")
  cidr_block                 = var.hasync_subnet_cidr
  display_name               = "fgt-hasync"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_virtual_network.my_vcn.id
  security_list_ids          = ["${oci_core_virtual_network.my_vcn.default_security_list_id}", "${oci_core_security_list.hasync_security_list.id}"]
  dhcp_options_id            = oci_core_virtual_network.my_vcn.default_dhcp_options_id
  dns_label                  = "fgthasync"
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_security_list" "hasync_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt-hasync-security-list"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  // allow inbound http (port 80) traffic
  ingress_security_rules {
    protocol = "all" // tcp
    source   = "0.0.0.0/0"
  }
}
