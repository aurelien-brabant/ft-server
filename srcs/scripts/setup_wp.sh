#! /bin/bash

# General
WP_WEBSITE_PATH="/var/www/html/wordpress"
WP_CLI_PHAR="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

# WP settings
DB_NAME="wordpress_db"
DB_USER="wordpress"
DB_PWD="wordpress"
DB_HOST="localhost:3306"
DB_PREFIX="ft_"

WP_URL="https://localhost/wordpress"
WP_TITLE="ft_server project"
WP_ADMIN_LOGIN="admin"
WP_ADMIN_PWD="admin"
WP_ADMIN_EMAIL="abrabant@student.42.fr"

#Exit script on first error
set -e

printf "[\033[0;32mInstalling\033[0m] wp-cli\n"

wget $WP_CLI_PHAR 

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
printf "[\033[0;32mDONE\033[0m] wp-cli is now installed at /usr/local/bin/wp\n"

mkdir -p $WP_WEBSITE_PATH 2> /dev/null
cd $WP_WEBSITE_PATH

wp core download --allow-root

printf "[\033[0;32mDONE\033[0m] Wordpress core downloaded at $WP_WEBSITE_PATH !\n"

service mysql start

# Installing and configuring Wordpress

wp core config --allow-root --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PWD}" --dbhost="${DB_HOST}" --dbprefix="${DB_PREFIX}"
wp core install --allow-root --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_LOGIN}" --admin_password="${WP_ADMIN_PWD}" --admin_email="${WP_ADMIN_EMAIL}"

# Cloning my updated libft to demonstrate autoindexing easily
git clone https://github.com/abrabant-42/libft

# Setting the rights
chown -R www-data:www-data $WP_WEBSITE_PATH
