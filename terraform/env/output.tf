output "resource-ids" {
  
  Environment ID:   ${confluent_environment.staging.id}
  Schema Registry URL: ${confluent_schema_registry_cluster.essentials.rest_endpoint}

  

  sensitive = false
}
