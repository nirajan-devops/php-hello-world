# only PHP + your code
FROM php:8.3-fpm-alpine

WORKDIR /var/www/html
COPY src/ /var/www/html
