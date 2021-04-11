FROM php:7.3.27-cli-buster

# Install PHP extensions
RUN apt-get update && apt-get install -y \
      libpq-dev \
      libicu-dev \
    && rm -r /var/lib/apt/lists/* \
    && docker-php-ext-install \
      pdo_pgsql \
      pgsql \
      opcache

RUN pecl install xdebug && docker-php-ext-enable xdebug