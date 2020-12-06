#! /bin/sh

# Configure virtual hosts and various configuration settings in an automated way.

# Copy the hosts from the nginx-hosts folder
cp -r /tmp/nginx-hosts/* /etc/nginx/sites-available

# Enable wordpress_website host
ln -s /etc/nginx/sites-available/wordpress_website /etc/nginx/sites-enabled

# Remove default configuration
unlink /etc/nginx/sites-enabled/default

# Reload the configuration
service nginx reload 
