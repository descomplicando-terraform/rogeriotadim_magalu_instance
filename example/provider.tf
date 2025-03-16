terraform {
  required_providers {
    mgc = {
      source  = "magalucloud/mgc"
      version = "0.32.1"
    }
  }
}

provider "mgc" {
  api_key = var.api_key
  region  = "br-se1"
}