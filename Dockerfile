FROM resin/rpi-raspbian
MAINTAINER matteoredaelli

# install required packages
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y --no-install-suggests mongodb
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/docker-shares"]
VOLUME ["/var/lib/mongodb"]

# Define working directory.
#WORKDIR /data

# Define default command.
CMD ["mongod"]

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

ENTRYPOINT /usr/bin/mongod
