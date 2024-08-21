# Output
output "FortiGate-NATIP" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}
output "FortiGate-InstanceName" {
  value = google_compute_instance.default.name
}
output "FortiGate-Username" {
  value = "admin"
}
output "FortiGate-Password" {
  value = google_compute_instance.default.instance_id
}
