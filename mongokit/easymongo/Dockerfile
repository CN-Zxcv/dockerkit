FROM php:8.3-apache

ENV NGINX_HOSTNAME=rockmongo.docker.local MONGO_SERVER=localhost MONGO_PORT=27017 MONGO_AUTH=false MONGO_USERNAME= MONGO_PASSWORD= ROCKMONGO_AUTH=false ROCKMONGO_USER=admin ROCKMONGO_PASSWORD=admin

RUN apt-get update && apt-get install -y \
    git curl libssl-dev\
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN git clone https://github.com/pkuoliver/EasyMongo.git .

RUN composer require mongodb/mongodb

RUN pwd
COPY config.php config.php

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]