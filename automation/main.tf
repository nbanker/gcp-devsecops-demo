module "gcp_infra" {
  source             = "../gcp-infra"
  project_id         = var.project_id
  region             = var.region
  environment        = var.environment
  cluster_name       = var.cluster_name
  project_short_name = var.project_short_name
}

module "argocd_infra" {
  source = "../argocd-infra"
}
