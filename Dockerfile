# Docker image with PHP 7.2, Apache and Node 10 by https://thecodingmachine.io
FROM thecodingmachine/php:7.2-v1-apache-node10

# Set root user to install postgreSQL
USER root

# PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
# Enable the PostgreSQL extension
ENV PHP_EXTENSION_PGSQL=1

# Enable GD PHP extension
ENV PHP_EXTENSION_GD=1

# Copy .htaccess to rewrite module works with Angular
COPY .htaccess /var/www/html

# Setup Laravel project
RUN if [ ! -d "/var/www/html/laravel" ]; then mkdir /var/www/html/laravel; fi
