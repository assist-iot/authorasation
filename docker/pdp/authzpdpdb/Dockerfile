FROM mysql:latest

# Environment variables
ENV MYSQL_ROOT_PASSWORD=S21sec
ENV MYSQL_DATABASE=authzDB

# Allows you to change the value of "max_allowed_packet"
ADD ["conf_mysql.cnf", "/etc/mysql/conf.d/conf_mysql.cnf"]
#ADD ["docker.cnf", "/etc/mysql/conf.d/docker.cnf"]

# Create Database
RUN	mkdir /usr/sql
RUN	chmod 644 /usr/sql

ADD ["authdb_with_init_data.sql", "/docker-entrypoint-initdb.d/authzdb.sql"]
