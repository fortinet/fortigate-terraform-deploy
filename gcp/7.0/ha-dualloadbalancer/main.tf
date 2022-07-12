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
  region       = "us-central1"
  zone         = "us-central1-c"
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
  name                     = "private-subnet-${random_string.random_name_post.result}"
  region                   = var.region
  network                  = google_compute_network.vpc_network2.name
  ip_cidr_range            = var.protected_subnet
  private_ip_google_access = true
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
  description  = "internal route to ILB"
  name         = "int-route-ilb-${random_string.random_name_post.result}"
  dest_range   = "0.0.0.0/0"
  network      = google_compute_network.vpc_network2.name
  next_hop_ilb = google_compute_forwarding_rule.internal_load_balancer.ip_address
  priority     = 100
  depends_on = [
    google_compute_subnetwork.private_subnet,
    google_compute_forwarding_rule.internal_load_balancer
  ]
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

########### Router related
resource "google_compute_router" "router" {
  name    = "my-router-${random_string.random_name_post.result}"
  region  = var.region
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat-${random_string.random_name_post.result}"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

########### Instance Related

# active userdata pre-configuration
data "template_file" "setup-active" {
  template = file("${path.module}/active")
  vars = {
    active_port1_ip          = var.active_port1_ip
    active_port1_mask        = var.active_port1_mask
    active_port2_ip          = var.active_port2_ip
    active_port2_mask        = var.active_port2_mask
    active_port3_ip          = var.active_port3_ip
    active_port3_mask        = var.active_port3_mask
    active_port4_ip          = var.active_port4_ip
    active_port4_mask        = var.active_port4_mask
    hamgmt_gateway_ip        = var.mgmt_gateway     //  hamgmt gateway ip
    passive_hb_ip            = var.passive_port3_ip // passive hb ip
    hb_netmask               = var.mgmt_mask        // mgmt netmask
    port1_gateway            = google_compute_subnetwork.public_subnet.gateway_address
    port2_gateway            = google_compute_subnetwork.private_subnet.gateway_address
    clusterip                = "cluster-ip-${random_string.random_name_post.result}"
    internalroute            = "internal-route-${random_string.random_name_post.result}"
    internal_loadbalancer_ip = google_compute_address.internal_address.address
    public_subnet            = var.public_subnet
    private_subnet           = var.protected_subnet
    fgt_public_ip            = "${google_compute_address.static.address}"
  }
}

# passive userdata pre-configuration
data "template_file" "setup-passive" {
  template = file("${path.module}/passive")
  vars = {
    passive_port1_ip         = var.passive_port1_ip
    passive_port1_mask       = var.passive_port1_mask
    passive_port2_ip         = var.passive_port2_ip
    passive_port2_mask       = var.passive_port2_mask
    passive_port3_ip         = var.passive_port3_ip
    passive_port3_mask       = var.passive_port3_mask
    passive_port4_ip         = var.passive_port4_ip
    passive_port4_mask       = var.passive_port4_mask
    hamgmt_gateway_ip        = var.mgmt_gateway    //  hamgmt gateway ip
    active_hb_ip             = var.active_port3_ip // active hb ip
    hb_netmask               = var.mgmt_mask       // mgmt netmask
    port1_gateway            = google_compute_subnetwork.public_subnet.gateway_address
    port2_gateway            = google_compute_subnetwork.private_subnet.gateway_address
    clusterip                = "cluster-ip-${random_string.random_name_post.result}"
    internalroute            = "internal-route-${random_string.random_name_post.result}"
    internal_loadbalancer_ip = google_compute_address.internal_address.address
    public_subnet            = var.public_subnet
    private_subnet           = var.protected_subnet
    fgt_public_ip            = "${google_compute_address.static.address}"
  }
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
