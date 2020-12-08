#! /bin/bash

DB_NAME=wordpress_db
DB_USER=wordpress
DB_PWD=wordpress

#set -e

printf "[\033[0;34mStarting\033[0m] MariaDB setup.\n"

# Runs the service 
service mysql start

# Create a mariadb wordpress user, a wordpress_db database and grant privileges to it for the wordpress user.
mariadb -u root "-p " -Bse	"CREATE USER $DB_USER@localhost IDENTIFIED BY '$DB_PWD';"			
mariadb -u root "-p " -Bse	"CREATE DATABASE $DB_NAME;"
mariadb -u root "-p " -Bse	"GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"	

printf "[\033[0;32mDone\033[0m] MariaDB setup.\n"
