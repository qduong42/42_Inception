FROM alpine:3.17

ARG DB_NAME \
    DB_USER \
    DB_PASS

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
	php-phar && \
    rm -f /var/cache/apk/*

COPY ./conf/www.conf /etc/php81/php-fpm.d/

COPY ./tools /var/www

EXPOSE 9000

# ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD ["sh", "/var/www/launch.sh"]

//# wp core install --allow-root --url=127.0.0.1 --title=inception --admin_user=chief --admin_password=chief222 --admin_email=creator@42.fr;

wp core install --allow-root --url=127.0.0.1 --title=inception --admin_user=chief --admin_password=chief222 --admin_email=creator@42.fr;