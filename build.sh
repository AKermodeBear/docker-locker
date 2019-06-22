#!/bin/sh
GIT=$(command -v git)

if [ ! -d "Locker" ]; then
	if [ -z "$GIT" ]; then
		echo "Please fetch a copy of the locker project and place it in the locker directory.";
		exit 1;
	fi
	git clone git@github.com:warbirdteam/Locker.git
fi

COMPOSER=$(command -v composer)

if [ -n "$COMPOSER" ]; then
        cd Locker;
        composer install;
        cd ..;
else
        ./locker-composer-update;
fi

docker build -t locker-docker/www . -f www/Dockerfile
docker build -t locker-docker/db  . -f db/Dockerfile
