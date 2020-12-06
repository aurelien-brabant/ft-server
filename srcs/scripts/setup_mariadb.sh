#! /bin/sh

set -e

echo "====== MariaDB setup ======"

# Runs the service 
/etc/init.d/mysql start

# Create a mariadb wordpress user, a wordpress_db database and grant privileges to it for the wordpress user.
mariadb -u root "-p " -Bse	"CREATE USER wordpress@localhost IDENTIFIED BY 'wordpress';"			
mariadb -u root "-p " -Bse	"CREATE DATABASE wordpress_db;"
mariadb -u root "-p " -Bse	"GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress'@'localhost';"	

echo "Database setup done."
