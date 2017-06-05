# README

### How to run:
Requirements:
* [Docker](https://docs.docker.com/engine/installation/)
* [Docker-Compose](https://docs.docker.com/compose/install/)
* [Facebook Login](https://developers.facebook.com/apps)

Place your Facebook_APP_ID and your Facebook_Secret_ID inside a file named .env,
there is a '.env.sample' file that you can use as reference.

You need also to set up the database.yml, there is a database-sample.yml that
you can use as reference.

To build the container:
>$ docker-compose build

First time? Then:
>$ docker-compose run web rails db:create

Then start the container:
>$ docker-compose up

To enter the container environment:
>$ docker-compose run web bash

Remember that all the files created inside the container will belong to root.

