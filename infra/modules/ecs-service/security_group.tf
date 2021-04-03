resource "aws_security_group" "ecs_task" {
  name = "${var.resource_prefix}-task-sg"
  tags = var.tags

  vpc_id = var.vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = var.container_port
    to_port     = var.container_port
    cidr_blocks = list(var.vpc.cidr_block)
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = list("0.0.0.0/0")
  }
}
