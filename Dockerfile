FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

# Copy PHP code
COPY src/ /var/www/html
