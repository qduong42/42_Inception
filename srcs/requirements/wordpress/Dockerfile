FROM alpine:3.17

ARG DB_NAME \
    DB_USER \
    DB_PASS \
	WORDPRESS_URL \
	WORDPRESS_TITLE \
	WORDPRESS_ADMIN_LOGIN \
	WORDPRESS_ADMIN_PASSWORD \
	WORDPRESS_ADMIN_EMAIL

RUN apk update && apk upgrade && apk add --no-cache \
    php \
	php-fpm \
	php-mysqli \
	php-json \
	php-curl \
	php-dom \
	php-exif \
	php-fileinfo \
	php-mbstring \
	php-openssl \
	php-xml \
	php-zip \
    # php-redis \
    wget \
	curl \
	php-phar \
    unzip \
    rm -f /var/cache/apk/* && \
	rm -rf /etc/php81/php-fpm.d/www.conf
COPY ./conf/www.conf /etc/php81/php-fpm.d/
COPY ./conf/wp-config-create.sh /var/www/
RUN sh /var/www/wp-config-create.sh && rm /var/www/wp-config-create.sh
COPY ./tools/launch.sh .
EXPOSE 9000
# why does CMD run as root? but RUN seems not to. can not configure wp core install. 
# admin and user also can not be configured with environmental variables. they dont expand
# properly. So they are hardcoded.
# ENTRYPOINT ["sh", "launch.sh"]

CMD ["sh", "launch.sh"]