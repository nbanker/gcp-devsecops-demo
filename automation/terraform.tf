terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  host                   = module.gcp_infra.kubeconfig.host
  token                  = module.gcp_infra.kubeconfig.token
  cluster_ca_certificate = base64decode(module.gcp_infra.kubeconfig.cluster_ca_certificate)
}
