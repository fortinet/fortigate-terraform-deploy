module "network_lb" {
  source            = "./modules/nlb"
  prefix            = "external"
  prefix2           = "internal"
  subnet_id         = aws_subnet.publicsubnet.id
  subnet2_id        = aws_subnet.privatesubnet.id
  allocation_id     = aws_eip.LBPublicIP.id
  vpc_id            = aws_vpc.fgtvm-vpc.id
  target1_id        = var.activeport1
  target2_id        = var.passiveport1
  healthport        = var.adminsport
  forwarding_config = var.test_forwarding_config
}
