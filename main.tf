resource "helm_release" "main" {
  name                       = var.name
  description                = var.description
  repository                 = var.repository
  chart                      = var.chart
  repository_key_file        = var.repository_key_file
  repository_cert_file       = var.repository_cert_file
  repository_ca_file         = var.repository_ca_file
  repository_username        = var.repository_username
  repository_password        = var.repository_password
  devel                      = var.devel
  version                    = var.chart_version
  namespace                  = var.namespace
  verify                     = var.verify
  keyring                    = var.keyring
  timeout                    = var.timeout
  disable_webhooks           = var.disable_webhooks
  reuse_values               = var.reuse_values
  reset_values               = var.reset_values
  force_update               = var.force_update
  recreate_pods              = var.recreate_pods
  cleanup_on_fail            = var.cleanup_on_fail
  max_history                = var.max_history
  atomic                     = var.atomic
  skip_crds                  = var.skip_crds
  render_subchart_notes      = var.render_subchart_notes
  disable_openapi_validation = var.disable_openapi_validation
  wait                       = var.wait
  wait_for_jobs              = var.wait_for_jobs
  values                     = var.values
  dependency_update          = var.dependency_update
  replace                    = var.replace
  lint                       = var.lint
  create_namespace           = var.create_namespace

  dynamic "set" {
    for_each = var.set
    content {
      name  = set.value.name
      value = set.value.value
      type  = try(set.value.type, null)
    }
  }
  dynamic "set_sensitive" {
    for_each = var.set_sensitive
    content {
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
      type  = try(set_sensitive.value.type, null)
    }
  }

  dynamic "postrender" {
    for_each = var.postrender
    content {
      binary_path = each.value.binary_path
      #args        = each.value.args
    }
  }
}

## This resource is equivalent to `kubectl apply -f filename`. Use this to apply multiple single-document yaml files
resource "kubectl_manifest" "main" {
  count             = length(var.manifests) > 0 ? length(var.manifests) : 0
  yaml_body         = try(var.manifests[count.index]["yaml_body"])
  sensitive_fields  = try(var.manifests[count.index]["sensitive_fields"], ["data"])
  force_new         = try(var.manifests[count.index]["force_new"], null)
  server_side_apply = try(var.manifests[count.index]["server_side_apply"], null)
  force_conflicts   = try(var.manifests[count.index]["force_conflicts"], null)
  apply_only        = try(var.manifests[count.index]["apply_only"], null)
  ignore_fields     = try(var.manifests[count.index]["ignore_fields"], null)
  validate_schema   = try(var.manifests[count.index]["validate_schema"], null)
  wait              = try(var.manifests[count.index]["wait"], null)
  wait_for_rollout  = try(var.manifests[count.index]["wait_for_rollout"], null)

  depends_on = [helm_release.main]
}

resource "kubectl_manifest" "multi_doc" {
  for_each   = var.multi_doc_manifests
  yaml_body  = each.value
  depends_on = [helm_release.main]
}
