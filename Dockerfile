# PHP
FROM hitalos/php:latest

# NodeJS
ADD install-node.sh /usr/sbin/install-node.sh
RUN ["chmod", "+x", "/usr/sbin/install-node.sh"]
RUN /usr/sbin/install-node.sh

# Angular
RUN npm install -g --silent @angular/cli

# PostgreSQL
ADD install-pgsql.sh /usr/sbin/install-pgsql.sh
RUN ["chmod", "+x", "/usr/sbin/install-pgsql.sh"]
RUN /usr/sbin/install-pgsql.sh

# Setup Angular project
#RUN mkdir /usr/src/app
#WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
#ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
#COPY package.json /usr/src/app/package.json
#RUN npm install

# Run laravel project
#WORKDIR /var/www
#CMD php ./artisan serve --port=80 --host=0.0.0.0
#EXPOSE 80
#HEALTHCHECK --interval=1m CMD curl -f http://localhost/ || exit 1
