variable "environment" {
  description = "Deployment environment (e.g. dev, prod)"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "project_short_name" {
  description = "Short project name"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "devsecops-gitops-cluster"
}
