FROM php:7.2-apache

RUN apt-get update \
  && docker-php-ext-install pdo \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-install mysqli;

COPY --chown=www-data:www-data Locker/public /var/www/html
COPY --chown=www-data:www-data Locker/vendor /var/www/vendor
COPY --chown=www-data:www-data Locker/src /var/www/src
COPY --chown=www-data:www-data Locker/misc /var/www/misc
COPY --chown=www-data:www-data Locker/config /var/www/config
COPY www/locker-docker-entrypoint.sh /usr/local/bin/locker-docker-entrypoint.sh
COPY www/php.ini /usr/local/etc/php/conf.d/php.ini

RUN ["mkdir", "-p", "/var/log/locker"]
RUN ["chown", "www-data:www-data", "/var/log/locker"]

ENTRYPOINT ["/usr/local/bin/locker-docker-entrypoint.sh"]
