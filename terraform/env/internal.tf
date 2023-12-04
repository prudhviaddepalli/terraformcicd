resource "confluent_kafka_cluster" "standard" {
  display_name = var.clustername
  availability = "SINGLE_ZONE"
  cloud        = "AZURE"
  region       = "eastus2"
  basic {}
  environment {
    id = confluent_environment.staging.id
  }
}
