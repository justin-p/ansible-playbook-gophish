resource "cloudflare_record" "a_host_fqdn" {
  zone_id = var.cf_zone_id
  name    = var.cf_host_fqdn
  value   = var.cf_host_ipv4
  type    = "A"
  ttl     = var.cf_record_ttl
  proxied = var.cf_record_proxied
}

resource "cloudflare_record" "aaaa_host_fqdn" {
  zone_id = var.cf_zone_id
  name    = var.cf_host_fqdn
  value   = var.cf_host_ipv6
  type    = "AAAA"
  ttl     = var.cf_record_ttl
  proxied = var.cf_record_proxied
}

resource "cloudflare_record" "a_host_phishlets" {
  zone_id = var.cf_zone_id
  name    = var.cf_host_phishlets
  value   = var.cf_host_ipv4
  type    = "A"
  ttl     = var.cf_record_ttl
  proxied = var.cf_record_proxied
}

resource "cloudflare_record" "aaaa_host_phishlets" {
  zone_id = var.cf_zone_id
  name    = var.cf_host_phishlets
  value   = var.cf_host_ipv6
  type    = "AAAA"
  ttl     = var.cf_record_ttl
  proxied = var.cf_record_proxied
}