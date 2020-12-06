FROM		debian:buster

# Prevent apt to ask for confirmation when installing packages
ARG			DEBIAN_FRONTEND=noninteractive

# Making sure everything is up to date
RUN			apt-get update && apt-get dist-upgrade -y

# Installing required packages which can be found using apt
RUN			apt-get install -y			\
				nginx					\
				mariadb-server			\
				lsb-release				\
				apt-transport-https		\
				ca-certificates			\
				wget					\
				php7.3-cli

# Copy scripts to be executed in the container
COPY		/srcs /tmp

# Run manual wordpress installation homemade script
RUN			sh /tmp/scripts/install_wordpress.sh

# Run mariadb setup homemade script
RUN			sh /tmp/scripts/setup_mariadb.sh

ENTRYPOINT	. /tmp/scripts/commands.sh
