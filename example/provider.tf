terraform {
  required_version = "= 1.9.3"
  required_providers {
    mgc = {
      source  = "magalucloud/mgc"
      version = "0.32.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "mgc" {
  api_key = var.api_key
  region  = "br-se1"
}