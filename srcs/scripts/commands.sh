#! /bin/sh

# This script will be run as a docker ENTRYPOINT instruction.

# Starting up the mysql service - wordpress DB has been configured during image build
service mysql start

# Setting global configuration option "daemon off" to keep the container
# running with nginx in the foreground
nginx -g "daemon off;" 
