# docker-locker
docker-locker is intended to be an easy-to-use way to user docker in conjunction with the [WarBirdTeam Locker](https://github.com/warbirdteam/Locker) project.

# Requirements
You will need Docker running in swarm mode. It works with Docker v18.06.1 and will probably work just fine with anything else more modern than that.

# Getting Started
Clone this repository, hop into the directory, copy your locker.json config file down (and make any necessary changes), build your images, then start up your swarm (generating database secrets along the way if necessary):

`git clone git@github.com:AKermodeBear/docker-locker.git`
`cd docker-locker`
`cp Locker/config/locker.json .`
`./build`
`./start`

If you have PHP's composer installed, then the build script will install any required dependencies. If you don't have composer, that's okay. It will run composer in a disposable docker container and do its magic.

By default, the web service runs on port 4000. You probably want to change this for a real production system. It's in stack.yml.

# Development
Yup, you can use this for development. After building, run:

`./start dev`

This will do a few things:
1. The various directories in the Locker repository will be mounted as volumes inside of the www container. You can make changes and they will be reflected inside of the container.
2. PHPMyAdmin will be started on port 4001. You can use the 'root' or 'locker' user with the corresponding password in your 'secrets' directory.

Note that this will use the same Docker volume for the database as the non-dev version. 