#! /bin/sh

echo "=====    Installing Wordpress   ======"
echo ">>    Custom script by abrabant     <<"

# Ensures that /var/www/html folder architecture exists.
mkdir -p /var/www/html 2> /dev/null

cd /tmp

echo ">> Downloading latest version of Wordpress."
wget -c https://wordpress.org/latest.tar.gz

echo ">> Decompressing Wordpress archive."
tar -xvf latest.tar.gz
mv wordpress/ /var/www/html

chown -R www-data:www-data /var/www/html/wordpress
chmod 755 -R /var/www/html/wordpress
echo ">> Permissions have been set."

echo "=====    Wordpress installation done !   ======"
