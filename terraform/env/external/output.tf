output "resource-ids" {
  value = <<-EOT
  Environment ID:   ${data.terraform_remote_state.staging.outputs.environment_id}
  Kafka Cluster ID: ${confluent_kafka_cluster.standard.id}
  Kafka Cluster Name: ${confluent_kafka_cluster.standard.display_name}

EOT

sensitive = false
}
