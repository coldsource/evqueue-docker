# Stage1: build
FROM debian:bullseye AS buildstage
ARG branch=master

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y git nginx npm

# Checkout front
RUN git clone https://github.com/coldsource/evqueue-frontend-react
WORKDIR /evqueue-frontend-react
RUN git fetch -a
RUN git checkout $branch

# Build front
RUN npm install
RUN npm run build
RUN npm run pack:js
RUN npm run pack:index
RUN mv htdocs/index.prod.html htdocs/index.html

# Stage2: run
FROM debian:bullseye
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y nginx gettext-base

RUN rm -rf /var/www/html
COPY --from=buildstage /evqueue-frontend-react/htdocs /var/www/html

# Nginx configuration
COPY 01-daemon.conf /etc/nginx/modules-enabled
COPY evqueue-frontend-react.sh /usr/local/bin

CMD /usr/local/bin/evqueue-frontend-react.sh
EXPOSE 80
