variable "name" {
  default     = "gophish"
}

resource "random_string" "name" { 
  length = 6
  special = false
  upper = false
}

locals {                        
  name = "${var.name}-${terraform.workspace}-${random_string.name.result}"
}

variable "root_username" {
  description = "The username of the root account"
  default     = "root"
}

variable "root_ssh_key_path" {
  description = "The path of the ssh key for the root account"
  default     = "~/.ssh/root-gophish"
}

variable "do_token" {
  description = "Your Digital Ocean Api token generated from here https://cloud.digitalocean.com/account/api/tokens"
  default     = "123465789"
}

variable "image" {
  description = "The image to use when creating the VPS"
  default     = "ubuntu-20-04-x64"
}
variable "location" {
  description = "Region to create VPS in"
  default     = "ams3"
}

variable "server_type" {
  description = "VPS Size"
  default     = "s-1vcpu-1gb"
}

variable "do_tag" {
  description = "Tag added to the DigitalOcean Droplet"
  default     = "ansible_terra_server"
}

variable "do_description" {
  description = "Description of the new to the DigitalOcean Droplet"
  default     = "Server deployed with Terraform and Ansible"
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
