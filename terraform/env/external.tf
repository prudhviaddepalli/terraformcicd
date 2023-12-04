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
