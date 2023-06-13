FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache \
    php \
    php-common \
    php-session \
    php-iconv \
    php-gd \
    php-curl \
    php-xml \
    php-mysqli \
    php-imap \
    php-cgi \
    php-pdo \
    php-pdo_mysql \
    php-soap \
    php-posix \
    php-gettext \
    php-ldap \
    php-ctype \
    php-dom \
    php-simplexml \
    wget

WORKDIR /var/www/html/wordpress

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown root:root /var/www/html/wordpress

EXPOSE 8080

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www/html/wordpress" ]