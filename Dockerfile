# Docker image with PHP 7.2, Apache and Node 10 by https://thecodingmachine.io
FROM thecodingmachine/php:7.2-v1-apache-node10

ARG laravel="false"
ARG angular_project

# Set root user to install postgreSQL
USER root

# PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
# Enable the PostgreSQL extension
ENV PHP_EXTENSION_PGSQL=1

# Setup Angular project
COPY ./dist/$angular_project* /var/www/html

# Setup Laravel project
RUN if [ ! -d "/var/www/html/laravel" ]; then mkdir /var/www/html/laravel; fi
COPY . /var/www/html/laravel
WORKDIR /var/www/html/laravel
RUN if [ "$laravel" = "true" ] ; then composer install ; fi
RUN if [ "$laravel" = "true" ] ; then sudo chmod -R 777 . ; fi

# Setup listen port
ENV PORT 8080