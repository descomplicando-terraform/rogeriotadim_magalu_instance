variable "name" {
  description = "The name of the instance"
  type        = string
  default     = "instance-test"
}

variable "qtd_instances" {
  description = "The number of instances to create"
  type        = number
  default     = 1
}

variable "api_key" {
  description = "API Key"
  type        = string
  sensitive   = true
}


