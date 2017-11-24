FROM php:7.0-fpm-alpine 
RUN apk update --no-cache \ 
    && apk add --no-cache \
        libmcrypt \ 
        readline \ 
        icu \
        libxml2 \ 
        libxslt \
        zlib \
        libbz2 \
        libcurl \
        freetype \ 
        libjpeg-turbo \  
        libpng \
        icu \
        gettext \
    && apk add --no-cache --virtual .build-deps \
        g++ \
        libmcrypt-dev \ 
        readline-dev \ 
        autoconf \
        icu-dev \
        libxml2-dev \ 
        libxslt-dev \
        zlib-dev \
        bzip2-dev \
        curl-dev \
        freetype-dev \ 
        libjpeg-turbo-dev \  
        libpng-dev \
        make \
        icu-dev \
        gettext-dev \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install hash \
    && docker-php-ext-install simplexml \
    && docker-php-ext-install xml \
    && docker-php-ext-install xsl \
    && docker-php-ext-install soap \
    && docker-php-ext-install json \
    && docker-php-ext-install dom \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gettext \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install iconv \
    && docker-php-ext-install curl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install opcache \
    && pecl install xdebug-2.8.1 \
    && docker-php-ext-enable xdebug \
    && docker-php-source delete \
    && apk del --no-cache .build-deps \ 
    && rm -rf /tmp/* /var/cache/* /var/www/* /usr/src/php.tar.xz /usr/local/bin/phpdbg
EXPOSE 9000 
 