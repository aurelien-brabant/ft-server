#! /bin/sh

# ---- [SSL] ------ #

OPENSSL_DIR=/etc/openssl

mkdir $OPENSSL_DIR 2> /dev/null

openssl req -newkey rsa:4096					\
			-x509								\
			-sha256								\
			-days 365							\
			-nodes								\
			-out $OPENSSL_DIR/localhost.crt		\
			-keyout $OPENSSL_DIR/localhost.key	\
			-subj "/C=FR/CN=localhost"


cp $SETUP_PATH/nginx/nginx.conf /etc/nginx/nginx.conf

service nginx reload
