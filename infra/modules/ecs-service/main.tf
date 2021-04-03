resource "aws_ecs_service" "service" {
  name            = "${var.resource_prefix}-service"
  cluster         = var.ecs_cluster_name
  desired_count   = var.desired_count
  propagate_tags  = "TASK_DEFINITION"
  task_definition = aws_ecs_task_definition.task_definition.arn
  tags            = var.tags
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_alb_target_group.target-group.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  # required if network mode is awsvpc
  network_configuration {
    security_groups = [aws_security_group.ecs_task.id]
    subnets         = var.private_subnet_ids
  }
}

resource "aws_ecs_task_definition" "task_definition" {
  family = "${var.resource_prefix}-task-definition"

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.image_url
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory

  execution_role_arn = aws_iam_role.execution_role.arn
  task_role_arn      = aws_iam_role.task_role.arn

  tags = var.tags

}
