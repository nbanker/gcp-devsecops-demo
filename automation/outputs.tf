output "infra_subnet_name" {
  value = module.gcp_infra.subnet_name
}

output "infra_subnet_region" {
  value = module.gcp_infra.subnet_region
}

output "infra_subnet_secondary_ranges" {
  value = module.gcp_infra.subnet_secondary_ranges
}

output "cluster_name" {
  value = module.gcp_infra.cluster_name
}

output "cluster_location" {
  value = module.gcp_infra.cluster_location
}
