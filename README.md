# Angular, Laravel and Docker
Docker image to for Angular and Laravel development.

## Requirements
Before you use this, make "ng build" to your Angular proyect.

## Usage
docker run -p 80:80 --rm --name <your-own-container-name> -v <your-Laravel-route>:/var/www/html/laravel -v <your-Angular-dist-route>:/var/www/html angular-laravel

