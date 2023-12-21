### To run this example, export KUBE_CONFIG_PATH in the terminal then run terraform apply
module "minimum_helm" {
  source     = "./../../"
  name       = "my-redis-release"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
}
