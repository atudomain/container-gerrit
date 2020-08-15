FROM ubuntu:20.04
MAINTAINER atudomain

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install apt-utils

RUN apt-get -y install gnupg2
RUN echo "deb mirror://mirrorlist.gerritforge.com/bionic gerrit contrib" > /etc/apt/sources.list.d/GerritForge.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 847005AE619067D5

RUN apt-get update
RUN apt-get -y install sudo

RUN apt-get -y install openjdk-11-jdk
RUN apt-get -y install gerrit=3.2.3-1 && apt-mark hold gerrit
RUN mv /var/gerrit /var/gerrit-tmp

EXPOSE 29418 8080

COPY entrypoint.sh /entrypoint.sh
RUN  chmod 550     /entrypoint.sh
ENTRYPOINT         /entrypoint.sh
