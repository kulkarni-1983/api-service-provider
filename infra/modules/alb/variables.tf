variable "tags" {
  description = "default tags applied to the resources"
  type        = map(string)
}

variable "resource_prefix" {
  description = "prefix applied to aws resources"
  type        = string
}

variable "is_private_network" {
  description = "Prefer public or private ALB"
  default     = true
  type        = bool
}

variable "private_subnet_ids" {
  description = "list of private subnet ids"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "list of public subnet ids"
  type        = list(string)
}

variable "vpc" {
  description = "vpc resource"
}