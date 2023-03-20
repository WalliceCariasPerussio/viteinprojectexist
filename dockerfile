FROM php:5.6-apache
RUN apt-get update && \
    apt-get install -y firebird-dev nano tzdata && \
    docker-php-ext-install interbase && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@9.6.2

ENV TZ=America/Sao_Paulo
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu

RUN echo "date.timezone = America/Sao_Paulo" >> /usr/local/etc/php/php.ini

RUN a2enmod rewrite
RUN service apache2 restart