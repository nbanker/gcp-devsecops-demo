resource "google_compute_network" "vpc" {
  name                    = "${var.project_short_name}-vpc-${var.environment}"
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "app_subnet" {
  name          = "${var.project_short_name}-subnet-app-${var.environment}"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
  project       = var.project_id
}

resource "google_compute_subnetwork" "infra_subnet" {
  name          = "${var.project_short_name}-subnet-infra-${var.environment}"
  ip_cidr_range = "10.20.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
  project       = var.project_id
}
