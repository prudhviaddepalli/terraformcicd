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
