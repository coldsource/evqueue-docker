FROM debian:stretch
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y git apache2 libapache2-mod-php7.0 php7.0-xml php7.0-zip
RUN git clone https://github.com/coldsource/evqueue-frontend-php
RUN ln -s /evqueue-frontend-php/htdocs /usr/share/evqueue
RUN ln -s /evqueue-frontend-php/debian/etc/evqueue/apache.conf /etc/apache2/conf-enabled/evqueue.conf
RUN ln -s /evqueue-frontend-php/debian/etc/evqueue /etc/evqueue
CMD . /etc/apache2/envvars; apache2 -DFOREGROUND
EXPOSE 80
