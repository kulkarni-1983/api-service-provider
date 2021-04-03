resource "aws_lb" "main" {
  name = "${var.resource_prefix}-alb"

  internal = var.is_private_network
  # use private or public subnets from remote state
  subnets = local.subnets

  # default the load balancer to "application"
  load_balancer_type = "application"

  # security group to allow incoming connection
  security_groups = list(aws_security_group.alb.id)

  tags = var.tags
}

# redirect http 80 to https 443
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      status_code  = "400"
    }
  }
}

resource "aws_security_group" "alb" {
  name        = "${var.resource_prefix}-alb-sg"
  description = "Allow inbound http on 80 from vpc"
  tags        = var.tags

  vpc_id = var.vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = list(var.vpc.cidr_block)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = list("0.0.0.0/0")
  }
}
