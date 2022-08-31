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

RUN if [ "${CHANNEL}" != "STABLE" ]; \
	then wget -q https://dl.cloudsmith.io/public/fossar/selfoss-git/raw/names/selfoss.zip/versions/$VERSION/selfoss-$VERSION.zip -P /tmp; \
	else wget -q https://github.com/SSilence/selfoss/releases/download/$VERSION/selfoss-$VERSION.zip -P /tmp; \
	fi \
	&& CHECKSUM=$(sha256sum /tmp/selfoss-$VERSION.zip | awk '{print $1}') \
	&& if [ "${CHECKSUM}" != "${SHA256_HASH}" ]; then echo "Warning! Checksum does not match!" && exit 1; fi \
	&& unzip -q /tmp/selfoss-$VERSION.zip -d /var/www/html && chown -R www-data:www-data /var/www/html/ \
	&& if [ "${CHANNEL}" != "STABLE" ]; then mv {/var/www/html/selfoss/*,/var/www/html/selfoss/.*} /var/www/html/ && rmdir /var/www/html/selfoss; fi \
	&& sed -i -e 's/base_url=/base_url=\//g' /var/www/html/defaults.ini \
	&& rm -rf /tmp/*

COPY rootfs /
RUN chmod +x /root/*
VOLUME /var/www/html/data
EXPOSE 80
CMD ["/root/run.sh"]
#CMD ["apache2-foreground"]