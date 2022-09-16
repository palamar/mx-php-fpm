FROM php:7.4-fpm-alpine 
RUN apk update --no-cache \
    apk upgrade \
    && apk add --no-cache \
        freetype-dev \
        icu-dev \
        libxml2-dev \ 
        libxslt-dev \
        zlib-dev \
        libzip-dev \
        bzip2-dev \
        curl-dev \
        readline-dev \ 
        gettext-dev \
        oniguruma-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        g++ \
        autoconf \
        make 
RUN apk add --no-cache \
        freetype \ 
        readline \ 
        icu \
        libxml2 \ 
        libxslt \
        zlib \
        libzip \
        libbz2 \
        libcurl \
        libjpeg-turbo \  
        libpng \
        libintl \
        gettext \
        libltdl \
        oniguruma \
        fontconfig \
        ttf-dejavu
RUN docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure bcmath --enable-bcmath 
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --enable-gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/#  \
    && docker-php-ext-configure gettext \
    && docker-php-ext-configure hash \
    && docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-configure mbstring --enable-mbstring \
    && docker-php-ext-install bcmath \
        sockets \
        mbstring \
        simplexml \
        xml \
        xsl \
        soap \
        json \
        dom \
        intl \
        zip \
        pdo \
        pdo_mysql \
        gettext \
        bz2 \
        curl \
        gd \
        opcache  
RUN pecl install redis \ 
    && pecl install xdebug 
RUN docker-php-ext-enable \
        curl \
        gd \
        opcache \
        redis \
        xdebug \
        intl
RUN docker-php-source delete \
#    && apk del --no-cache .build-deps \ 
    && rm -rf /tmp/* /var/cache/* /var/www/* /usr/src/php.tar.xz /usr/local/bin/phpdbg
EXPOSE 9000 
 
