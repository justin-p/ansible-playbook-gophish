# ansible-playbook-gophish

A W.I.P. collection of Ansible Playbooks that deploy Gophish, including the provision of hosts and DNS records using Terraform. 

## Ansible

Will configure the following items to a existing host:

- Installs any needed roles locally with ansible-galaxy.
- Installs any needed packages for Ansible management.
- Update installed packages to latest version.
- Setup Firewall (allows in 22, 80 ,443)
- Create user for gophish service.
- Update the hostname.
- Postfix for mail relay.
- Selfsigned SSL certs.
- NGINX for phishlets.
- Logrotate for gophish.
- Install gophish as a service.

0. Ensure Ansible is installed.

1. Update the inventory file
   - Point to your IP.
   - Set the correct SSH key.
   - Set the correct SSH user.
2. Update `defaults/main.yml`
   - Set `domain` to your root domain.
   - Set `server_hostname` to the desired server hostname.
   - Set `server_phishlet_hostname` to the desired name NGINX will proxy to gophish for phishlets.
   - Update if desired, user and group created to run gophish as `gophish_service_account` and `gophish_service_account_group`
3. Run Playbook
   - `ansible-playbook main.yml --inventory inventory.yml`
4. Login to gophish
   - `ssh -L 3333:127.0.0.1:3333 user@ip`
   - Use your favorite browser and open https://localhost:3333
   - Login using the credentials given to you by the ansible output.
   
## Ansible and Terraform  

### Deploy on DigitalOcean with CloudFlare DNS  

Will create a fresh ubuntu 20.04 droplet and configure the following things:

- Generates unique SSH keys for each deployment.
- Setup basic DNS with CloudFlare.
- Setup up a DigitalOcean Project.
- Setup up a DigitalOcean Firewall that 
  - allows in 22 from `"0.0.0.0/0", "::/0"`
  - allows 80, 443 in from CloudFlare IP ranges.
- Setup up a DigitalOcean Droplet.
- Installs any needed roles locally with ansible-galaxy.
- Installs any needed packages for Ansible management.
- Update installed packages to latest version.
- Setup Firewall (allows in 22, 80 ,443)
- Create user for gophish service.
- Update the hostname.
- Postfix for mail relay.
- Selfsigned SSL certs (for fallback).
- NGINX for phishlets.
- Generate Certificates with certbot and setup auto renewal.
- Logrotate for gophish.
- Install gophish as a service.

0. Ensure Ansible and Terraform are installed.

1. Copy `defaults/main.example.yml` to `defaults/main.yml`
   - Set the correct SSH key folder. (`sshkey_folder`)
   - Set the correct contact mail for certbot (`cerbot_contact_mail`)
   - Set the name for the VPS (`vps_name`)
   - Set `domain` to your root domain.
   - Set `server_hostname` to the desired server hostname.
   - Set `server_phishlet_hostname` to the desired name NGINX will proxy to gophish for phishlets.
   - Update if desired, user and group created to run gophish as `gophish_service_account` and `gophish_service_account_group`
   - Other vars should work as is.
2. Copy `defaults/secrets.example.yml` to `defaults/secrets.yml`
   - Update `cf_api_token` to your CloudFlare API token (https://dash.cloudflare.com/profile/api-tokens).
     - Account Settings -> Read
     - All zones
       - Zone -> Read
       - DNS -> Edit
   - Update `cf_zone_id` to your CloudFlare Zone ID. (https://dash.cloudflare.com/\*id\*/\*domain_name\*)
   - Update `do_token` to your DigitalOcean token (https://cloud.digitalocean.com/account/api/tokens).
   - OPTIONAL BUT RECOMMENDED: Encrypt the `secret.yml` file with [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html#encrypting-files-with-ansible-vault).
3. Not all Terraform variables are currently 'made available' as Ansible variables. For now they can be overwritten by updating `terraform_playbooks\terraform\variables.tf`.
4. Deploy and configure the infrastucture
   - `ansible-playbook main.yml`
5. Login to gophish
   - `ssh -L 3333:127.0.0.1:3333 user@ip`
   - Use your favorite browser and open https://localhost:3333
   - Login using the credentials given to you by the ansible output.   
6. Destroy the infrastructure
   - `ansible-playbook main.yml --tags=destroy`

### Deploy on Hetzer with CloudFlare DNS  

Will create a fresh ubuntu 20.04 droplet and configure the following things:

- Generates unique SSH keys for each deployment.
- Setup basic DNS with CloudFlare.
- Setup up a hetzer VPS with correct Reverse DNS.
- Installs any needed roles locally with ansible-galaxy.
- Installs any needed packages for Ansible management.
- Update installed packages to latest version.
- Setup Firewall (allows in 22, 80 ,443)
- Create user for gophish service.
- Update the hostname.
- Postfix for mail relay.
- Selfsigned SSL certs (for fallback).
- NGINX for phishlets.
- Generate Certificates with certbot and setup auto renewal.
- Logrotate for gophish.
- Install gophish as a service.

0. Ensure Ansible and Terraform are installed.

1. Copy `defaults/main.example.yml` to `defaults/main.yml`
   - Set the correct SSH key folder. (`sshkey_folder`)
   - Set the correct contact mail for certbot (`cerbot_contact_mail`)
   - Set the name for the vps (`vps_name`)
   - Set `domain` to your root domain.
   - Set `server_hostname` to the desired server hostname.
   - Set `server_phishlet_hostname` to the desired name NGINX will proxy to gophish for phishlets.
   - Update if desired, user and group created to run gophish as `gophish_service_account` and `gophish_service_account_group`
   - Other vars should work as is.
2. Copy `defaults/secrets.example.yml` to `defaults/secrets.yml`
   - Update `cf_api_token` to your CloudFlare API token (https://dash.cloudflare.com/profile/api-tokens).
     - Account Settings -> Read
     - All zones
       - Zone -> Read
       - DNS -> Edit
   - Update `cf_zone_id` to your CloudFlare Zone ID. (https://dash.cloudflare.com/\*id\*/\*domain_name\*)
   - Update `hetzer_token` to your hetzer API token (https://console.hetzner.cloud/projects/\*id\*/security/tokens).
   - OPTIONAL BUT RECOMMENDED: Encrypt the `secret.yml` file with [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html#encrypting-files-with-ansible-vault).
3. Not all Terraform variables are currently 'made available' as Ansible variables. For now they can be overwritten by updating `terraform_playbooks\terraform\variables.tf`.
4. Deploy and configure the infrastucture
   - `ansible-playbook main.yml`
5. Login to gophish
   - `ssh -L 3333:127.0.0.1:3333 user@ip`
   - Use your favorite browser and open https://localhost:3333
   - Login using the credentials given to you by the ansible output.      
6. Destroy the infrastructure
   - `ansible-playbook main.yml --tags=destroy`
