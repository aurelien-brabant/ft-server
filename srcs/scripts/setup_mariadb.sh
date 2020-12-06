#! /bin/sh

# Runs the service 
/etc/init.d/mysql start

# Create a database for wordpress
mariadb -u root -p -Bse "CREATE DATABASE wordpress;"
