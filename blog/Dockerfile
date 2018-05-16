FROM python:2.7

#SET THE ARGUMENTS
ARG proxy


WORKDIR /web

#IF PROXY MACHINE - SET ALL CONFIGURATIONS
#SET THE ENV VARIABLES FOR DOWNLOAD
ENV http_proxy $proxy
ENV https_proxy $proxy

#INSTALL VIM PACKAGE,NETSTAT AND CRUDINI
RUN apt-get update && \
    apt-get -y install net-tools && \
    apt-get -y install vim && \
    apt-get -y install crudini

###############################
### STEP: SETUP CONGIFS #######


RUN git config --global http.sslVerify "false" && \

    git config --global http.sslversion sslv3 && \

    git config --global  http.verify "false"



#GIT CLONE

#git url

#EXPOSE AS BOTTLE WILL RUN IN THIS PORT

EXPOSE 8082



COPY bin/entrypoint.sh /blog-docker/bin/entrypoint.sh

ENTRYPOINT ["/blog-docker/bin/entrypoint.sh"]

COPY bin/entrypoint-1ppc.sh /blog-docker/bin/entrypoint-1ppc.sh

