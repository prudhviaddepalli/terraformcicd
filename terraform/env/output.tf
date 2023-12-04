output "environment_id" {
  value = confluent_environment.staging.id
}

output "schemaregistry_url" {
  value = confluent_schema_registry_cluster.essentials.rest_endpoint
}
