####################################
## NETWORK SETTINGS              ##
###################################


resource "oci_core_virtual_network" "my_vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "fgt001-vcn"
  dns_label      = "fgt001vcn"
}


####################################
## PUBLIC NETWORK SETTINGS       ##
###################################

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  display_name   = "fgt001-igw"
  vcn_id         = oci_core_virtual_network.my_vcn.id
}

resource "oci_core_route_table" "public_routetable" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt001-public-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}
resource "oci_core_subnet" "public_subnet" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1], "name")
  cidr_block          = var.public_subnet_cidr
  display_name        = "fgt001-public"
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn.id
  route_table_id      = oci_core_route_table.public_routetable.id
  security_list_ids   = ["${oci_core_virtual_network.my_vcn.default_security_list_id}", "${oci_core_security_list.public_security_list.id}"]
  dhcp_options_id     = oci_core_virtual_network.my_vcn.default_dhcp_options_id
  dns_label           = "fgt001public"
}

resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt001-public-security-list"

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
  display_name        = "fgt001-trust"
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn.id
  //  route_table_id             = "${oci_core_route_table.trust_routetable.id}"
  security_list_ids          = ["${oci_core_virtual_network.my_vcn.default_security_list_id}", "${oci_core_security_list.public_security_list.id}"]
  dhcp_options_id            = oci_core_virtual_network.my_vcn.default_dhcp_options_id
  dns_label                  = "fgt001trust"
  prohibit_public_ip_on_vnic = true
}


// route table attachment
resource "oci_core_route_table_attachment" "trust_route_table_attachment" {
  subnet_id      = oci_core_subnet.trust_subnet.id
  route_table_id = oci_core_route_table.trust_routetable.id
}

// roue table
resource "oci_core_route_table" "trust_routetable" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt001-trust-routetable"
}

// nic attachment
resource "oci_core_vnic_attachment" "vnic_attach_trust" {
  instance_id  = oci_core_instance.vm.id
  display_name = "fgt001-vnic_trust"

  create_vnic_details {
    subnet_id              = oci_core_subnet.trust_subnet.id
    display_name           = "fgt001-vnic_trust"
    assign_public_ip       = false
    skip_source_dest_check = true
    private_ip             = var.trust_private_ip_primary
  }
}

resource "oci_core_security_list" "trust_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt001-trust-security-list"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  // allow inbound traffic on all ports from network
  ingress_security_rules {
    protocol = "all" // all protocols
    source   = "0.0.0.0/0"
  }
}

// create FortiGate instance
resource "oci_core_instance" "vm" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1], "name")
  compartment_id      = var.compartment_ocid
  display_name        = "fgt003-vm"
  shape               = var.instance_shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.public_subnet.id
    display_name     = "fgt001-vm-vnic"
    assign_public_ip = true
    hostname_label   = "fgt001-vm-vnic"
  }

  source_details {
    source_type             = "image"
    source_id               = local.mp_listing_resource_id // marketplace listing
    boot_volume_size_in_gbs = "50"
  }

  // Required for bootstrapp
  // Commnet out the following if you use the feature.
  metadata = {
    user_data = "${base64encode(data.template_file.userdata_lic.rendered)}"
  }

  timeouts {
    create = "60m"
  }
}

// For bootstrapping cloud-init
data "template_file" "userdata_lic" {
  template = file("${var.bootstrap}")

  vars = {
    license_file = "${file("${var.license}")}"
    port2_ip     = "${var.trust_private_ip_primary}"
    port2_mask   = "${var.trust_private_mask}"
  }
}


