# README

How to run?
You need docker and docker-compose:
https://docs.docker.com/engine/installation/
https://docs.docker.com/compose/install/

To build the container:
$ docker-compose build

First time? Then:
$ docker-compose run web rails db:create

Then start the container:
$ docker-compose up

To enter the container environment:
$ docker-compose run web bash

Remember that all the files created inside the container will belong to root.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.4.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
