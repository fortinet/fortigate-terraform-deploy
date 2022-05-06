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

resource "ibm_is_floating_ip" "publicip" {
  name   = "publicip"
  target = ibm_is_instance.fgt1.primary_network_interface[0].id
}

resource "ibm_is_instance" "fgt1" {
  name  = "fgt1"
  image = ibm_is_image.vnf_custom_image.id
  //image   = var.image
  profile = var.profile

  primary_network_interface {
    name            = "port1"
    subnet          = ibm_is_subnet.subnet1.id
    security_groups = [ibm_is_security_group.fgt_security_group.id]
  }

  network_interfaces {
    name            = "port2"
    subnet          = ibm_is_subnet.subnet2.id
    security_groups = [ibm_is_security_group.fgt_security_group.id]
  }

  volumes = [ibm_is_volume.testacc_volume.id]

  vpc       = ibm_is_vpc.vpc1.id
  zone      = var.zone1
  user_data = data.template_file.userdata.rendered
  keys      = [ibm_is_ssh_key.sshkey.id]
}


// Use for bootstrapping cloud-init
data "template_file" "userdata" {
  template = file("${var.bootstrap}")

  vars = {
    license_file = "${file("${var.license}")}"
  }

}

