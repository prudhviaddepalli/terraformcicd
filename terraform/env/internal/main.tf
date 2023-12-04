terraform {
  required_version = ">= 0.14.0"
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.55.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.55.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "your-resourcegroup"
    storage_account_name = "storageaccountname"
    container_name       = "containername"
  }
}

resource "confluent_kafka_cluster" "standard" {
  display_name = var.clustername
  availability = "SINGLE_ZONE"
  cloud        = "GCP"
  region       = "us-central1"
  basic {}
  environment {
    id = var.envid
  }
}
