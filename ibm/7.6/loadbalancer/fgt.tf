# Randomize string to avoid duplication
resource "random_string" "random_name_post" {
  length           = 3
  special          = true
  override_special = ""
  min_lower        = 3
}

resource "ibm_is_image" "vnf_custom_image" {
  href             = var.image
  name             = "terraform-image-${random_string.random_name_post.result}"
  operating_system = "ubuntu-18-04-amd64"

  timeouts {
    create = "60m"
    delete = "20m"
  }
}

resource "ibm_is_ssh_key" "sshkey" {
  name       = "ssh-${random_string.random_name_post.result}"
  public_key = file(var.ssh_public_key)
}

resource "ibm_is_volume" "testacc_volume" {
  name    = "logdisk-${random_string.random_name_post.result}"
  profile = "10iops-tier"
  zone    = var.zone1
}

resource "ibm_is_volume" "testacc_volume2" {
  name    = "logdisk2-${random_string.random_name_post.result}"
  profile = "10iops-tier"
  zone    = var.zone1
}


resource "ibm_is_floating_ip" "publicip" {
  name   = "publicip-${random_string.random_name_post.result}"
  target = ibm_is_instance.fgt1.primary_network_interface[0].id
}


resource "ibm_is_floating_ip" "publicip2" {
  name   = "publicip2-${random_string.random_name_post.result}"
  target = ibm_is_instance.fgt2.primary_network_interface[0].id
}


resource "ibm_is_instance" "fgt1" {
  name    = "fgt1-${random_string.random_name_post.result}"
  image   = ibm_is_image.vnf_custom_image.id
  profile = var.profile

  primary_network_interface {
    name            = "fgtaport1"
    subnet          = ibm_is_subnet.subnet1.id
    security_groups = [ibm_is_security_group.fgt_security_group.id]
    primary_ip {
      address = var.fgtaport1
    }
  }

  network_interfaces {
    allow_ip_spoofing = "true"
    name            = "fgtaport2"
    subnet          = ibm_is_subnet.subnet2.id
    security_groups = [ibm_is_security_group.fgt_security_group.id]
    primary_ip {
      address = var.fgtaport2
    }

  }

  network_interfaces {
    allow_ip_spoofing = "true"
    name              = "fgtaport3"
    subnet            = ibm_is_subnet.subnet3.id
    security_groups   = [ibm_is_security_group.fgt_security_group.id]
    primary_ip {
      address = var.fgtaport3
    }

  }

  volumes = [ibm_is_volume.testacc_volume.id]

  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone1
  user_data = chomp(templatefile("${var.bootstrap}", {
    license_file    = "${file("${var.license}")}"
    hostname        = "fgta"
    hapriority      = "255"
    apikey          = "${var.ibmcloud_api_key}"
    port1_ip        = "${var.fgtaport1}"
    port1_mask      = "${var.fgtaport1mask}"
    port2_ip        = "${var.fgtaport2}"
    port2_mask      = "${var.fgtaport2mask}"
    port3_ip        = "${var.fgtaport3}"
    port3_mask      = "${var.fgtaport3mask}"
    preshare        = "${var.psk}"
    region          = var.ibmregion[var.region]
    passive_peerip  = "${var.fgtbport3}"
    mgmt_gateway_ip = "${var.fgtaport4gateway}"
    defaultgwy      = "${var.fgtaport1gateway}"
    privategwy      = "${var.fgtaport2gateway}"
  }))
  keys = [ibm_is_ssh_key.sshkey.id]
}


resource "ibm_is_instance" "fgt2" {
  name    = "fgt2-${random_string.random_name_post.result}"
  image   = ibm_is_image.vnf_custom_image.id
  profile = var.profile

  primary_network_interface {
    name            = "fgtbport1"
    subnet          = ibm_is_subnet.subnet1.id
    security_groups = [ibm_is_security_group.fgt_security_group.id]
    primary_ip {
      address = var.fgtbport1
    }
  }

  network_interfaces {
    allow_ip_spoofing = "true"
    name            = "fgtbport2"
    subnet          = ibm_is_subnet.subnet2.id
    security_groups = [ibm_is_security_group.fgt_security_group.id]
    primary_ip {
      address = var.fgtbport2
    }
  }

  network_interfaces {
    allow_ip_spoofing = "true"
    name              = "fgtbport3"
    subnet            = ibm_is_subnet.subnet3.id
    security_groups   = [ibm_is_security_group.fgt_security_group.id]
    primary_ip {
      address = var.fgtbport3
    }
  }

  volumes = [ibm_is_volume.testacc_volume2.id]

  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone1
  user_data = chomp(templatefile("${var.bootstrap2}", {
    license_file    = "${file("${var.license2}")}"
    hostname        = "fgtb"
    hapriority      = "1"
    apikey          = "${var.ibmcloud_api_key}"
    port1_ip        = "${var.fgtbport1}"
    port1_mask      = "${var.fgtbport1mask}"
    port2_ip        = "${var.fgtbport2}"
    port2_mask      = "${var.fgtbport2mask}"
    port3_ip        = "${var.fgtbport3}"
    port3_mask      = "${var.fgtbport3mask}"
    preshare        = "${var.psk}"
    region          = var.ibmregion[var.region]
    passive_peerip  = "${var.fgtaport3}"
    mgmt_gateway_ip = "${var.fgtbport4gateway}"
    defaultgwy      = "${var.fgtbport1gateway}"
    privategwy      = "${var.fgtbport2gateway}"
  }))

  keys = [ibm_is_ssh_key.sshkey.id]
}
