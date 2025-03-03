data "mgc_network_vpc" "vpc" {
  id = "971c798c-c788-4166-b051-2f3f850c7858"
}


variable "api_key" {
  description = "API Key"
  type        = string
  sensitive   = true
}


variable "qtd_instances" {
  description = "The number of instances to create"
  type        = number
  default     = 1
}
