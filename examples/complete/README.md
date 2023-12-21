[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-helm-release/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-helm-release.svg)](https://github.com/boldlink/terraform-helm-release/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-helm-release/actions)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-helm-release/actions)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-helm-release/actions)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-helm-release/actions)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-helm-release/actions)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-helm-release/actions)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-helm-release/actions)
[![Build Status](https://github.com/boldlink/terraform-helm-release/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-helm-release/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform  module example of complete and most common configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >=2.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_complete_helm"></a> [complete\_helm](#module\_complete\_helm) | ./../../ | n/a |
| <a name="module_example_ingress"></a> [example\_ingress](#module\_example\_ingress) | ./../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_atomic"></a> [atomic](#input\_atomic) | (Optional) If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false. | `bool` | `true` | no |
| <a name="input_chart"></a> [chart](#input\_chart) | (Required) Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended. | `string` | `"cert-manager"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | (Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed. | `string` | `"v1.8.0"` | no |
| <a name="input_cleanup_on_fail"></a> [cleanup\_on\_fail](#input\_cleanup\_on\_fail) | (Optional) Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false. | `bool` | `true` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Optional) Create the namespace if it does not yet exist. Defaults to false. | `bool` | `true` | no |
| <a name="input_dependency_update"></a> [dependency\_update](#input\_dependency\_update) | (Optional) Runs helm dependency update before installing the chart. Defaults to false. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Set release description attribute (visible in the history). | `string` | `"Example complete helm chart"` | no |
| <a name="input_force_update"></a> [force\_update](#input\_force\_update) | (Optional) Force resource update through delete/recreate if needed. Defaults to false. | `bool` | `true` | no |
| <a name="input_lint"></a> [lint](#input\_lint) | (Optional) Run the helm chart linter during the plan. Defaults to false. | `bool` | `true` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | (Optional) Maximum number of release versions stored per release. Defaults to 0 (no limit). | `number` | `3` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Release name. | `string` | `"cert-manager"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Optional) The namespace to install the release into. Defaults to default. | `string` | `"cert-manager"` | no |
| <a name="input_recreate_pods"></a> [recreate\_pods](#input\_recreate\_pods) | (Optional) Perform pods restart during upgrade/rollback. Defaults to false. | `bool` | `false` | no |
| <a name="input_replace"></a> [replace](#input\_replace) | (Optional) Re-use the given name, only if that name is a deleted release which remains in the history. This is unsafe in production. Defaults to false. | `bool` | `false` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | (Optional) Repository URL where to locate the requested chart. | `string` | `"https://charts.jetstack.io"` | no |
| <a name="input_reset_values"></a> [reset\_values](#input\_reset\_values) | (Optional) When upgrading, reset the values to the ones built into the chart. Defaults to false. | `bool` | `false` | no |
| <a name="input_reuse_values"></a> [reuse\_values](#input\_reuse\_values) | (Optional) When upgrading, reuse the last release's values and merge in any overrides. If 'reset\_values' is specified, this is ignored. Defaults to false. | `bool` | `true` | no |
| <a name="input_skip_crds"></a> [skip\_crds](#input\_skip\_crds) | (Optional) If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false. | `bool` | `false` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | (Optional) Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds. | `number` | `600` | no |
| <a name="input_tls_secret_key"></a> [tls\_secret\_key](#input\_tls\_secret\_key) | This is an example variable | `string` | `"my_sensitive_tls_key"` | no |
| <a name="input_wait"></a> [wait](#input\_wait) | (Optional) Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true. | `bool` | `true` | no |

## Outputs

No outputs.
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

#### BOLDLink-SIG 2023
