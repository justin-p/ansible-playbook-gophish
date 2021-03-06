resource "digitalocean_ssh_key" "main" {
  name       = "${var.name}-${var.root_username}"
  public_key = file("${var.root_ssh_key_path}.pub")
}

resource "digitalocean_tag" "main" {
  name = var.do_tag
}

resource "digitalocean_project" "main" {
  name        = var.name
  description = var.do_description
  purpose     = "Other"
  resources   = [digitalocean_droplet.main.urn]
}

resource "digitalocean_droplet" "main" {
  image              = var.image
  tags               = [digitalocean_tag.main.id]
  name               = "server-${local.name}"
  region             = var.location
  size               = var.server_type
  ipv6               = var.do_ipv6
  monitoring         = var.do_monitoring
  private_networking = var.do_private_networking
  ssh_keys           = [digitalocean_ssh_key.main.fingerprint]

  # Ensure SSH is ready and accepting connections.
  provisioner "remote-exec" {
    inline = ["echo 'Hello world!'"]

    connection {
      type        = "ssh"
      user        = "root"
      host        = digitalocean_droplet.main.ipv4_address
      private_key = file("${var.root_ssh_key_path}")
    }
  }
}

resource "digitalocean_firewall" "main" {
  depends_on  = [digitalocean_tag.main]
  tags        = [digitalocean_tag.main.id]
  droplet_ids = [digitalocean_droplet.main.id]
  name        = var.name

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.do_man_ip
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = var.do_web_ip
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = var.do_web_ip
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
