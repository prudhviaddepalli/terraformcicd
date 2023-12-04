
resource "confluent_kafka_cluster" "standard" {
  display_name = "staging-db"
  availability = "SINGLE_ZONE"
  cloud        = "GCP"
  region       = "us-central1"
  basic {}
  environment {
    id = confluent_environment.staging.id
  }
}
