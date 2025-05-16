output "fgtpublicip" {
  value = join("", tolist(["https://", "${ibm_is_floating_ip.publicip.address}", ":8443"]))
}

output "fgt2publicip" {
  value = join("", tolist(["https://", "${ibm_is_floating_ip.publicip2.address}", ":8443"]))
}

output "FGTLBPublicIP" {
  value = join("", tolist(["https://", "${ibm_is_lb.ext-lb.public_ips[0]}"]))
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = ibm_is_instance.fgt1.id
}
