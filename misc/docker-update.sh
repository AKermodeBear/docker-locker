#!/bin/bash
apt-get update \
&& apt-get install git unzip --yes \
&& curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
&& rm -f /tmp/composer-setup.* \
&& addgroup --system --gid $GID updater \
&& adduser --system --uid $UID --gid $GID --shell /bin/sh updater \
&& cd /Locker \
&& su -c 'composer install' updater
