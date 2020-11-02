terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
  required_version = ">= 0.13"
}

provider "digitalocean" {
  version = "~> 1.23.0"
  token   = var.do_token
}

provider "cloudflare" {
  version   = "~> 2.12.0"
  api_token = var.cf_api_token
}