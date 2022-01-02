ARG PHP_VERSION
ARG COMPOSER_VERSION

FROM composer:${COMPOSER_VERSION} as composer
FROM php:${PHP_VERSION}

RUN apt-get update && apt-get install -y \
    mariadb-client \
    libmcrypt-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libgmp-dev \
    zlib1g-dev \
    libzip-dev \
    libicu-dev \
    libxml2-dev

RUN docker-php-ext-configure opcache --enable-opcache
RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-configure intl

RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath sockets gd opcache exif zip intl soap

RUN chown -R www-data:www-data /var/www

COPY php.ini /usr/local/etc/php/conf.d/custom.ini

COPY --from=composer /usr/bin/composer /usr/bin/composer
