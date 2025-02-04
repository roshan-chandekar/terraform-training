resource "aws_lb" "test_elb" {
  name               = var.elb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets           = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = var.elb_name
  }
}

resource "aws_lb_target_group" "test_tg" {
  name     = "test-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.test_elb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2_attachment" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.test_tg.arn
  target_id        = var.instance_ids[count.index]
  port            = 80
}

