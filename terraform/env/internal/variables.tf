variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key (also referred as Cloud API ID)"
  type        = string
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type        = string
  sensitive   = true
}


variable "clustername" {
  description = "Confluent cluster name"
  type        = string
}

variable "envid" {
  description = "Env id"
  type        = string
}
