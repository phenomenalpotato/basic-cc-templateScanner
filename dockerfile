FROM ubuntu
RUN apt-get update --fix-missing
RUN apt-get update

# If you want to use gcc
# RUN apt-get install -y build-essential

# This is to use jq
RUN apt-get install -y jq

# This is to use libcurl
RUN apt-get install -y libcurl4-gnutls-dev

ADD ./Template_Scanner_C /var/

# To start the container in the /var directory 
WORKDIR /var/ 
