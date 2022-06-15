###############################
## Active FortiGate-VM SETTINGS    ##
###############################
// create oci instance for active
resource "oci_core_instance" "activevm" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain - 1], "name")
  compartment_id      = var.compartment_ocid
  display_name        = "fgt-activevm"
  shape               = var.instance_shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.mgmt_subnet.id
    display_name     = "fgt-activevm-vnic_mgmt"
    assign_public_ip = true
    hostname_label   = "fgt-activevm-vnic"
    private_ip       = var.mgmt_private_ip_active
  }

  launch_options {
    network_type = "PARAVIRTUALIZED"
  }

  source_details {
    source_type = "image"
    source_id   = local.mp_listing_resource_id // marketplace listing
    //source_id = "ocid1.image.oc1.phx.aaaaaaaalvrzh6j2edqh6s42rabhbhclwgnk4owdpjhqu5qsgtur7pc4lqaa"     // private image
    boot_volume_size_in_gbs = "50"
  }

  // Required for bootstrap
  // Commnet out the following if you use the feature.
  metadata = {
    user_data = base64encode(data.template_file.userdata_lic.rendered)
  }

  timeouts {
    create = "60m"
  }
}

//  public nic attachment
resource "oci_core_vnic_attachment" "vnic_attach_public" {
  depends_on   = [oci_core_instance.activevm]
  instance_id  = oci_core_instance.activevm.id
  display_name = "fgt-activevm-vnic_public"

  create_vnic_details {
    subnet_id              = oci_core_subnet.public_subnet.id
    display_name           = "fgt-activevm-vnic_public"
    assign_public_ip       = false
    skip_source_dest_check = false
    private_ip             = var.public_private_ip_active
  }
}
data "oci_core_private_ips" "public_private_ip" {
  //ip_address = var.public_private_ip_active
  vnic_id   = element(oci_core_vnic_attachment.vnic_attach_public.*.vnic_id, 0)
  subnet_id = oci_core_subnet.public_subnet.id
}

//
resource "oci_core_public_ip" "public_public_ip" {
  depends_on     = [oci_core_vnic_attachment.vnic_attach_public]
  compartment_id = var.compartment_ocid
  lifetime       = "RESERVED"

  display_name  = "vm-public"
  private_ip_id = lookup(data.oci_core_private_ips.public_private_ip.private_ips[0], "id")
}


// trust nic attachment
resource "oci_core_vnic_attachment" "vnic_attach_trust" {
  depends_on   = [oci_core_vnic_attachment.vnic_attach_public]
  instance_id  = oci_core_instance.activevm.id
  display_name = "fgt-activevm-vnic_trust"

  create_vnic_details {
    subnet_id              = oci_core_subnet.trust_subnet.id
    display_name           = "fgt-activevm-vnic_trust"
    assign_public_ip       = false
    skip_source_dest_check = true
    private_ip             = var.trust_private_ip_active
  }
}

data "oci_core_private_ips" "fw_private_ip" {
  vnic_id   = element(oci_core_vnic_attachment.vnic_attach_trust.*.vnic_id, 0)
  subnet_id = oci_core_subnet.trust_subnet.id
}

// roue table
resource "oci_core_route_table" "trust_routetable" {
  depends_on     = [oci_core_vnic_attachment.vnic_attach_trust]
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn.id
  display_name   = "fgt-trust-routetable"


  //Route to fortigate
  route_rules {
    description       = "Default Route to FGT int"
    destination       = "0.0.0.0/0"
    network_entity_id = lookup(data.oci_core_private_ips.fw_private_ip.private_ips[0], "id")
  }
}

// Use for bootstrapping cloud-init
data "template_file" "userdata_lic" {
  template = file("${var.bootstrap-active}")

  vars = {
    license_file        = "${file("${var.license}")}"
    port1_ip            = var.mgmt_private_ip_active
    port1_mask          = var.mgmt_private_mask
    port2_ip            = var.public_private_ip_active
    port2_mask          = var.public_private_mask
    port3_ip            = var.trust_private_ip_active
    port3_mask          = var.trust_private_mask
    passive_peerip      = var.mgmt_private_ip_passive
    mgmt_gateway_ip     = oci_core_subnet.mgmt_subnet.virtual_router_ip
    public_gateway_ip   = oci_core_subnet.public_subnet.virtual_router_ip
    vcn_cidr            = var.vcn_cidr
    internal_gateway_ip = oci_core_subnet.trust_subnet.virtual_router_ip
    tenantid            = var.tenancy_ocid
    userid              = var.user_ocid
    compartid           = var.compartment_ocid
    cert                = var.cert
    region              = var.region
  }
}

