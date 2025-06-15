resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.app_subnet.self_link

  ip_allocation_policy {
    use_ip_aliases = true
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }
}

data "google_client_config" "default" {}

output "kubeconfig" {
  value = {
    host                   = google_container_cluster.primary.endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  }
  sensitive = true
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}
