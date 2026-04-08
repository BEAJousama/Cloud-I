# Cloud-I

An Ansible-based infrastructure automation project that provisions a DigitalOcean droplet and deploys a containerized web stack (Nginx + WordPress + MariaDB) using Docker Compose.

## Architecture

```
DigitalOcean Droplet
└── Docker Compose
    ├── Nginx          (ports 80/443) — reverse proxy / TLS termination
    ├── WordPress      (port 9000)    — PHP-FPM application
    └── MariaDB        (port 3306)    — database
```

### Ansible Roles

| Role | Description |
|------|-------------|
| `droplet` | Creates a DigitalOcean droplet, registers DNS records for `obeaj.com`, and adds the new host to the Ansible inventory |
| `setup` | Installs Docker, Docker Compose, and copies the Inception project to the remote host |
| `database` | Starts the MariaDB container via Docker Compose |
| `wordpress` | Starts the WordPress container via Docker Compose |
| `webServer` | Starts the Nginx container via Docker Compose |

## Prerequisites

- Python 3 with `pip`
- A [DigitalOcean API token](https://docs.digitalocean.com/reference/api/create-personal-access-token/)
- SSH keys already added to your DigitalOcean account
- TLS certificate and private key for `obeaj.com` placed at `~/certs/`

### Required files in `~/certs/`

| File | Description |
|------|-------------|
| `obeaj.com.key` | TLS private key |
| `www_obeaj_com.crt` | TLS certificate |
| `env` | Environment file with secrets (see below) |

### Environment file (`~/certs/env`)

```env
DO_API_TOKEN=<your_digitalocean_api_token>
# Add any WordPress / MariaDB credentials your docker-compose.yml expects
```

## Usage

### Quick start (via Makefile)

```bash
export DO_API_TOKEN="your_token_here"
make
```

The `make` target will:
1. Copy TLS certificates and the env file into the correct locations
2. Create a Python virtual environment and install Ansible
3. Run the Ansible playbook to provision the droplet and deploy the stack

### Manual setup

```bash
# 1. Install Ansible
python3 -m venv venv
source venv/bin/activate
pip install ansible

# 2. Install the required Ansible collection
ansible-galaxy collection install community.digitalocean

# 3. Export your DigitalOcean API token
export DO_API_TOKEN="your_token_here"

# 4. Run the playbook
ansible-playbook playbook.yaml -i inventory.ini
```

### Cleanup

```bash
make clean
```

Removes the virtual environment, the copied env file, and the certificate files from the repo directory.

## Project Structure

```
.
├── Makefile
├── inventory.ini          # Ansible inventory (static server entry-point)
├── playbook.yaml          # Main playbook
└── roles/
    ├── droplet/           # Provision DigitalOcean droplet & DNS
    ├── setup/             # Install Docker + copy Inception sources
    ├── database/          # Start MariaDB container
    ├── wordpress/         # Start WordPress container
    ├── webServer/         # Start Nginx container
    └── Inception/
        └── srcs/
            ├── docker-compose.yml
            └── requirements/
                ├── nginx/
                ├── wordpress/
                └── mariadb/
```

## Notes

- The playbook targets the `server` host defined in `inventory.ini` for the initial droplet provisioning step, then dynamically adds the newly created droplet IP to a `created_droplets` group for the remaining roles.
- TLS certificates are expected to already be obtained (e.g. via Let's Encrypt or a purchased certificate) before running the automation.
