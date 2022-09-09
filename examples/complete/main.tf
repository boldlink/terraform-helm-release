module "complete_helm" {
  source           = "./../../"
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  description      = "Example complete cert manager"
  create_namespace = true
  namespace        = "cert-manager"
  chart            = "cert-manager"
  chart_version    = "v1.8.0"
  cleanup_on_fail  = true
  set = [
    {
      name  = "installCRDs"
      value = true
    },
  ]

  manifests = [
    {
      yaml_body = file("ngnx.yaml")
    }
  ]
}
