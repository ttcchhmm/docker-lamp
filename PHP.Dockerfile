FROM php:apache
RUN pecl install xdebug && docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql && docker-php-ext-enable xdebug
COPY docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY docker-php.conf /etc/apache2/conf-available/docker-php.conf