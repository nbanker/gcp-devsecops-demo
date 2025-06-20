resource "google_compute_network" "vpc" {
  name                     = "${var.project_short_name}-${var.environment}-vpc"
  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = true
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_short_name}-${var.environment}-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc.id

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.0.0/24"
  }

  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = "192.168.1.0/24"
  }
}
