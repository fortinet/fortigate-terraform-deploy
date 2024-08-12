
data "alicloud_regions" "current_region_ds" {
  current = true
}

data "alicloud_zones" "default" {
}

//Random 3 char string appended to the ened of each name to avoid conflicts
resource "random_string" "random_name_post" {
  length           = 3
  special          = true
  override_special = ""
  min_lower        = 3
}

resource "alicloud_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  vpc_name   = "${random_string.random_name_post.result}-vpc"
}

resource "alicloud_vswitch" "vsw_external" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_cidr_ext
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = "terraform-ext"
}

resource "alicloud_vswitch" "vsw_internal" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_cidr_int
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = "terraform-int"
}

resource "alicloud_vswitch" "vsw_hasync" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_cidr_hasync
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = "terraform-sync"
}

resource "alicloud_vswitch" "vsw_hamgmt" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_cidr_hamgmt
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = "terraform-mgmt"
}

// route table
resource "alicloud_route_table" "intrt" {
  depends_on       = [alicloud_vswitch.vsw_internal]
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "int-rt"
  description      = "internal route table"
}

resource "alicloud_route_table_attachment" "rtattach" {
  depends_on     = [alicloud_route_table.intrt]
  vswitch_id     = alicloud_vswitch.vsw_internal.id
  route_table_id = alicloud_route_table.intrt.id
}

// Egress Route to Fortigate
resource "alicloud_route_entry" "egress" {
  depends_on            = [alicloud_route_table.intrt]
  route_table_id        = alicloud_route_table.intrt.id
  destination_cidrblock = var.default_egress_route
  nexthop_type          = "NetworkInterface"
  nexthop_id            = alicloud_ecs_network_interface.FortiGateInterface.id
}

//Security Group
resource "alicloud_security_group" "SecGroup" {
  name        = "SecGroup-${random_string.random_name_post.result}"
  description = "New security group"
  vpc_id      = alicloud_vpc.vpc.id
}

//Allow All TCP Ingress for Firewall
resource "alicloud_security_group_rule" "allow_all_tcp_ingress" {
  type              = "ingress"
  description       = "ingress sg"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "-1/-1"
  priority          = 1
  security_group_id = alicloud_security_group.SecGroup.id
  cidr_ip           = "0.0.0.0/0"
}

//Allow All TCP Egress Traffic - ESS
resource "alicloud_security_group_rule" "allow_all_tcp_egress" {
  type              = "egress"
  description       = "egress sg"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "-1/-1"
  priority          = 1
  security_group_id = alicloud_security_group.SecGroup.id
  cidr_ip           = "0.0.0.0/0"
}

data "template_file" "setupfgt" {
  template = file("${path.module}/fgtconfig.conf")
  vars = {
    region          = "${var.region}",
    type            = "${var.license_type}"
    license_file    = "${var.license}"
    hostname        = "fgt-a"
    hapriority      = "255"
    port1_ip        = "${var.activeport1}"
    port1_mask      = "${var.activeport1mask}"
    port2_ip        = "${var.activeport2}"
    port2_mask      = "${var.activeport2mask}"
    port3_ip        = "${var.activeport3}"
    port3_mask      = "${var.activeport3mask}"
    passive_peerip  = "${var.passiveport3}"
    mgmt_gateway_ip = "${var.activeport3gateway}"
    defaultgwy      = "${var.activeport1gateway}"
    privategwy      = "${var.activeport2gateway}"
    vpc_ip          = cidrhost(var.vpc_cidr, 0)
    vpc_mask        = cidrnetmask(var.vpc_cidr)
    adminsport      = "${var.adminsport}"
  }
}

data "template_file" "setupfgt2" {
  template = file("${path.module}/fgtconfig.conf")
  vars = {
    region          = "${var.region}",
    type            = "${var.license_type}"
    license_file    = "${var.license2}"
    hostname        = "fgt-b"
    hapriority      = "1"
    port1_ip        = "${var.passiveport1}"
    port1_mask      = "${var.passiveport1mask}"
    port2_ip        = "${var.passiveport2}"
    port2_mask      = "${var.passiveport2mask}"
    port3_ip        = "${var.passiveport3}"
    port3_mask      = "${var.passiveport3mask}"
    passive_peerip  = "${var.activeport3}"
    mgmt_gateway_ip = "${var.activeport3gateway}"
    defaultgwy      = "${var.activeport1gateway}"
    privategwy      = "${var.activeport2gateway}"
    vpc_ip          = cidrhost(var.vpc_cidr, 0)
    vpc_mask        = cidrnetmask(var.vpc_cidr)
    adminsport      = "${var.adminsport}"
  }
}

resource "alicloud_instance" "Fortigate" {
  depends_on           = [alicloud_ecs_network_interface.FortiGateInterface]
  availability_zone    = data.alicloud_zones.default.zones.0.id
  security_groups      = alicloud_security_group.SecGroup.*.id
  image_id             = length(var.instance_ami) > 1 ? var.instance_ami : data.alicloud_images.ecs_image.images.0.id
  instance_type        = data.alicloud_instance_types.types_ds.instance_types.0.id
  system_disk_category = "cloud_efficiency"
  instance_name        = "FortiGate-${random_string.random_name_post.result}-A"
  vswitch_id           = alicloud_vswitch.vsw_external.id
  user_data            = data.template_file.setupfgt.rendered
  private_ip           = var.activeport1
  role_name            = var.iam

  //Logging Disk
  data_disks {
    size                 = 30
    category             = "cloud_ssd"
    delete_with_instance = true
  }
}

// EIP for cluster
resource "alicloud_eip_address" "pipcluster" {
  address_name         = "pip-cluster"
  isp                  = "BGP"
  internet_charge_type = "PayByBandwidth"
  payment_type         = "PayAsYouGo"
}

resource "alicloud_eip_association" "clusterpip" {
  allocation_id = alicloud_eip_address.pipcluster.id
  instance_id   = alicloud_instance.Fortigate.id
}

// internal port 
resource "alicloud_ecs_network_interface" "FortiGateInterface" {
  description            = "fgta internal port"
  network_interface_name = "fgtaint-${random_string.random_name_post.result}"
  vswitch_id             = alicloud_vswitch.vsw_internal.id
  primary_ip_address     = var.activeport2
  security_group_ids     = ["${alicloud_security_group.SecGroup.id}"]
}

// attachment
resource "alicloud_ecs_network_interface_attachment" "Fortigateattachment" {
  instance_id          = alicloud_instance.Fortigate.id
  network_interface_id = alicloud_ecs_network_interface.FortiGateInterface.id
}

// hasync port 
resource "alicloud_ecs_network_interface" "FortiGateInterfacesync" {
  description            = "fgta sync port"
  network_interface_name = "fgtasync-${random_string.random_name_post.result}"
  vswitch_id             = alicloud_vswitch.vsw_hasync.id
  primary_ip_address     = var.activeport3
  security_group_ids     = ["${alicloud_security_group.SecGroup.id}"]
}

// attachment
resource "alicloud_ecs_network_interface_attachment" "Fortigateattachmentsync" {
  depends_on           = [alicloud_ecs_network_interface_attachment.Fortigateattachment]
  instance_id          = alicloud_instance.Fortigate.id
  network_interface_id = alicloud_ecs_network_interface.FortiGateInterfacesync.id
}

// FortiGate 2
resource "alicloud_instance" "Fortigate2" {
  depends_on           = [alicloud_ecs_network_interface.FortiGateInterface]
  availability_zone    = data.alicloud_zones.default.zones.0.id
  security_groups      = alicloud_security_group.SecGroup.*.id
  image_id             = length(var.instance_ami) > 1 ? var.instance_ami : data.alicloud_images.ecs_image.images.0.id
  instance_type        = data.alicloud_instance_types.types_ds.instance_types.0.id
  system_disk_category = "cloud_efficiency"
  instance_name        = "FortiGate-${random_string.random_name_post.result}-B"
  vswitch_id           = alicloud_vswitch.vsw_external.id
  user_data            = data.template_file.setupfgt2.rendered
  private_ip           = var.passiveport1
  role_name            = var.iam

  //Logging Disk
  data_disks {
    size                 = 30
    category             = "cloud_ssd"
    delete_with_instance = true
  }
}

resource "alicloud_ecs_network_interface" "FortiGateBInterface" {
  description            = "fgtb internal port"
  network_interface_name = "fgtbint-${random_string.random_name_post.result}"
  vswitch_id             = alicloud_vswitch.vsw_internal.id
  primary_ip_address     = var.passiveport2
  security_group_ids     = ["${alicloud_security_group.SecGroup.id}"]
}

// attachment
resource "alicloud_ecs_network_interface_attachment" "Fortigatebattachment" {
  instance_id          = alicloud_instance.Fortigate2.id
  network_interface_id = alicloud_ecs_network_interface.FortiGateBInterface.id
}

// hasync port 
resource "alicloud_ecs_network_interface" "FortiGateBInterfacesync" {
  description            = "fgtb sync port"
  network_interface_name = "fgtbsync-${random_string.random_name_post.result}"
  vswitch_id             = alicloud_vswitch.vsw_hasync.id
  primary_ip_address     = var.passiveport3
  security_group_ids     = ["${alicloud_security_group.SecGroup.id}"]
}

// attachment
resource "alicloud_ecs_network_interface_attachment" "FortigateBattachmentsync" {
  depends_on           = [alicloud_ecs_network_interface_attachment.Fortigatebattachment]
  instance_id          = alicloud_instance.Fortigate2.id
  network_interface_id = alicloud_ecs_network_interface.FortiGateBInterfacesync.id
}



// EIP for active mgmt
resource "alicloud_eip_address" "pipmgmtactive" {
  address_name         = "pip-mgmt-active"
  isp                  = "BGP"
  internet_charge_type = "PayByBandwidth"
  payment_type         = "PayAsYouGo"
}

// EIP for passive mgmt
resource "alicloud_eip_address" "pipmgmtpassive" {
  address_name         = "pip-mgmt-passive"
  isp                  = "BGP"
  internet_charge_type = "PayByBandwidth"
  payment_type         = "PayAsYouGo"
}


resource "alicloud_eip_association" "activepip" {
  allocation_id      = alicloud_eip_address.pipmgmtactive.id
  instance_id        = alicloud_ecs_network_interface.FortiGateInterfacesync.id
  instance_type      = "NetworkInterface"
  private_ip_address = var.activeport3
}

resource "alicloud_eip_association" "passivepip" {
  allocation_id      = alicloud_eip_address.pipmgmtpassive.id
  instance_id        = alicloud_ecs_network_interface.FortiGateBInterfacesync.id
  instance_type      = "NetworkInterface"
  private_ip_address = var.passiveport3
}





