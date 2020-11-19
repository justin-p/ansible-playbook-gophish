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

variable "hetzer_token" {
  description = "Your Hetzer API token"
  default     = "123465789"
}

variable "image" {
  description = "The image to use when creating the VPS"
  default = "ubuntu-20.04"
}

variable "server_type" {
  description = "VPS Size"
  default = "cx11"
}

variable "location" {
  description = "Region to create VPS in"
  default = "nbg1"
}

variable "reverse_dns" {
  description = ""
  default     = "domain.tld"
}
