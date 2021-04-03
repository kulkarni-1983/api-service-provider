variable "tags" {
  description = "default tags applied to the resources"
  type        = map(string)
}

variable "resource_prefix" {
  description = "prefix applied to aws resources"
  type        = string
}