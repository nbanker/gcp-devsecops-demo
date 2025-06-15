resource "google_service_account" "gke" {
  account_id   = "${var.project_short_name}-gke-sa"
  display_name = "GKE Service Account"
  project      = var.project_id
}

resource "google_project_iam_member" "gke_roles" {
  for_each = toset([
    "roles/container.admin",
    "roles/compute.networkAdmin",
    "roles/iam.serviceAccountUser"
  ])

  role    = each.value
  member  = "serviceAccount:${google_service_account.gke.email}"
  project = var.project_id
}
