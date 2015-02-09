FROM ubuntu:trusty

RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.2"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc" 

RUN apt-get update && apt-get install -y redis-server curl

EXPOSE 6379
