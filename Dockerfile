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
				wget					\
				php7.3-cli				\
				php-curl				\
				php-gd					\
				php-dom					\
				php-mbstring			\
				php-imagick				\
				php-zip					\
				php-fpm					\
				php-mysql				\
				openssl					\
				curl					\
				zip						\
				git

# Disable the default pathinfo option, for security concerns.
RUN			sed -i s/pathinfo=1/pathinfo=0/g /etc/php/7.3/fpm/php.ini

# Copy setup files in /tmp/setup and set the SETUP_PATH env.
COPY		/srcs /tmp/setup
ENV			SETUP_PATH=/tmp/setup

# mariadb setup homemade script
RUN			bash $SETUP_PATH/scripts/setup_mariadb.sh

# wordpress setup script
RUN			bash $SETUP_PATH/scripts/setup_wp.sh

# phpMyAdmin setup script
RUN			bash $SETUP_PATH/scripts/setup_pma.sh

# nginx setup script
RUN			bash $SETUP_PATH/scripts/setup_nginx.sh

# The list of things to be done when container is started.
ENTRYPOINT	bash -c "source $SETUP_PATH/scripts/commands.sh"
