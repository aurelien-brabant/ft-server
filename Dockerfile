FROM		debian:buster

# Prevent apt to ask for confirmation when installing packages
ARG			DEBIAN_FRONTEND=noninteractive

# Making sure everything is up to date
RUN			apt-get update && apt-get dist-upgrade -y

# Installing required packages which can be found using apt
RUN			apt-get install -y			\
				nginx					\
				mariadb-client			\
				mariadb-server			\
				lsb-release				\
				apt-transport-https		\
				ca-certificates			\
				wget					\
				php7.3-cli				\
				php-fpm					\
				php-mysql				

# Disable the default pathinfo option, for security concerns.
RUN			sed -i s/pathinfo=1/pathinfo=0/g /etc/php/7.3/fpm/php.ini

# Copy scripts to be executed in the container
COPY		/srcs /tmp

# Run mariadb setup homemade script
RUN			sh /tmp/scripts/setup_mariadb.sh

# Run wordpress installation and setup it
RUN			sh /tmp/scripts/setup_wp.sh

# Run nginx setup script
RUN			sh /tmp/scripts/setup_nginx.sh

ENTRYPOINT	. /tmp/scripts/commands.sh
