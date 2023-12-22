### To run this example, export KUBE_CONFIG_PATH in the terminal then run terraform apply
module "complete_helm" {
  source            = "./../../"
  name              = var.name
  repository        = var.repository
  description       = var.description
  create_namespace  = var.create_namespace
  namespace         = var.namespace
  chart             = var.chart
  chart_version     = var.chart_version
  cleanup_on_fail   = var.cleanup_on_fail
  timeout           = var.timeout
  reuse_values      = var.reuse_values
  reset_values      = var.reset_values
  force_update      = var.force_update
  recreate_pods     = var.recreate_pods
  max_history       = var.max_history
  atomic            = var.atomic
  skip_crds         = var.skip_crds
  wait              = var.wait
  replace           = var.replace
  lint              = var.lint
  dependency_update = var.dependency_update
  set = [
    {
      name  = "installCRDs"
      value = true
    },
  ]
}


module "example_ingress" {
  source     = "./../../"
  name       = "nginx-ingress"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"
  values     = local.values

  set_sensitive = [{
    name  = "controller.extraArgs.default-ssl-certificate"
    value = var.tls_secret_key
  }]

  set = [{
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
    },
    {
      name  = "controller.config.use-forwarded-headers"
      value = "true"
  }]
}
