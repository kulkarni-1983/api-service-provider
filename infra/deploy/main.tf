# create the cluster to host ecs service
module "api_service_cluster" {
  source          = "../modules/ecs-cluster"
  resource_prefix = local.resource_prefix
  tags            = local.tags
}