FROM php:7.0.13-fpm 
RUN apt-get update  \
    && apt-get install -y apt-utils  \
    && apt-get install -y g++  \
    && apt-get install -y git  \
    && apt-get install -y libmcrypt-dev libreadline-dev \
    && docker-php-ext-install -j$(nproc) mcrypt  \
    && docker-php-ext-install -j$(nproc) bcmath  \
    && apt-get install -y libicu-dev \ 
    && docker-php-ext-install -j$(nproc) intl  \
    && docker-php-ext-install -j$(nproc) mbstring  \
    && docker-php-ext-install -j$(nproc) mcrypt  \
    && docker-php-ext-install -j$(nproc) hash  \
    && apt-get install -y  libxml2-dev libxslt-dev \ 
    && docker-php-ext-install -j$(nproc) simplexml  \
    && docker-php-ext-install -j$(nproc) xml  \
    && docker-php-ext-install -j$(nproc) xsl  \
    && docker-php-ext-install -j$(nproc) soap  \
    && docker-php-ext-install -j$(nproc) json  \
    && docker-php-ext-install -j$(nproc) dom  \
    && apt-get install -y zlib1g-dev \ 
    && docker-php-ext-install -j$(nproc) zip  \
    && docker-php-ext-install -j$(nproc) pdo  \
    && docker-php-ext-install -j$(nproc) pdo_mysql  \
    && docker-php-ext-install -j$(nproc) gettext  \
    && apt-get install -y libbz2-dev \  
    && docker-php-ext-install -j$(nproc) bz2  \
    && docker-php-ext-install -j$(nproc) iconv  \
    && apt-get install -y libcurl3-dev \ 
    && docker-php-ext-install -j$(nproc) curl  \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev \  
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \ 
    && docker-php-ext-install -j$(nproc) gd  \
    && docker-php-ext-install opcache  \
    && pecl install xdebug  \
    && pecl install redis  \
    && docker-php-ext-enable redis 
COPY ./conf.d/xdebug.ini /usr/local/etc/php/conf.d/ 
WORKDIR /www/ 
EXPOSE 9000  
 