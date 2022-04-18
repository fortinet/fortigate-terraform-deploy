
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
  depends_on = [alicloud_route_table.intrt]
  // The Default Route
  route_table_id = alicloud_route_table.intrt.id
  //route_table_id        = alicloud_vpc.vpc.route_table_id
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
    region       = "${var.region}",
    type         = "${var.license_type}"
    license_file = "${var.license}"
    adminsport   = "${var.adminsport}"
  }
}

resource "alicloud_instance" "Fortigate" {
  depends_on                 = [alicloud_ecs_network_interface.FortiGateInterface]
  availability_zone          = data.alicloud_zones.default.zones.0.id
  security_groups            = alicloud_security_group.SecGroup.*.id
  image_id                   = length(var.instance_ami) > 1 ? var.instance_ami : data.alicloud_images.ecs_image.images.0.id
  instance_type              = data.alicloud_instance_types.types_ds.instance_types.0.id
  system_disk_category       = "cloud_efficiency"
  instance_name              = "FortiGate-${random_string.random_name_post.result}"
  vswitch_id                 = alicloud_vswitch.vsw_external.id
  user_data                  = data.template_file.setupfgt.rendered
  private_ip                 = var.fortigate_private_ip
  internet_max_bandwidth_out = 100

  //Logging Disk
  data_disks {
    size                 = 30
    category             = "cloud_ssd"
    delete_with_instance = true
  }
}

// internal port 
resource "alicloud_ecs_network_interface" "FortiGateInterface" {
  description            = "fgt internal port"
  network_interface_name = "PrivateENI-${random_string.random_name_post.result}"
  vswitch_id             = alicloud_vswitch.vsw_internal.id
  security_group_ids     = ["${alicloud_security_group.SecGroup.id}"]
}

// attachment
resource "alicloud_ecs_network_interface_attachment" "Fortigateattachment" {
  instance_id          = alicloud_instance.Fortigate.id
  network_interface_id = alicloud_ecs_network_interface.FortiGateInterface.id
}

