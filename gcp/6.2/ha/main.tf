### GCP terraform for HA setup
terraform {
  required_version = ">=0.12.0"
  required_providers {
    google      = ">=2.11.0"
    google-beta = ">=2.13"
  }
}
provider "google" {
  project      = var.project
  region       = var.region
  zone         = var.zone
  access_token = var.token
}
provider "google-beta" {
  project      = var.project
  region       = var.region
  zone         = var.zone
  access_token = var.token
}

# Randomize string to avoid duplication
resource "random_string" "random_name_post" {
  length           = 3
  special          = true
  override_special = ""
  min_lower        = 3
}

# Create log disk for master
resource "google_compute_disk" "logdisk" {
  name = "log-disk-${random_string.random_name_post.result}"
  size = 30
  type = "pd-standard"
  zone = var.zone
}

# Create log disk for slave
resource "google_compute_disk" "logdisk2" {
  name = "log-disk2-${random_string.random_name_post.result}"
  size = 30
  type = "pd-standard"
  zone = var.zone
}

########### Network Related
### VPC ###
resource "google_compute_network" "vpc_network" {
  name                    = "vpc-${random_string.random_name_post.result}"
  auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_network2" {
  name                    = "vpc2-${random_string.random_name_post.result}"
  auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_network3" {
  name                    = "vpc3-${random_string.random_name_post.result}"
  auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_network4" {
  name                    = "vpc4-${random_string.random_name_post.result}"
  auto_create_subnetworks = false
}



### Public Subnet ###
resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet-${random_string.random_name_post.result}"
  region        = var.region
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = var.public_subnet
}
### Private Subnet ###
resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet-${random_string.random_name_post.result}"
  region        = var.region
  network       = google_compute_network.vpc_network2.name
  ip_cidr_range = var.protected_subnet
}
### HA Sync Subnet ###
resource "google_compute_subnetwork" "ha_subnet" {
  name          = "sync-subnet-${random_string.random_name_post.result}"
  region        = var.region
  network       = google_compute_network.vpc_network3.name
  ip_cidr_range = var.ha_subnet
}
### HA MGMT Subnet ###
resource "google_compute_subnetwork" "mgmt_subnet" {
  name          = "mgmt-subnet-${random_string.random_name_post.result}"
  region        = var.region
  network       = google_compute_network.vpc_network4.name
  ip_cidr_range = var.mgmt_subnet
}


resource "google_compute_route" "internal" {
  name        = "internal-route-${random_string.random_name_post.result}"
  dest_range  = "0.0.0.0/0"
  network     = google_compute_network.vpc_network2.name
  next_hop_ip = var.master_port2_ip
  priority    = 100
  depends_on  = [google_compute_subnetwork.private_subnet]
}


# Firewall Rule External
resource "google_compute_firewall" "allow-fgt" {
  name    = "allow-fgt-${random_string.random_name_post.result}"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-fgt"]
}

# Firewall Rule Internal
resource "google_compute_firewall" "allow-internal" {
  name    = "allow-internal-${random_string.random_name_post.result}"
  network = google_compute_network.vpc_network2.name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-internal"]
}

# Firewall Rule HA SYNC
resource "google_compute_firewall" "allow-sync" {
  name    = "allow-sync-${random_string.random_name_post.result}"
  network = google_compute_network.vpc_network3.name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-sync"]
}

# Firewall Rule HA MGMT
resource "google_compute_firewall" "allow-mgmt" {
  name    = "allow-mgmt-${random_string.random_name_post.result}"
  network = google_compute_network.vpc_network4.name

  allow {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-mgmt"]
}

########### Instance Related

# master userdata pre-configuration
data "template_file" "setup-master" {
  template = file("${path.module}/master")
  vars = {
    master_port1_ip      = "${var.master_port1_ip}"
    master_port1_mask    = "${var.master_port1_mask}"
    master_port2_ip      = "${var.master_port2_ip}"
    master_port2_mask    = "${var.master_port2_mask}"
    master_port3_ip      = "${var.master_port3_ip}"
    master_port3_mask    = "${var.master_port3_mask}"
    master_port4_ip      = "${var.master_port4_ip}"
    master_port4_mask    = "${var.master_port4_mask}"
    hamgmt_gateway_ip    = "${var.mgmt_gateway}" //  hamgmt gateway ip
    protected_subnet     = var.protected_subnet
    protected_gateway_ip = google_compute_subnetwork.private_subnet.gateway_address
    public_subnet        = var.public_subnet
    slave_hb_ip          = "${var.slave_port3_ip}" // slave hb ip
    hb_netmask           = "${var.mgmt_mask}"      // mgmt netmask
    port1_gateway        = "${google_compute_subnetwork.public_subnet.gateway_address}"
    clusterip            = "cluster-ip-${random_string.random_name_post.result}"
    internalroute        = "internal-route-${random_string.random_name_post.result}"
  }
}

# slave userdata pre-configuration
data "template_file" "setup-slave" {
  template = file("${path.module}/slave")
  vars = {
    slave_port1_ip       = "${var.slave_port1_ip}"
    slave_port1_mask     = "${var.slave_port1_mask}"
    slave_port2_ip       = "${var.slave_port2_ip}"
    slave_port2_mask     = "${var.slave_port2_mask}"
    slave_port3_ip       = "${var.slave_port3_ip}"
    slave_port3_mask     = "${var.slave_port3_mask}"
    slave_port4_ip       = "${var.slave_port4_ip}"
    slave_port4_mask     = "${var.slave_port4_mask}"
    hamgmt_gateway_ip    = "${var.mgmt_gateway}" //  hamgmt gateway ip
    protected_gateway_ip = google_compute_subnetwork.private_subnet.gateway_address
    public_subnet        = var.public_subnet
    protected_subnet     = var.protected_subnet
    master_hb_ip         = "${var.master_port3_ip}" // master hb ip
    hb_netmask           = "${var.mgmt_mask}"       // mgmt netmask
    port1_gateway        = "${google_compute_subnetwork.public_subnet.gateway_address}"
    clusterip            = "cluster-ip-${random_string.random_name_post.result}"
    internalroute        = "internal-route-${random_string.random_name_post.result}"
  }
}

# Create static cluster ip
resource "google_compute_address" "static" {
  name = "cluster-ip-${random_string.random_name_post.result}"
}

# Create FGTVM compute master instance
resource "google_compute_instance" "default" {
  name           = "fgt-${random_string.random_name_post.result}"
  machine_type   = var.machine
  zone           = var.zone
  can_ip_forward = "true"

  tags = ["allow-fgt", "allow-internal", "allow-sync", "allow-mgmt"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  attached_disk {
    source = google_compute_disk.logdisk.name
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name
    network_ip = var.master_port1_ip
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.name
    network_ip = var.master_port2_ip
  }

  network_interface {
    subnetwork = google_compute_subnetwork.ha_subnet.name
    network_ip = var.master_port3_ip
  }

  network_interface {
    subnetwork = google_compute_subnetwork.mgmt_subnet.name
    network_ip = var.master_port4_ip
    access_config {
    }
  }

  metadata = {
    user-data = "${data.template_file.setup-master.rendered}"
    license   = "${file(var.licenseFile)}" #this is where to put the license file if using BYOL image
  }
  service_account {
    scopes = ["userinfo-email", "compute-rw", "storage-ro", "cloud-platform"]
  }
  scheduling {
    preemptible       = false
    automatic_restart = false
  }
}

# Create FGTVM compute slave instance
resource "google_compute_instance" "default2" {
  name           = "fgt-2-${random_string.random_name_post.result}"
  machine_type   = var.machine
  zone           = var.zone
  can_ip_forward = "true"

  tags = ["allow-fgt", "allow-internal", "allow-sync", "allow-mgmt"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  attached_disk {
    source = google_compute_disk.logdisk2.name
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name
    network_ip = var.slave_port1_ip
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.name
    network_ip = var.slave_port2_ip
  }
  network_interface {
    subnetwork = google_compute_subnetwork.ha_subnet.name
    network_ip = var.slave_port3_ip
  }
  network_interface {
    subnetwork = google_compute_subnetwork.mgmt_subnet.name
    network_ip = var.slave_port4_ip
    access_config {
    }
  }
  metadata = {
    user-data = "${data.template_file.setup-slave.rendered}"
    license   = "${file(var.licenseFile2)}" #this is where to put the license file if using BYOL image
  }
  service_account {
    scopes = ["userinfo-email", "compute-rw", "storage-ro", "cloud-platform"]
  }
  scheduling {
    preemptible       = false
    automatic_restart = false
  }
}





# Output
output "FortiGate-HA-Cluster-IP" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}
output "FortiGate-HA-Master-MGMT-IP" {
  value = google_compute_instance.default.network_interface.3.access_config.0.nat_ip
}
output "FortiGate-HA-Slave-MGMT-IP" {
  value = google_compute_instance.default2.network_interface.3.access_config.0.nat_ip
}

output "FortiGate-Username" {
  value = "admin"
}
output "FortiGate-Password" {
  value = google_compute_instance.default.instance_id
}

