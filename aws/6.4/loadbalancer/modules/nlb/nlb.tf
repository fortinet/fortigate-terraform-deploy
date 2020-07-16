
resource "aws_lb" "external-lb" {
  name               = "${var.prefix}lb"
  load_balancer_type = "network"

  subnet_mapping {
    subnet_id     = var.subnet_id
    allocation_id = var.allocation_id
  }
}

resource "aws_lb" "internal-lb" {
  name               = "${var.prefix2}lb"
  load_balancer_type = "network"


  subnet_mapping {
    subnet_id = var.subnet2_id
  }

}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.external-lb.arn
  for_each          = var.forwarding_config
  port              = each.key
  protocol          = each.value
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end[each.key].arn
  }
}


resource "aws_lb_listener" "listener2" {
  load_balancer_arn = aws_lb.internal-lb.arn
  for_each          = var.forwarding_config
  port              = each.key
  protocol          = each.value
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end2[each.key].arn
  }
}



resource "aws_lb_target_group" "front_end" {
  for_each    = var.forwarding_config
  name        = "${var.prefix}-lb-target-${each.key}"
  port        = each.key
  protocol    = each.value
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    interval = 30
    protocol = each.value
    port     = var.healthport
  }
}


resource "aws_lb_target_group" "front_end2" {
  for_each    = var.forwarding_config
  name        = "${var.prefix2}-lb-target-${each.key}"
  port        = each.key
  protocol    = each.value
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    interval = 30
    protocol = each.value
    port     = var.healthport
  }
}


resource "aws_lb_target_group_attachment" "target1" {
  for_each         = var.forwarding_config
  depends_on       = [aws_lb_target_group.front_end]
  target_group_arn = aws_lb_target_group.front_end[each.key].arn
  target_id        = var.target1_id
}


resource "aws_lb_target_group_attachment" "target2" {
  for_each         = var.forwarding_config
  depends_on       = [aws_lb_target_group.front_end]
  target_group_arn = aws_lb_target_group.front_end[each.key].arn
  target_id        = var.target2_id
}
