#! /bin/sh

WP_WEBSITE_PATH="/var/www/html/wordpress"

#Exit script on first error
set -e

echo "=====    Installing wp-cli   ======"

echo "Downloading wp-cli..."
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
echo "wp-cli is now installed at /usr/local/bin/wp"

echo "=====    wp-cli installation done !   ======"

echo "=====    Downloading Wordpress core using wp-cli   ======"

mkdir -p $WP_WEBSITE_PATH 2> /dev/null
cd $WP_WEBSITE_PATH

wp core download --allow-root

echo -e "[\033[0;32mDONE\033[0m] Wordpress core downloaded at $WP_WEBSITE_PATH !"

echo -e "[\033[0;33mPREPARING\033[0m] wp-config.php file generation using wp-cli"

service mysql start

wp core config --allow-root --dbname=wordpress_db --dbuser=wordpress --dbpass=wordpress --dbhost="localhost:3306" --dbprefix=wp_

echo -e "[\033[0;32mDONE\033[0m] Generated wp-config.php file !"


echo -e "[\033[0;33mPREPARING\033[0m] Wordpress installation using wp-cli"

wp core install --allow-root --url="http://localhost/wordpress" --title="ft_server blog" --admin_user="admin" --admin_password="wordpress" --admin_email="abrabant@student.42.fr"

wp post delete 1 --allow-root 

wp post create /tmp/assets/post.txt --post_type=page --post-status=publish --post_title="Welcome to abrabant's ft_server project!" --allow-root
