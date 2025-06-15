variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "devsecops-gitops-cluster"
}

variable "project_short_name" {
  type        = string
  description = "Short name used for naming resources"
}

variable "environment" {
  description = "Deployment environment (e.g. dev, prod)"
  type        = string
}
