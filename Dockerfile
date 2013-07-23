FROM ubuntu
MAINTAINER Kimbro Staken

RUN apt-get install -y python-software-properties python
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs
#RUN apt-get install -y nodejs=0.6.12~dfsg1-1ubuntu1
RUN mkdir /var/www
RUN npm install -g supervisor

ADD app.js /var/www/app.js

CMD ["/usr/bin/supervisor", "/var/www/app.js"] 
