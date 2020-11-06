variable "root_username" {
  description = "The username of the root account"
  default     = "root"
}

variable "root_ssh_key_path" {
  description = "The path of the ssh key for the root account"
  default     = "~/.ssh/root-gophish"
}

variable "cf_api_token" {
  description = "Your cloudflare API token generated from here https://dash.cloudflare.com/*id*/profile/api-tokens"
  default     = "123456789"
}

variable "cf_zone_id" {
  description = "Your sites Zone ID. Can be found here https://dash.cloudflare.com/*id*/domain.tld"
  default     = "123456789"
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

variable "do_token" {
  description = "Your Digital Ocean Api token generated from here https://cloud.digitalocean.com/account/api/tokens"
  default     = "123465789"
}

variable "do_tag" {
  description = "Tag added to the DigitalOcean Droplet"
  default     = "ansible_terra_server"
}

variable "do_name" {
  description = "Name of the new to the DigitalOcean Droplet"
  default     = "ansible_terra_server"
}

variable "do_description" {
  description = "Description of the new to the DigitalOcean Droplet"
  default     = "Server deployed with Terraform and Ansible"
}

variable "do_image" {
  description = "The image to use when creating the droplet"
  default     = "ubuntu-20-04-x64"
}

variable "do_ipv6" {
  description = "Enable or Disable ipv6"
  default     = true
}

variable "do_monitoring" {
  description = "Enable or disable DigitalOcean Monitoring"
  default     = false
}

variable "do_private_networking" {
  description = "Enable or disable private networking"
  default     = true
}

variable "do_region" {
  description = "Region to create droplet in"
  default     = "ams3"
}

variable "do_size" {
  description = "Droplet Size"
  default     = "s-1vcpu-1gb"
}

variable "do_man_ip" {
  description = "Opens management services for listed IPs."
  default     = ["0.0.0.0/0", "::/0"]
}

variable "do_web_ip" {
  description = "Opens HTTP and HTTPS for listed IPs. Defaults to Cloudflare ranges."
  default = [
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "104.16.0.0/12",
    "108.162.192.0/18",
    "131.0.72.0/22",
    "141.101.64.0/18",
    "162.158.0.0/15",
    "172.64.0.0/13",
    "173.245.48.0/20",
    "188.114.96.0/20",
    "190.93.240.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17",
    "2400:cb00::/32",
    "2405:8100::/32",
    "2405:b500::/32",
    "2606:4700::/32",
    "2803:f800::/32",
    "2a06:98c0::/29",
    "2c0f:f248::/32"
  ]
}
