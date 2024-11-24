# Cloud-I

## Setup

python3 -m venv venv
source venv/bin/activate
pip install ansible
export DO_API_TOKEN=""
ansible-playbook playbook.yaml -i inventory.ini