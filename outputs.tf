output "metadata" {
  description = "Block status of the deployed release."
  value       = helm_release.main.metadata
}
