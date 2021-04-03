
resource "aws_alb_target_group" "target-group" {

  protocol = var.healthcheck_protocol
  port     = var.container_port
  vpc_id   = var.vpc.id
  tags     = var.tags

  # for awsvpc
  target_type = "ip"

  # Deleting of target group fails as listener rules in ALB are not deleted before destroying the tg.
  # https://github.com/terraform-providers/terraform-provider-aws/issues/636
  lifecycle {
    create_before_destroy = true
  }

  health_check {
    path                = var.healthcheck_path
    healthy_threshold   = "3"
    interval            = "60"
    protocol            = var.healthcheck_protocol
    matcher             = "200-299"
    timeout             = "5"
    unhealthy_threshold = "3"
  }
}

resource "aws_lb_listener_rule" "rule" {

  listener_arn = var.alb_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.target-group.arn
  }

  condition {
    path_pattern {
      values = [var.path_prefix]
    }
  }

  depends_on = [aws_alb_target_group.target-group]
}