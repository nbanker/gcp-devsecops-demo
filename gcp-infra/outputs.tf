output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}

output "subnet_region" {
  value = google_compute_subnetwork.subnet.region
}

output "subnet_secondary_ranges" {
  value = google_compute_subnetwork.subnet.secondary_ip_range
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_location" {
  value = google_container_cluster.primary.location
}
