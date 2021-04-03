resource "aws_iam_role" "execution_role" {
  name        = "${var.resource_prefix}-execution-role"
  description = "Execution role for the ${var.resource_prefix}-service"
  tags        = var.tags

  assume_role_policy = data.template_file.assume_role_policy.rendered
}

data "template_file" "assume_role_policy" {
  template = file("${path.module}/src/assume_role_policy.json")
}

data "template_file" "ecr_task_execution_policy" {
  template = file("${path.module}/src/ecr_policy.json")
}

resource "aws_iam_policy" "ecs_task_execution_policy" {
  name   = "${var.resource_prefix}-execution-role-policy"
  policy = data.template_file.ecr_task_execution_policy.rendered
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.execution_role.name
  policy_arn = aws_iam_policy.ecs_task_execution_policy.arn
}

resource "aws_iam_role" "task_role" {
  name        = "${var.resource_prefix}-task-role"
  description = "Task role for the ${var.resource_prefix} service"
  tags        = var.tags

  assume_role_policy = data.template_file.assume_role_policy.rendered
}

