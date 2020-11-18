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

resource "cloudflare_record" "a_domain" {
  zone_id = var.cf_zone_id
  name    = var.cf_domain
  value   = var.cf_host_ipv4
  type    = "A"
  ttl     = var.cf_record_ttl
  proxied = var.cf_record_proxied
}

resource "cloudflare_record" "a_www_domain" {
  zone_id = var.cf_zone_id
  name    = "www.${var.cf_domain}"
  value   = var.cf_host_ipv4
  type    = "A"
  ttl     = var.cf_record_ttl
  proxied = var.cf_record_proxied
}

resource "cloudflare_record" "spf_record" {
  zone_id = var.cf_zone_id
  name    = var.cf_domain
  value   = "v=spf1 a -all"
  type    = "TXT"
  ttl     = var.cf_record_ttl
}

resource "cloudflare_record" "dmarc_record" {
  zone_id = var.cf_zone_id
  name    = "_dmarc.${var.cf_domain}"
  value   = "v=DMARC1; p=none;"
  type    = "TXT"
  ttl     = var.cf_record_ttl
}
