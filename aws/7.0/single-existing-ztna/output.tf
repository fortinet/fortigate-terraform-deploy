
output "FGTPublicIP" {
  value = aws_eip.FGTPublicIP.public_ip
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = aws_instance.fgtvm.id
}


output "LocalUsername" {
  value = var.username
}

output "LocalUserpassword" {
  value = var.password
}

output "FGTGUIURL" {
  value = format("%s%s%s%s%s", "https://", aws_eip.FGTPublicIP.public_ip, ":", var.adminsport, "/")
}

output "FGTZTNAURL" {
  value = format("%s%s%s", "https://", aws_eip.FGTPublicIP.public_ip, ":9443/")
}

