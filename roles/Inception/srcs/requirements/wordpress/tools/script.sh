#!/bin/bash

# Change to the WordPress directory
cd /var/www/html

# Download WordPress core files
wp core download --path=/var/www/html --allow-root

# Remove sample config files
rm -rf wp-config-sample.php wp-config.php

# Manually create wp-config.php
cat > wp-config.php << EOF
<?php
define('DB_NAME', '$DB_NAME');
define('DB_USER', '$DB_USER_NAME');
define('DB_PASSWORD', '$DB_USER_PASS');
define('DB_HOST', '$HOST');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

\$table_prefix = 'wp_';
define('WP_DEBUG', false);

require_once ABSPATH . 'wp-settings.php';
EOF

# Set correct permissions
chown www-data:www-data wp-config.php
chmod 644 wp-config.php

# Start PHP-FPM
service php7.3-fpm start

# Install WordPress core
wp core install --url=$DOMAIN_NAME \
    --title="Inception" \
    --admin_name=bbrahim \
    --admin_password=admin@42 \
    --admin_email=bbrahim@student.1337.ma \
    --path=/var/www/html/ \
    --allow-root

# Create additional user
wp user create boumlikbrahim \
    boumlikbrahim@student.1337.ma \
    --role=author \
    --user_pass=wpuser@123 \
    --allow-root \
    --path=/var/www/html/


# Stop PHP-FPM
service php7.3-fpm stop

# Ensure correct ownership
chown -R www-data:www-data /var/www/html

# Start PHP-FPM in foreground
php-fpm7.3 -F
EOF