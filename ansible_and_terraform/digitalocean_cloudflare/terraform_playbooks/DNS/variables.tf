variable "cf_api_token" {
  description = "Your cloudflare API token generated from here https://dash.cloudflare.com/*id*/profile/api-tokens"
  default     = "123456789"
}

variable "cf_zone_id" {
  description = "Your sites Zone ID. Can be found here https://dash.cloudflare.com/*id*/domain.tld"
  default     = "123456789"
}

variable "cf_domain" {
  description = "Your root domainname"
  default     = "domain.tld"
}

variable "cf_host_fqdn" {
  description = "The FQDN of your server cloudflare is going to create a A and AAAA record for"
  default     = "host.domain.tld"
}

variable "cf_host_phishlets" {
  description = "The FQDN of your phishlets cloudflare is going to create a A and AAAA record for"
  default     = "phostlet.domain.tld"
}

variable "cf_record_ttl" {
  description = "TTL used for the DNS records. Defaults to 1 duo proxied."
  default     = 1
}

variable "cf_record_proxied" {
  description = "Boolean to enable or disable the cloudflare proxy."
  default     = true
}

variable "cf_host_ipv4" {
  description = "IP address used to point records to."
  default     = "0.0.0.0"
}

variable "cf_host_ipv6" {
  description = "IP address used to point records to."
  default     = "::/0"
}