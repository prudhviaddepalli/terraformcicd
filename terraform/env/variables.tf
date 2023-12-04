variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key (also referred as Cloud API ID)"
  type        = string
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type        = string
  sensitive   = true
}


variable "envname" {
  description = "Confluent env name"
  type        = string
}

variable "intclustername" {
  description = "Confluent internal cluster name"
  type        = string
}

variable "extclustername" {
  description = "Confluent external cluster name"
  type        = string
}

variable "sainternalclusteradmin" {
  description = "Confluent internal cluster admin Service Account"
  type        = string
}

variable "saexternalclusteradmin" {
  description = "Confluent external cluster admin Service Account"
  type        = string
}
