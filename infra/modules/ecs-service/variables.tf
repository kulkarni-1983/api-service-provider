variable "tags" {
  description = "default tags applied to the resources"
  type        = map(string)
}

variable "resource_prefix" {
  description = "prefix applied to aws resources"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster where ECS service will be attached"
  type        = string
}

variable "desired_count" {
  description = "number of tasks to be launched"
  default     = 1
}

variable "container_name" {
  description = "name of the container to be attached with target group"
  type        = string
}

variable "container_port" {
  description = "port of the container to be used for connecting from target group"
  type        = number
}

variable "image_url" {
  description = "artifact host and path of the docker image"
}

variable "task_cpu" {
  description = "CPU units for the fargate task"
}

variable "task_memory" {
  description = "Memory units for the fargate task"
}

variable "healthcheck_protocol" {
  description = "HTTP or HTTPS for health check"
  default     = "HTTP"
}

variable "healthcheck_path" {
  description = "path the contianer to be used for health check"
  default     = "/health"
}

variable "vpc" {
}

variable "private_subnet_ids" {
  description = "list of private subnet ids"
  type        = list(string)
}

variable "alb_listener_arn" {
  description = "alb listner arn to which target group will be attached"
  type        = string
}

variable "path_prefix" {
  description = "path for which it is forwared to tg"
  default     = "/*"
}

