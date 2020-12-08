#! /bin/sh

WP_WEBSITE_PATH="/var/www/html/wordpress"
WP_CLI_PHAR="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

#Exit script on first error
set -e

printf "[\033[0;32mInstalling\033[0m] wp-cli"

wget $WP_CLI_PHAR 

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
printf "[\033[0;32mDONE\033[0m] wp-cli is now installed at /usr/local/bin/wp"

mkdir -p $WP_WEBSITE_PATH 2> /dev/null
cd $WP_WEBSITE_PATH

wp core download --allow-root

printf "[\033[0;32mDONE\033[0m] Wordpress core downloaded at $WP_WEBSITE_PATH !"

service mysql start

wp core config --allow-root --dbname=wordpress_db --dbuser=wordpress --dbpass=wordpress --dbhost="localhost:3306" --dbprefix=wp_

wp core install --allow-root --url="https://localhost/wordpress" --title="ft_server blog" --admin_user="admin" --admin_password="wordpress" --admin_email="abrabant@student.42.fr"

# Cloning my updated libft to demonstrate autoindexing easily
git clone https://github.com/abrabant-42/libft

# Setting the rights
chown -R www-data:www-data $WP_WEBSITE_PATH
