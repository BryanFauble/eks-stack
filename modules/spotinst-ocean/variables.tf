variable "cluster_name" {
  description = "Name of K8 cluster"
  type        = string
  default     = "dpe-k8"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "secretsmanager_key_spotinst_token" {
  description = "Name in secretsmanager to acces token"
  type        = string
  default     = "spotinst_token"
}
