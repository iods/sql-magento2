#
# [MySQL 8.0] Dockerfile
#
FROM ubuntu:latest

LABEL \
	maintainer="Rye Miller" \
	vendor="The Dark Society" \
	version="0.1.0"

ARG DEBIAN_FRONTEND=noninteractive

ENV \
	MYSQL_USER=mysql \
	MYSQL_VERSION=5.7 \
	MYSQL_DATA_DIR=/var/lib/mysql \
	MYSQL_RUN_DIR=/run/mysqld \
	MYSQL_LOG_DIR=/var/log/mysql

# install the latest updates
RUN \
	set -eux \
	&& apt-get update -q \
	&& apt-get upgrade -qq -y

# install mysql client and server
RUN \
	apt-get update \
	&& apt-get install -y \
		curl \
		mysql-client \
		mysql-server=${MYSQL_VERSION}*; \
	rm -rf ${MYSQL_DATA_DIR} \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entry.sh

# enable remote access
# should i add this to the cnf myself?
RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# install the database
# ADD ./theDatabase.sql /var/db/database.sql

# default settings
ENV user developer
ENV password developer
ENV url file:/var/db/database.sql
ENV right READ

# install default script
ADD ./init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh

EXPOSE 3306

CMD ["/usr/local/bin/init.sh"]