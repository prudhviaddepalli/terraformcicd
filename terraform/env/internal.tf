resource "confluent_kafka_cluster" "internal" {
  display_name = var.intclustername
  availability = "SINGLE_ZONE"
  cloud        = "AZURE"
  region       = "eastus2"
  basic {}
  environment {
    id = confluent_environment.staging.id
  }
}

resource "confluent_service_account" "internalclusteradmin" {
  display_name = var.sainternalclusteradmin
  description  = "Service account to manage 'inventory' Kafka cluster"
}

resource "confluent_role_binding" "app-manager-int-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.internalclusteradmin.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.internal.rbac_crn
}

resource "confluent_api_key" "app-manager-ext-kafka-api-key" {
  display_name = "externalclusteradmin"
  description  = "Kafka API Key that is owned by 'external cluster admin' service account"
  owner {
    id          = confluent_service_account.internalclusteradmin.id
    api_version = confluent_service_account.internalclusteradmin.api_version
    kind        = confluent_service_account.internalclusteradmin.kind
  }

  managed_resource {
    id          = confluent_kafka_cluster.internal.id
    api_version = confluent_kafka_cluster.internal.api_version
    kind        = confluent_kafka_cluster.internal.kind

    environment {
      id = confluent_environment.staging.id
    }
  }
