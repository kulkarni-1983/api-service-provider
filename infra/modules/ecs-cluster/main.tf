resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.resource_prefix}-cluster"
  tags = var.tags
}