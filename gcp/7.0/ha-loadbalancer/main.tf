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

# Create log disk for active
resource "google_compute_disk" "logdisk" {
  name = "log-disk-${random_string.random_name_post.result}"
  size = 30
  type = "pd-standard"
  zone = var.zone
}

# Create log disk for passive
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
  name                     = "public-subnet-${random_string.random_name_post.result}"
  region                   = var.region
  network                  = google_compute_network.vpc_network.name
  ip_cidr_range            = var.public_subnet
  private_ip_google_access = true
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
  next_hop_ip = var.active_port2_ip
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

# Create static cluster ip
resource "google_compute_address" "static" {
  name = "cluster-ip-${random_string.random_name_post.result}"
}

# Create static active instance management ip
resource "google_compute_address" "static2" {
  name = "activemgmt-ip-${random_string.random_name_post.result}"
}

# Create static passive instance management ip
resource "google_compute_address" "static3" {
  name = "passivemgmt-ip-${random_string.random_name_post.result}"
}

# Create FGTVM compute active instance
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
    network_ip = var.active_port1_ip
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.name
    network_ip = var.active_port2_ip
  }

  network_interface {
    subnetwork = google_compute_subnetwork.ha_subnet.name
    network_ip = var.active_port3_ip
  }

  network_interface {
    subnetwork = google_compute_subnetwork.mgmt_subnet.name
    network_ip = var.active_port4_ip
    access_config {
      nat_ip = google_compute_address.static2.address
    }
  }

  metadata = {
    user-data = templatefile("${path.module}/active", {
      active_port1_ip   = var.active_port1_ip
      active_port1_mask = var.active_port1_mask
      active_port2_ip   = var.active_port2_ip
      active_port2_mask = var.active_port2_mask
      active_port3_ip   = var.active_port3_ip
      active_port3_mask = var.active_port3_mask
      active_port4_ip   = var.active_port4_ip
      active_port4_mask = var.active_port4_mask
      hamgmt_gateway_ip = var.mgmt_gateway     //  hamgmt gateway ip
      passive_hb_ip     = var.passive_port3_ip // passive hb ip
      hb_netmask        = var.mgmt_mask        // mgmt netmask
      port1_gateway     = google_compute_subnetwork.public_subnet.gateway_address
      port2_gateway     = google_compute_subnetwork.private_subnet.gateway_address
      clusterip         = "cluster-ip-${random_string.random_name_post.result}"
      internalroute     = "internal-route-${random_string.random_name_post.result}"
      private_subnet    = var.protected_subnet
      fgt_public_ip     = "${google_compute_forwarding_rule.default.ip_address}"
    })
    license = fileexists("${path.module}/${var.licenseFile}") ? "${file(var.licenseFile)}" : null
  }
  service_account {
    scopes = ["userinfo-email", "compute-rw", "storage-ro", "cloud-platform"]
  }
  scheduling {
    preemptible       = false
    automatic_restart = false
  }
}

# Create FGTVM compute passive instance
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
    network_ip = var.passive_port1_ip
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.name
    network_ip = var.passive_port2_ip
  }
  network_interface {
    subnetwork = google_compute_subnetwork.ha_subnet.name
    network_ip = var.passive_port3_ip
  }
  network_interface {
    subnetwork = google_compute_subnetwork.mgmt_subnet.name
    network_ip = var.passive_port4_ip
    access_config {
      nat_ip = google_compute_address.static3.address
    }
  }
  metadata = {
    user-data = templatefile("${path.module}/passive", {
      passive_port1_ip   = var.passive_port1_ip
      passive_port1_mask = var.passive_port1_mask
      passive_port2_ip   = var.passive_port2_ip
      passive_port2_mask = var.passive_port2_mask
      passive_port3_ip   = var.passive_port3_ip
      passive_port3_mask = var.passive_port3_mask
      passive_port4_ip   = var.passive_port4_ip
      passive_port4_mask = var.passive_port4_mask
      hamgmt_gateway_ip  = var.mgmt_gateway    //  hamgmt gateway ip
      active_hb_ip       = var.active_port3_ip // active hb ip
      hb_netmask         = var.mgmt_mask       // mgmt netmask
      port1_gateway      = google_compute_subnetwork.public_subnet.gateway_address
      port2_gateway      = google_compute_subnetwork.private_subnet.gateway_address
      clusterip          = "cluster-ip-${random_string.random_name_post.result}"
      internalroute      = "internal-route-${random_string.random_name_post.result}"
      private_subnet     = var.protected_subnet
      fgt_public_ip      = "${google_compute_forwarding_rule.default.ip_address}"
    })
    license = fileexists("${path.module}/${var.licenseFile2}") ? "${file(var.licenseFile2)}" : null
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
output "Load-Balancer-IP" {
  value = google_compute_forwarding_rule.default.ip_address
}
output "FortiGate-HA-Cluster-IP" {
  value = google_compute_address.static.address
  #value = google_compute_instance.default.network_interface.0.access_config.*.nat_ip
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

