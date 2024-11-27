# Makefile

# Variables
HOME_DIR = $(HOME)
CERT_DIR = roles/Inception/srcs/requirements/nginx/cert
KEY_NAME = obeaj.com.key
CERT_NAME = www_obeaj_com.crt
ENV_FILE = env


# Targets
all: setup

setup: copy-files run-commands

copy-files:
	mkdir -p $(CERT_DIR) # Create the cert directory if it doesn't exist
	cp $(HOME_DIR)/certs/$(KEY_NAME) $(CERT_DIR)/$(KEY_NAME) # Replace with actual key path
	cp $(HOME_DIR)/certs/$(CERT_NAME) $(CERT_DIR)/$(CERT_NAME) # Replace with actual cert path
	cp $(HOME_DIR)/certs/$(ENV_FILE) roles/Inception/srcs/.$(ENV_FILE)

DO_API_TOKEN := $(shell grep DO_API_TOKEN roles/Inception/srcs/.env | cut -d '=' -f2)

run-commands:
	python3 -m venv venv && \
	. venv/bin/activate && \
	pip install ansible && \
	export DO_API_TOKEN=$(DO_API_TOKEN) && \
	ansible-playbook playbook.yaml -i inventory.ini