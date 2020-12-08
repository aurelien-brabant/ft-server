#!/bin/bash

PMA_TARBALL="https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz"
PMA_PATH="/var/www/html/phpmyadmin"

cd $SETUP_PATH

wget $PMA_TARBALL

mkdir -p /var/www/html/phpmyadmin 2> /dev/null

tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin

cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php

chmod 660 /var/www/html/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/html/phpmyadmin
