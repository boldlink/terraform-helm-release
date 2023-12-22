variable "name" {
  description = "(Required) Release name."
  type        = string
  default     = "cert-manager"
}

variable "description" {
  description = "(Optional) Set release description attribute (visible in the history)."
  type        = string
  default     = "Example complete helm chart"
}

variable "repository" {
  description = "(Optional) Repository URL where to locate the requested chart."
  type        = string
  default     = "https://charts.jetstack.io"
}

variable "chart" {
  description = "(Required) Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended."
  type        = string
  default     = "cert-manager"
}

variable "create_namespace" {
  description = "Optional) Create the namespace if it does not yet exist. Defaults to false."
  type        = bool
  default     = true
}

variable "namespace" {
  description = "(Optional) The namespace to install the release into. Defaults to default."
  type        = string
  default     = "cert-manager"
}

variable "chart_version" {
  description = "(Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed."
  type        = string
  default     = "v1.8.0"
}

variable "cleanup_on_fail" {
  description = "(Optional) Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false."
  type        = bool
  default     = true
}

variable "timeout" {
  description = "(Optional) Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds."
  type        = number
  default     = 600
}

variable "reuse_values" {
  description = "(Optional) When upgrading, reuse the last release's values and merge in any overrides. If 'reset_values' is specified, this is ignored. Defaults to false."
  type        = bool
  default     = true
}

variable "reset_values" {
  description = "(Optional) When upgrading, reset the values to the ones built into the chart. Defaults to false."
  type        = bool
  default     = false
}

variable "force_update" {
  description = "(Optional) Force resource update through delete/recreate if needed. Defaults to false."
  type        = bool
  default     = true
}

variable "recreate_pods" {
  description = "(Optional) Perform pods restart during upgrade/rollback. Defaults to false."
  type        = bool
  default     = false
}

variable "max_history" {
  description = "(Optional) Maximum number of release versions stored per release. Defaults to 0 (no limit)."
  type        = number
  default     = 3
}

variable "atomic" {
  description = "(Optional) If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false."
  type        = bool
  default     = true
}

variable "skip_crds" {
  description = "(Optional) If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false."
  type        = bool
  default     = false
}

variable "wait" {
  description = "(Optional) Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true."
  type        = bool
  default     = true
}

variable "replace" {
  description = "(Optional) Re-use the given name, only if that name is a deleted release which remains in the history. This is unsafe in production. Defaults to false."
  type        = bool
  default     = false
}

variable "dependency_update" {
  description = "(Optional) Runs helm dependency update before installing the chart. Defaults to false."
  type        = bool
  default     = false
}

variable "tls_secret_key" {
  type        = string
  sensitive   = true
  default     = "my_sensitive_tls_key"
  description = "This is an example variable"
}

variable "lint" {
  description = " (Optional) Run the helm chart linter during the plan. Defaults to false."
  type        = bool
  default     = true
}
