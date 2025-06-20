output "namespace" {
  value = kubernetes_namespace.argocd.metadata[0].name
}

output "argocd_chart_version" {
  value = helm_release.argocd.version
}
