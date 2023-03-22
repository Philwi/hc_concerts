FROM ruby:3.1.2

ENV APP_USER=xfs
# Install nodejs
RUN apt-get update -qq
RUN apt-get update && apt-get install -y \
    software-properties-common

# Update
RUN apt-get update -y

RUN apt-get install bash -y
RUN apt-get install vim -y

ADD . /usr/src/api
WORKDIR /usr/src/api

# Install & run bundler
RUN gem install bundler:'~> 2.1.4'
RUN gem install rake

CMD ./docker-entrypoint.sh
