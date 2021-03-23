resource "aws_launch_template" "launch_template" {
  name          = "fgt-asg"
  key_name      = var.keyname
  image_id      = var.license_type == "byol" ? var.fgtvmbyolami[var.region] : var.fgtvmami[var.region]
  instance_type = var.size

  network_interfaces {
    device_index                = 0
    associate_public_ip_address = true
    #subnet_id = aws_subnet.publicsubnetaz1.id
    subnet_id       = aws_subnet.privatesubnetaz1.id
    security_groups = [aws_security_group.allow_all.id]
  }

  user_data = base64encode(data.template_file.ASGFGT.rendered)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ASG-FGT-instance"
    }
  }
}

resource "aws_autoscaling_policy" "cpu_policy_up" {
  name                   = "cpu_scale_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.fgtvm-asg.name
}

resource "aws_autoscaling_policy" "cpu_policy_down" {
  name                   = "cpu_scale_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.fgtvm-asg.name
}

resource "aws_cloudwatch_metric_alarm" "fgt_cpu_alarm_down" {
  alarm_name          = "fgt_cpu_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "20"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.fgtvm-asg.name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.cpu_policy_down.arn]
}

resource "aws_cloudwatch_metric_alarm" "fgt_cpu_alarm_up" {
  alarm_name          = "fgt_cpu_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.fgtvm-asg.name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [aws_autoscaling_policy.cpu_policy_up.arn]
}

resource "aws_autoscaling_group" "fgtvm-asg" {
  name               = "fgtvm-asg"
  availability_zones = [var.az1]
  desired_capacity   = var.scaledesire
  max_size           = var.scalemax
  min_size           = var.scalemin

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.fgt_target.arn]
}

data "template_file" "ASGFGT" {
  template = "${file("${var.bootstrap-fgtvmasg}")}"
  vars = {
    type         = "${var.license_type}"
    license_file = "${var.license2}"
    adminsport   = "${var.adminsport}"
    cs1vpc       = "${var.csvpccidr}"
    cs2vpc       = "${var.cs2vpccidr}"
    endpointip   = "${data.aws_network_interface.vpcendpointip.private_ip}"
  }
}

