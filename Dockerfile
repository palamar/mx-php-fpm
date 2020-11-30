FROM palamar/mx-php-fpm:7.3 
RUN apk add --no-cache --virtual .build-deps \
        g++ \
        readline-dev \ 
        autoconf \
        icu-dev \
        libxml2-dev \ 
        libxslt-dev \
        zlib-dev \
        libzip-dev \
        bzip2-dev \
        curl-dev \
        freetype-dev \ 
        libjpeg-turbo-dev \  
        libpng-dev \
        make \
        gettext-dev \
        oniguruma-dev \
    && pecl install xdebug \
-   && docker-php-ext-enable xdebug \
    && docker-php-source delete \
    && apk del --no-cache .build-deps \ 
    && rm -rf /tmp/* /var/cache/* /var/www/* /usr/src/php.tar.xz /usr/local/bin/phpdbg
EXPOSE 9000 
 