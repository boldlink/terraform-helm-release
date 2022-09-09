[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/boldlink/<REPO_NAME>/actions)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/checkov.yml/badge.svg)](https://github.com/boldlink/<REPO_NAME>/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Helm Release Terraform module

## Description

This module can be used used to deploy helm packages to a Kubernetes cluster.

Examples available [`here`]github.com/boldlink/terraform-helm-release/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "minimum_helm" {
  source     = "./../../"
  name       = "my-redis-release"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
}
```
## Documentation

[Helm Documentation](https://helm.sh/)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.6.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.main](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.main](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.multi_doc](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_atomic"></a> [atomic](#input\_atomic) | (Optional) If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false. | `bool` | `false` | no |
| <a name="input_chart"></a> [chart](#input\_chart) | (Required) Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended. | `string` | n/a | yes |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | (Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed. | `string` | `null` | no |
| <a name="input_cleanup_on_fail"></a> [cleanup\_on\_fail](#input\_cleanup\_on\_fail) | (Optional) Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false. | `bool` | `false` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Optional) Create the namespace if it does not yet exist. Defaults to false. | `bool` | `false` | no |
| <a name="input_dependency_update"></a> [dependency\_update](#input\_dependency\_update) | (Optional) Runs helm dependency update before installing the chart. Defaults to false. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Set release description attribute (visible in the history). | `string` | `null` | no |
| <a name="input_devel"></a> [devel](#input\_devel) | (Optional) Use chart development versions, too. Equivalent to version '>0.0.0-0'. If version is set, this is ignored. | `string` | `null` | no |
| <a name="input_disable_openapi_validation"></a> [disable\_openapi\_validation](#input\_disable\_openapi\_validation) | (Optional) If set, the installation process will not validate rendered templates against the Kubernetes OpenAPI Schema. Defaults to false. | `bool` | `false` | no |
| <a name="input_disable_webhooks"></a> [disable\_webhooks](#input\_disable\_webhooks) | (Optional) Prevent hooks from running. Defaults to false. | `bool` | `false` | no |
| <a name="input_force_update"></a> [force\_update](#input\_force\_update) | (Optional) Force resource update through delete/recreate if needed. Defaults to false. | `bool` | `false` | no |
| <a name="input_keyring"></a> [keyring](#input\_keyring) | (Optional) Location of public keys used for verification. Used only if verify is true. Defaults to /.gnupg/pubring.gpg in the location set by home | `string` | `null` | no |
| <a name="input_lint"></a> [lint](#input\_lint) | (Optional) Run the helm chart linter during the plan. Defaults to false. | `bool` | `false` | no |
| <a name="input_manifests"></a> [manifests](#input\_manifests) | Configuration of manifest file to apply | `any` | `[]` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | (Optional) Maximum number of release versions stored per release. Defaults to 0 (no limit). | `number` | `0` | no |
| <a name="input_multi_doc_manifests"></a> [multi\_doc\_manifests](#input\_multi\_doc\_manifests) | Configuration of map for multi-document yaml file to apply | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Release name. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Optional) The namespace to install the release into. Defaults to default. | `string` | `"default"` | no |
| <a name="input_postrender"></a> [postrender](#input\_postrender) | (Optional) Configure a command to run after helm renders the manifest which can alter the manifest contents. | `list(any)` | `[]` | no |
| <a name="input_recreate_pods"></a> [recreate\_pods](#input\_recreate\_pods) | (Optional) Perform pods restart during upgrade/rollback. Defaults to false. | `bool` | `false` | no |
| <a name="input_render_subchart_notes"></a> [render\_subchart\_notes](#input\_render\_subchart\_notes) | (Optional) If set, render subchart notes along with the parent. Defaults to true. | `bool` | `true` | no |
| <a name="input_replace"></a> [replace](#input\_replace) | (Optional) Re-use the given name, only if that name is a deleted release which remains in the history. This is unsafe in production. Defaults to false. | `bool` | `false` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | (Optional) Repository URL where to locate the requested chart. | `string` | `null` | no |
| <a name="input_repository_ca_file"></a> [repository\_ca\_file](#input\_repository\_ca\_file) | (Optional) The Repositories CA File. | `string` | `null` | no |
| <a name="input_repository_cert_file"></a> [repository\_cert\_file](#input\_repository\_cert\_file) | (Optional) The repositories cert file | `string` | `null` | no |
| <a name="input_repository_key_file"></a> [repository\_key\_file](#input\_repository\_key\_file) | (Optional) The repositories cert key file | `string` | `null` | no |
| <a name="input_repository_password"></a> [repository\_password](#input\_repository\_password) | (Optional) Password for HTTP basic authentication against the repository. | `string` | `null` | no |
| <a name="input_repository_username"></a> [repository\_username](#input\_repository\_username) | (Optional) Username for HTTP basic authentication against the repository. | `string` | `null` | no |
| <a name="input_reset_values"></a> [reset\_values](#input\_reset\_values) | (Optional) When upgrading, reset the values to the ones built into the chart. Defaults to false. | `bool` | `false` | no |
| <a name="input_reuse_values"></a> [reuse\_values](#input\_reuse\_values) | (Optional) When upgrading, reuse the last release's values and merge in any overrides. If 'reset\_values' is specified, this is ignored. Defaults to false. | `bool` | `false` | no |
| <a name="input_set"></a> [set](#input\_set) | (Optional) Value block with custom values to be merged with the values yaml. | `list(any)` | `[]` | no |
| <a name="input_set_sensitive"></a> [set\_sensitive](#input\_set\_sensitive) | (Optional) Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff. | `list(any)` | `[]` | no |
| <a name="input_skip_crds"></a> [skip\_crds](#input\_skip\_crds) | (Optional) If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false. | `bool` | `false` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | (Optional) Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds. | `number` | `300` | no |
| <a name="input_values"></a> [values](#input\_values) | (Optional) List of values in raw yaml to pass to helm. Values will be merged, in order, as Helm does with multiple -f options. | `list(any)` | `[]` | no |
| <a name="input_verify"></a> [verify](#input\_verify) | (Optional) Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart; this must be hosted alongside the chart. For more information see the Helm Documentation. Defaults to false. | `bool` | `false` | no |
| <a name="input_wait"></a> [wait](#input\_wait) | (Optional) Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true. | `bool` | `false` | no |
| <a name="input_wait_for_jobs"></a> [wait\_for\_jobs](#input\_wait\_for\_jobs) | (Optional) If wait is enabled, will wait until all Jobs have been completed before marking the release as successful. It will wait for as long as timeout. Defaults to false. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metadata"></a> [metadata](#output\_metadata) | Block status of the deployed release. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests:
`$ make tests`
* Clean all tests:
`$ make clean`

#### BOLDLink-SIG 2022
