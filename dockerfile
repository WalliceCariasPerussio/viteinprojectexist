FROM php:5.6-apache

RUN apt-get update && \
    apt-get -y install firebird-dev nano tzdata libzip-dev libicu-dev


RUN   curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@9.6.2

ENV TZ=America/Sao_Paulo
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu
RUN echo "date.timezone = America/Sao_Paulo" >> /usr/local/etc/php/php.ini

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer
RUN docker-php-ext-install interbase zip intl

RUN a2enmod rewrite
RUN service apache2 restart