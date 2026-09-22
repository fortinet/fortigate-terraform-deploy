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

resource "google_compute_image" "fgtvmgvnic" {
  count = var.nictype == "GVNIC" ? 1 : 0
  name  = "fgtvmgvnic-image"

  source_image = var.image

  guest_os_features {
    type = var.nictype
  }
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
### HA Sync /MGMT Subnet ###
resource "google_compute_subnetwork" "ha_subnet" {
  name          = "sync-subnet-${random_string.random_name_post.result}"
  region        = var.region
  network       = google_compute_network.vpc_network3.name
  ip_cidr_range = var.ha_subnet
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

# Firewall Rule HA SYNC/HA MGMT
resource "google_compute_firewall" "allow-sync" {
  name    = "allow-sync-${random_string.random_name_post.result}"
  network = google_compute_network.vpc_network3.name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-sync"]
}

# Create static cluster ip
resource "google_compute_address" "static" {
  name = "cluster-ip-${random_string.random_name_post.result}"
}

# Create static forwarding public ip
resource "google_compute_address" "forward" {
  name = "forwarding-ip-${random_string.random_name_post.result}"
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

  tags = ["allow-fgt", "allow-internal", "allow-sync"]

  boot_disk {
    initialize_params {
      image = var.nictype == "GVNIC" ? google_compute_image.fgtvmgvnic[0].self_link : var.image
    }
  }
  attached_disk {
    source = google_compute_disk.logdisk.name
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name
    nic_type   = var.nictype
    network_ip = var.active_port1_ip
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.name
    nic_type   = var.nictype
    network_ip = var.active_port2_ip
  }

  network_interface {
    subnetwork = google_compute_subnetwork.ha_subnet.name
    nic_type   = var.nictype
    network_ip = var.active_port3_ip
    access_config {
      nat_ip = google_compute_address.static2.address
    }
  }

  metadata = {
    user-data = templatefile("${path.module}/active", {
      active_port1_ip      = var.active_port1_ip
      active_port1_mask    = var.active_port1_mask
      active_port2_ip      = var.active_port2_ip
      active_port2_mask    = var.active_port2_mask
      active_port3_ip      = var.active_port3_ip
      active_port3_mask    = var.active_port3_mask
      hamgmt_gateway_ip    = var.mgmt_gateway //  hamgmt gateway ip
      protected_subnet     = var.protected_subnet
      protected_gateway_ip = google_compute_subnetwork.private_subnet.gateway_address
      public_subnet        = var.public_subnet
      passive_hb_ip        = var.passive_port3_ip // passive hb ip
      hb_netmask           = var.mgmt_mask        // mgmt netmask
      port1_gateway        = google_compute_subnetwork.public_subnet.gateway_address
      clusterip            = "cluster-ip-${random_string.random_name_post.result}"
      internalroute        = "internal-route-${random_string.random_name_post.result}"
      forwardrule          = "fgt-forwarding-rule"
      forwardtarget        = "fgt-target-${random_string.random_name_post.result}"
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

  tags = ["allow-fgt", "allow-internal", "allow-sync"]

  boot_disk {
    initialize_params {
      image = var.nictype == "GVNIC" ? google_compute_image.fgtvmgvnic[0].self_link : var.image
    }
  }
  attached_disk {
    source = google_compute_disk.logdisk2.name
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name
    nic_type   = var.nictype
    network_ip = var.passive_port1_ip
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.name
    nic_type   = var.nictype
    network_ip = var.passive_port2_ip
  }
  network_interface {
    subnetwork = google_compute_subnetwork.ha_subnet.name
    nic_type   = var.nictype
    network_ip = var.passive_port3_ip
    access_config {
      nat_ip = google_compute_address.static3.address
    }
  }
  metadata = {
    user-data = templatefile("${path.module}/passive", {
      passive_port1_ip     = var.passive_port1_ip
      passive_port1_mask   = var.passive_port1_mask
      passive_port2_ip     = var.passive_port2_ip
      passive_port2_mask   = var.passive_port2_mask
      passive_port3_ip     = var.passive_port3_ip
      passive_port3_mask   = var.passive_port3_mask
      hamgmt_gateway_ip    = var.mgmt_gateway //  hamgmt gateway ip
      protected_gateway_ip = google_compute_subnetwork.private_subnet.gateway_address
      public_subnet        = var.public_subnet
      protected_subnet     = var.protected_subnet
      active_hb_ip         = var.active_port3_ip // active hb ip
      hb_netmask           = var.mgmt_mask       // mgmt netmask
      port1_gateway        = google_compute_subnetwork.public_subnet.gateway_address
      clusterip            = "cluster-ip-${random_string.random_name_post.result}"
      internalroute        = "internal-route-${random_string.random_name_post.result}"
      forwardrule          = "fgt-forwarding-rule"
      forwardtarget        = "fgt-target2-${random_string.random_name_post.result}"
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

# target and forwarding rule
resource "google_compute_target_instance" "fgt-target" {
  name     = "fgt-target-${random_string.random_name_post.result}"
  instance = google_compute_instance.default.id
  zone     = var.zone
}

resource "google_compute_target_instance" "fgt-target2" {
  name     = "fgt-target2-${random_string.random_name_post.result}"
  instance = google_compute_instance.default2.id
  zone     = var.zone
}

resource "google_compute_forwarding_rule" "default" {
  name       = "fgt-forwarding-rule"
  target     = google_compute_target_instance.fgt-target.id
  ip_address = google_compute_address.forward.address
  port_range = "443"
  region     = var.region
}
