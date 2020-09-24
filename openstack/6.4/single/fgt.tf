resource "openstack_compute_instance_v2" "fgt" {
  for_each          = var.flextoken
  name              = each.value.name
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  security_groups   = ["${var.security_group}"]
  availability_zone = "nova"
  user_data         = file("${var.boostrap_file}")
  config_drive      = "true"

  // For FGTVM license file
  // For Flex VM, uses License-Token
  personality {
    file    = "/content/0000"
    content = each.value.token

  }
  network {
    name = var.unprotect_network
  }

  network {
    name = var.protect_network
  }
}
