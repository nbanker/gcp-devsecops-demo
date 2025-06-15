terraform {
  required_providers {
    required_version = ">= 1.3.0"

    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
