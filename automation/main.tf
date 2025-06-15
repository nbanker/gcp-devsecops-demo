provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  host                   = module.gcp_infra.kubeconfig.host
  token                  = module.gcp_infra.kubeconfig.token
  cluster_ca_certificate = base64decode(module.gcp_infra.kubeconfig.cluster_ca_certificate)
}

module "gcp_infra" {
  source       = "../gcp-infra"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
}

module "argocd_infra" {
  source       = "../argocd-infra"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
}
