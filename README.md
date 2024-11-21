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




CREATE DATABASE IF NOT EXISTS   $DB_NAME;
CREATE USER '$DB_USER_NAME' IDENTIFIED BY '$DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';