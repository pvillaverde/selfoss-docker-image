
# Download Stable or development version
if [ "${CHANNEL}" != "STABLE" ]
then 
	wget -q https://dl.cloudsmith.io/public/fossar/selfoss-git/raw/names/selfoss.zip/versions/$VERSION/selfoss-$VERSION.zip -P /tmp
else 
	wget -q https://github.com/SSilence/selfoss/releases/download/$VERSION/selfoss-$VERSION.zip -P /tmp
fi
# Checksum hash
CHECKSUM=$(sha256sum /tmp/selfoss-$VERSION.zip | awk '{print $1}')

if [ "${CHECKSUM}" != "${SHA256_HASH}" ]
then
	echo "Warning! Checksum does not match!"
	exit 1
fi
# Unzip
unzip -q /tmp/selfoss-$VERSION.zip -d /var/www/html
chown -R www-data:www-data /var/www/html/

# Development version has a selfoss folder, we move all its files to the parent directory.
if [ "${CHANNEL}" != "STABLE" ]
then
	mv /var/www/html/selfoss/{*,.*} /var/www/html/
	rmdir /var/www/html/selfoss
fi
sed -i -e 's/base_url=/base_url=\//g' /var/www/html/defaults.ini \
rm -rf /tmp/*