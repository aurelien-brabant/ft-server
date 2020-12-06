#! /bin/sh

# This script will be run as a docker ENTRYPOINT instruction.

# Start required services
echo "===== \033[0;33mSTARTING \033[0mft_server required services ======"
service mysql start
service php7.3-fpm start 

# Setting global configuration option "daemon off" to keep the container
# running with nginx in the foreground
nginx -g "daemon off;" 

if [ $? -eq 0 ]; then
	echo -e ">> \033[0;32mnginx web server successfully started. Running in the foreground to keep the container running.\033[0m"
else
	echo -e ">> \033[0;31mSeems that nginx failed to start properly.\033[0m"
fi
