locals {
  values = [
    <<EOT
controller:
  replicaCount: 2
  service:
    annotations:
      service.beta.kubernetes.io/aws-load-balancer-backend-protocol: "http"
    type: "LoadBalancer"
  config:
    use-proxy-protocol: "true"
EOT
  ]
}
