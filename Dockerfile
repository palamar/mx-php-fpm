FROM php:8.0-fpm-alpine
RUN apk update --no-cache \
    apk upgrade \
    && apk add --no-cache \
        readline \
        icu \
        libxml2 \
        libxslt \
        zlib \
        libzip \
        libbz2 \
        libcurl \
        freetype \
        libjpeg-turbo \
        libpng \
        libintl \
        gettext \
        libltdl \
        oniguruma \
    && apk add --no-cache --virtual .build-deps \
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
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure bcmath --enable-bcmath \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure gettext \
    && docker-php-ext-configure hash \
    && docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-configure mbstring --enable-mbstring \
    && docker-php-ext-install \
        bcmath \
        sockets \
	mbstring \
        simplexml \
        xml \
        xsl \
        soap \
        dom
RUN docker-php-ext-install \
        zip
RUN docker-php-ext-install  \
        pdo \
        pdo_mysql \
        gettext \
        bz2 \
        curl \
        gd \
        opcache \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-source delete \
    && apk del --no-cache .build-deps \
    && rm -rf /tmp/* /var/cache/* /var/www/* /usr/src/php.tar.xz /usr/local/bin/phpdbg
EXPOSE 9000

