
module "minimum_helm" {
  source        = "./../../"
  name          = "my-redis-release"
  repository    = "https://charts.bitnami.com/bitnami"
  chart         = "redis"
  chart_version = "6.0.1"
}
