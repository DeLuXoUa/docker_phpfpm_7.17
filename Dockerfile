FROM php:7.1.17-fpm-jessie

RUN export LANG=C.UTF-8
#RUN apt-get install software-properties-common

RUN apt-get update && apt-get install -y curl libcurl4-openssl-dev
RUN docker-php-ext-install curl
RUN docker-php-ext-enable curl

RUN docker-php-ext-install json
RUN docker-php-ext-enable json

RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install xml
RUN docker-php-ext-enable xml

RUN docker-php-ext-install opcache
RUN docker-php-ext-enable opcache

RUN docker-php-ext-install session
RUN docker-php-ext-enable session

RUN docker-php-ext-install mbstring
RUN docker-php-ext-enable mbstring

RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

RUN docker-php-ext-install pdo
RUN docker-php-ext-enable pdo

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql

RUN apt-get install -y libpq-dev
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-enable pdo_pgsql

RUN apt-get update && apt-get install -y libmagickwand-6.q16-dev --no-install-recommends \
 && ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin \
 && pecl install imagick \
 && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini

RUN pecl install redis
RUN docker-php-ext-enable redis

RUN docker-php-ext-install pcntl
RUN docker-php-ext-enable pcntl

WORKDIR /var/www
CMD ["php-fpm"]
