# Cloud-I

## Setup

python3 -m venv venv
source venv/bin/activate
pip install ansible
export DO_API_TOKEN=""
ansible-playbook playbook.yaml -i inventory.ini


docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
docker volume rm srcs_database_volume srcs_wordpress_volume
rm -rf /Inception/
rm -rf /Users/bbrahim/Desktop/data
