# Output
output "FGT_Active_MGMT_Public_IP" {
  value       = aws_eip.eip-mgmt1.public_ip
  description = "Public IP address for the Active FortiGate's MGMT interface"
}

output "FGT_Cluster_Public_IP" {
  value       = aws_eip.eip-shared.public_ip
  description = "Public IP address for the Cluster"
}

output "FGT_Passive_MGMT_Public_IP" {
  value       = aws_eip.eip-mgmt2.public_ip
  description = "Public IP address for the Passive FortiGate's MGMT interface"
}

output "FGT_Username" {
  value       = "admin"
  description = "Default Username for FortiGate Cluster"
}

output "FGT_Password" {
  value       = aws_instance.fgt1.id
  description = "Default Password for FortiGate Cluster"
}

output "TransitGwy_ID" {
  value       = aws_ec2_transit_gateway.TGW-XAZ.id
  description = "Transit Gateway ID"
}

output "Linux_Public_IP" {
  value       = aws_instance.instance-mgmt.public_ip
  description = "Linux Instance Public IP"
}
