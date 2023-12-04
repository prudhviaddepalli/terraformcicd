output "environment_id" {
  value = confluent_environment.staging.id
}

output "schemaregistry_url" {
  value = confluent_schema_registry_cluster.essentials.rest_endpoint
}

output "Internal_cluster_id" {
  value = confluent_kafka_cluster.internal.id
}

output "External_cluster_id" {
  value = confluent_kafka_cluster.external.id
}

output "internal_cluster_admin_kafka_api_key_id" {
  description = "Kafka API Key ID to consume the data from the target topic"
  value       = confluent_api_key.app-manager-int-kafka-api-key.id
}

output "internal_cluster_admin_kafka_api_key_secret" {
  description = "Kafka API Key Secret to consume the data from the target topic"
  value       = confluent_api_key.app-manager-int-kafka-api-key.secret
  sensitive   = true
}

output "external_cluster_admin_kafka_api_key_id" {
  description = "Kafka API Key ID to consume the data from the target topic"
  value       = confluent_api_key.app-manager-ext-kafka-api-key.id
}

output "external_cluster_admin_kafka_api_key_secret" {
  description = "Kafka API Key Secret to consume the data from the target topic"
  value       = confluent_api_key.app-manager-ext-kafka-api-key.secret
  sensitive   = true
}
