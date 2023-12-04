output "resource-ids" {
  value = <<-EOT
  Environment ID:   ${confluent_environment.staging.id}
  Schema Registry URL: ${confluent_schema_registry_cluster.essentials.rest_endpoint}
  EOT
  

  sensitive = false
}

output "confluent_environment" {
  value = confluent_environment.staging.id
}
