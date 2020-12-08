#! /bin/bash

# This script will be run as a docker ENTRYPOINT instruction.

set -e

# Services to run in the background at container startup.
# Does not include nginx, as nginx must run in the foreground to keep the container running.
services=( "mysql" "php7.3-fpm" )

for service in ${services[@]}
do
	printf "[\033[0;34mSTARTING\033[0m] \033[0;33m$service\033[0m\n"
	service $service start
	printf "[\033[0;32mSTARTED\033[0m] \033[0;33m$service\033[0m\n"
done

# Disable autoindex if requested
if [ "$DISABLE_AUTOINDEX" == "true" ]; then
	printf "\033[0;33mautoindex \033[0mdisabled.\n"
	sed -i "s/autoindex on/autoindex off/g" /etc/nginx/nginx.conf 
fi

printf "\033[0;34m[STARTING\033[0m] \033[0;33mnginx\033[0m in the foreground.\n"

nginx
