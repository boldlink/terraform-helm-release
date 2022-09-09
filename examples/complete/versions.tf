terraform {
  required_version = ">= 0.14.11"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}