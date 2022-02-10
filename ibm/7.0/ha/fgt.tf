resource "ibm_is_image" "vnf_custom_image" {
  href             = var.image
  name             = "terraform-image"
  operating_system = "ubuntu-18-04-amd64"

  timeouts {
    create = "60m"
    delete = "20m"
  }
}

resource "ibm_is_ssh_key" "sshkey" {
  name       = "ssh1"
  public_key = file(var.ssh_public_key)
}

resource "ibm_is_volume" "testacc_volume" {
  name    = "logdisk"
  profile = "10iops-tier"
  zone    = var.zone1
}

resource "ibm_is_volume" "testacc_volume2" {
  name    = "logdisk2"
  profile = "10iops-tier"
  zone    = var.zone1
}


resource "ibm_is_floating_ip" "publicip" {
  name   = "publicip"
  target = ibm_is_instance.fgt1.primary_network_interface[0].id
}

//resource "ibm_is_floating_ip" "publicip2" {
//  name   = "publicip2"
//  target = ibm_is_instance.fgt2.primary_network_interface[0].id
//}

resource "ibm_is_instance" "fgt1" {
  name    = "fgt1"
  image   = ibm_is_image.vnf_custom_image.id
  profile = var.profile

  primary_network_interface {
    name                 = "port1"
    subnet               = ibm_is_subnet.subnet1.id
    security_groups      = [ibm_is_security_group.fgt_security_group.id]
    primary_ipv4_address = var.fgtaport1
  }

  network_interfaces {
    name                 = "port2"
    subnet               = ibm_is_subnet.subnet2.id
    security_groups      = [ibm_is_security_group.fgt_security_group.id]
    primary_ipv4_address = var.fgtaport2
  }

  network_interfaces {
    name                 = "port3"
    subnet               = ibm_is_subnet.subnet3.id
    security_groups      = [ibm_is_security_group.fgt_security_group.id]
    primary_ipv4_address = var.fgtaport3
  }

  //  network_interfaces {
  //    name                 = "port4"
  //    subnet               = ibm_is_subnet.subnet4.id
  //    security_groups      = [ibm_is_security_group.fgt_security_group.id]
  //    primary_ipv4_address = var.fgtaport4
  //  }

  volumes = [ibm_is_volume.testacc_volume.id]

  vpc       = ibm_is_vpc.vpc1.id
  zone      = var.zone1
  user_data = data.template_file.userdata.rendered
  keys      = [ibm_is_ssh_key.sshkey.id]
}


resource "ibm_is_instance" "fgt2" {
  name    = "fgt2"
  image   = ibm_is_image.vnf_custom_image.id
  profile = var.profile

  primary_network_interface {
    name                 = "fgtbport1"
    subnet               = ibm_is_subnet.subnet1.id
    security_groups      = [ibm_is_security_group.fgt_security_group.id]
    primary_ipv4_address = var.fgtbport1
  }

  network_interfaces {
    name                 = "fgtbport2"
    subnet               = ibm_is_subnet.subnet2.id
    security_groups      = [ibm_is_security_group.fgt_security_group.id]
    primary_ipv4_address = var.fgtbport2
  }

  network_interfaces {
    name                 = "fgtbport3"
    subnet               = ibm_is_subnet.subnet3.id
    security_groups      = [ibm_is_security_group.fgt_security_group.id]
    primary_ipv4_address = var.fgtbport3
  }

  //  network_interfaces {
  //    name                 = "fgtport4"
  //    subnet               = ibm_is_subnet.subnet4.id
  //    security_groups      = [ibm_is_security_group.fgt_security_group.id]
  //    primary_ipv4_address = var.fgtbport4
  //  }

  volumes = [ibm_is_volume.testacc_volume2.id]

  vpc       = ibm_is_vpc.vpc1.id
  zone      = var.zone1
  user_data = data.template_file.userdata2.rendered
  keys      = [ibm_is_ssh_key.sshkey.id]
}

// Use for bootstrapping cloud-init
data "template_file" "userdata" {
  template = file("${var.bootstrap}")

  vars = {
    license_file = "${file("${var.license}")}"
    hapriority   = "255"
    apikey       = "${var.apikey}"
    port1_ip     = "${var.fgtaport1}"
    port1_mask   = "${var.fgtaport1mask}"
    port2_ip     = "${var.fgtaport2}"
    port2_mask   = "${var.fgtaport2mask}"
    port3_ip     = "${var.fgtaport3}"
    port3_mask   = "${var.fgtaport3mask}"
    //    port4_ip        = "${var.fgtaport4}"
    //    port4_mask      = "${var.fgtaport4mask}"
    region          = var.ibmregion[var.region]
    passive_peerip  = "${var.fgtbport3}"
    mgmt_gateway_ip = "${var.fgtaport4gateway}"
    defaultgwy      = "${var.fgtaport1gateway}"
    privategwy      = "${var.fgtaport2gateway}"
  }
}

// Use for bootstrapping cloud-init
data "template_file" "userdata2" {
  template = file("${var.bootstrap}")

  vars = {
    license_file = "${file("${var.license2}")}"
    hapriority   = "1"
    apikey       = "${var.apikey}"
    port1_ip     = "${var.fgtbport1}"
    port1_mask   = "${var.fgtbport1mask}"
    port2_ip     = "${var.fgtbport2}"
    port2_mask   = "${var.fgtbport2mask}"
    port3_ip     = "${var.fgtbport3}"
    port3_mask   = "${var.fgtbport3mask}"
    //    port4_ip        = "${var.fgtbport4}"
    //    port4_mask      = "${var.fgtbport4mask}"
    region          = var.ibmregion[var.region]
    passive_peerip  = "${var.fgtaport3}"
    mgmt_gateway_ip = "${var.fgtbport4gateway}"
    defaultgwy      = "${var.fgtbport1gateway}"
    privategwy      = "${var.fgtbport2gateway}"
  }
}
