resource "google_container_cluster" "autopilot" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  enable_autopilot = true

  networking_mode          = "VPC_NATIVE"
  remove_default_node_pool = true
  initial_node_count       = 1

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }
}

data "google_client_config" "default" {}

output "kubeconfig" {
  value = {
    host                   = google_container_cluster.autopilot.endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = google_container_cluster.autopilot.master_auth[0].cluster_ca_certificate
  }
  sensitive = true
}

output "cluster_name" {
  value = google_container_cluster.autopilot.name
}
