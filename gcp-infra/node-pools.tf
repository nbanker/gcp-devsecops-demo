resource "google_container_node_pool" "app_nodes" {
  name       = "app-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  project    = var.project_id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

    labels = {
      pool = "app"
    }

    tags = ["app-node"]
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}

resource "google_container_node_pool" "infra_nodes" {
  name       = "infra-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  project    = var.project_id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

    labels = {
      pool = "infra"
    }

    tags = ["infra-node"]
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}
