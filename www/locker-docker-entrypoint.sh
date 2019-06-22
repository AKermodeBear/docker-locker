#!/bin/sh
set -e

echo "Updating locker configuration file."
php -r '$config = json_decode(file_get_contents("/var/www/config/locker.json"), true); $config["mysql"]["server"] = "db"; $config["mysql"]["password"] = trim(file_get_contents("/var/run/secrets/db.user.pass")); file_put_contents("/var/www/config/locker.json", json_encode($config));'
# sed -i "s/\"password\":.*$/\"password\": \"$(cat /var/run/secrets/db.user.pass)\",/g" /var/www/config/locker.json

echo "Starting standard php:7.2-apache entry point."
/usr/local/bin/docker-php-entrypoint apache2-foreground
