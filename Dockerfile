FROM php:7.4-apache
LABEL MAINTAINER="Pablo Villaverde <https://github.com/pvillaverde>"

# Install system dependencies
RUN apt-get update -y && apt-get install -y curl unzip wget libzip-dev libpng-dev libicu-dev libcurl4-openssl-dev
# Install PHP Required Extensions
RUN docker-php-ext-install gd curl intl zip
# Enable Apache Required Modules
RUN a2enmod rewrite authz_core headers

# DEFAULT ARGS
ARG CHANNEL="STABLE"
ARG VERSION="2.18"
ARG SHA256_HASH="0b3d46b0b25170f99e3e29c9fc6a2e5235b0449fecbdad902583c919724aa6ed"

#ARG CHANNEL="DEVELOPMENT"
#ARG VERSION="2.19-699ff79"
#ARG SHA256_HASH="97a9c2be95bd482902c5a982b57bb71aa6d25e5095a71992b9bfd9431dbec6b9"

ENV CRON_PERIOD=15m

# Install Selfoss
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh && /setup.sh
RUN rm /setup.sh

COPY rootfs /
RUN chmod +x /root/*
VOLUME /var/www/html/data
EXPOSE 80
CMD ["/root/run.sh"]
#CMD ["apache2-foreground"]