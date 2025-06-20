resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.region
  enable_autopilot         = true
  enable_l4_ilb_subsetting = true

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.id

  ip_allocation_policy {
    stack_type                    = "IPV4_IPV6"
    services_secondary_range_name = "services-range"
    cluster_secondary_range_name  = "pods-range"
  }

  deletion_protection = false
}
