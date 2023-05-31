# Output
output "FortiGate-HA-Cluster-IP" {
  value = google_compute_instance.default.network_interface.0.access_config.*.nat_ip
}
output "FortiGate-HA-Active-MGMT-IP" {
  value = google_compute_instance.default.network_interface.3.access_config.0.nat_ip
}
output "FortiGate-HA-Passive-MGMT-IP" {
  value = google_compute_instance.default2.network_interface.3.access_config.0.nat_ip
}

output "FortiGate-Username" {
  value = "admin"
}
output "FortiGate-Password" {
  value = google_compute_instance.default.instance_id
}
