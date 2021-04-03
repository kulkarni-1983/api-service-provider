locals {
  subnets = var.is_private_network ? var.private_subnet_ids : var.public_subnet_ids
}
