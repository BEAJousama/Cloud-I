#!/bin/bash

# Start MySQL service
service mysql start
sleep 1

# Execute SQL commands
mysql -u root --password="$ROOT_PASSWORD" << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Kill MySQL processes safely
kill `cat /var/run/mysqld/mysqld.pid`
sleep 1

# Start MySQL in the foreground
mysqld
