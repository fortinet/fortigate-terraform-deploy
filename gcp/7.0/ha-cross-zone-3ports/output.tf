# Output
output "FortiGate-HA-Cluster-IP" {
  value = google_compute_instance.default.network_interface.0.access_config.*.nat_ip
}
output "FortiGate-HA-Master-MGMT-IP" {
  value = google_compute_instance.default.network_interface.2.access_config.0.nat_ip
}
output "FortiGate-HA-Slave-MGMT-IP" {
  value = google_compute_instance.default2.network_interface.2.access_config.0.nat_ip
}

output "FortiGate-Username" {
  value = "admin"
}
output "FortiGate-Password" {
  value = google_compute_instance.default.instance_id
}

output "Fowarding-IP-Address" {
  value = google_compute_forwarding_rule.default.ip_address
}
