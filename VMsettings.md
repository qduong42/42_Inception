- hostname: inception

- root password
  - 42

- username
  - qduong
  - password: one

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
    php-phar \
    wget \
    unzip \
    curl && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php81/php-fpm.d/www.conf && \
    # sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php81/php-fpm.d/www.conf && \
    # sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php81/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && unzip latest.zip && \
    rm -rf latest.zip
COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 0777 wp-content/
CMD ["/usr/sbin/php-fpm81", "-F"]qduong
