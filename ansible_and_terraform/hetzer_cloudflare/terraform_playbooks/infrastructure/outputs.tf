output "vps_ipv4_address" {
  value = hcloud_server.main.ipv4_address
}

output "vps_ipv6_address" {
  value = hcloud_server.main.ipv6_address
}
