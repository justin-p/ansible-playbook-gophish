resource "hcloud_ssh_key" "main" {
    name = "${var.root_username}-${local.name}"
    public_key = file("${var.root_ssh_key_path}.pub")
}

resource "hcloud_server" "main" {         
  name = "server-${local.name}"           
  image = var.image
  server_type = var.server_type
  location = var.location
  backups = "false"
  ssh_keys = [hcloud_ssh_key.main.id]

  # Ensure SSH is ready and accepting connections.
  provisioner "remote-exec" {
    inline = ["echo 'Hello world!'"]

    connection {
      type        = "ssh"
      user        = "root"
      host        = hcloud_server.main.ipv4_address
      private_key = file("${var.root_ssh_key_path}")
    }
  }
}

resource "hcloud_rdns" "master" {
  server_id = hcloud_server.main.id
  ip_address = hcloud_server.main.ipv4_address
  dns_ptr = var.reverse_dns
}