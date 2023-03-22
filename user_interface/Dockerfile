FROM node:18 AS node

RUN apt-get update
RUN apt-get upgrade -y

ADD . /usr/src/user_interface
WORKDIR /usr/src/user_interface

# does not work in fresh docker image. we have to do it inside the entrypoint script
# RUN npm install --force

CMD ./docker-entrypoint.sh
