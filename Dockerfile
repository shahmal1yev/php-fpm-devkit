ARG __PHP_VERSION

FROM php:${__PHP_VERSION}-fpm

ARG __PHP_VERSION
ENV __PHP_VERSION=${__PHP_VERSION}

RUN apt-get update && apt-get install -y \
    gettext-base git unzip curl nano libzip-dev libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p /var/run/php

COPY ./conf/www.conf.template /tmp/www.conf.template
RUN envsubst < /tmp/www.conf.template > /usr/local/etc/php-fpm.d/www.conf

COPY ./conf/zz-docker.conf.template /tmp/zz-docker.conf
RUN envsubst < /tmp/zz-docker.conf > /usr/local/etc/php-fpm.d/zz-docker.conf

COPY ./conf/php.ini /usr/local/etc/php/conf.d/custom.ini
