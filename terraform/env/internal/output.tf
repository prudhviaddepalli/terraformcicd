output "resource-ids" {
  value = <<-EOT
  Environment ID:   ${confluent_environment.staging.id}
  Kafka Cluster ID: ${confluent_kafka_cluster.basic.id}
  Kafka Cluster Name: ${confluent_kafka_cluster.basic.display_name}

EOT

sensitive = false
}
