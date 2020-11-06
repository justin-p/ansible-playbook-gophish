terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
  required_version = ">= 0.13"
}

provider "cloudflare" {
  version   = "~> 2.12.0"
  api_token = var.cf_api_token
}