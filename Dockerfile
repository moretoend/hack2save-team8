FROM ruby:2.4.1

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nodejs

RUN mkdir -p /var/www/hack2save-team8
WORKDIR /var/www/hack2save-team8
COPY . /var/www/hack2save-team8

RUN bundle install
