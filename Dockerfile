# https://binfalse.de/2016/11/25/mail-support-for-docker-s-php-fpm
# https://github.com/docker-library/php/issues/225%  
FROM php:fpm-alpine3.9

RUN apk update; \
    apk add less curl ssmtp freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev g++ \
            autoconf imagemagick-dev libtool make pcre-dev zlib-dev libzip-dev oniguruma-dev tzdata \
    && pecl install imagick

RUN docker-php-ext-install mbstring \
    && docker-php-ext-install exif \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install bcmath \
    && docker-php-ext-enable imagick 

RUN docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  docker-php-ext-install -j${NPROC} gd && \
  apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev autoconf g++ libtool make pcre-dev

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp
