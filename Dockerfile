FROM nginx:1.27-alpine AS nginx

FROM php:8.3-fpm-alpine AS php

# ---------- final image ----------
FROM alpine:3.20
COPY --from=nginx /etc/nginx /etc/nginx
COPY --from=nginx /usr/sbin/nginx /usr/sbin/nginx
COPY --from=php /usr/local /usr/local

WORKDIR /var/www/html
COPY src/ /var/www/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
