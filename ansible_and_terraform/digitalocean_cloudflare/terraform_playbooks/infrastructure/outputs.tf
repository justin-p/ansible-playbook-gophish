output "vps_ipv4_address" {
  value = digitalocean_droplet.main.ipv4_address
}

output "vps_ipv6_address" {
  value = digitalocean_droplet.main.ipv6_address
}