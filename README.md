# Angular, Laravel and Docker
Docker image to for Angular and Laravel development.

## Requirements
Before you use this, make "ng build" to your Angular proyect.

## Usage
docker run -p 80:80 --rm -v {your Laravel proyect folder}:/var/www/html/laravel -v {your Angular proyect folder}:/var/www/html angular-laravel

