resource "confluent_kafka_cluster" "external" {
  display_name = var.extclustername
  availability = "SINGLE_ZONE"
  cloud        = "AZURE"
  region       = "eastus2"
  basic {}
  environment {
    id = confluent_environment.staging.id
  }
}


resource "confluent_service_account" "externalclusteradmin" {
  display_name = var.saexternalclusteradmin
  description  = "Service account to manage 'inventory' Kafka cluster"
}

resource "confluent_role_binding" "app-manager-ext-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.externalclusteradmin.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.external.rbac_crn
}

resource "confluent_api_key" "app-manager-ext-kafka-api-key" {
  display_name = "externalclusteradmin"
  description  = "Kafka API Key that is owned by 'external cluster admin' service account"
  owner {
    id          = confluent_service_account.externalclusteradmin.id
    api_version = confluent_service_account.externalclusteradmin.api_version
    kind        = confluent_service_account.externalclusteradmin.kind
  }

  managed_resource {
    id          = confluent_kafka_cluster.external.id
    api_version = confluent_kafka_cluster.external.api_version
    kind        = confluent_kafka_cluster.external.kind

    environment {
      id = confluent_environment.staging.id
    }
  }
