FROM fedora:latest
MAINTAINER ferrywu

RUN yum install -y unrar p7zip p7zip-plugins
RUN yum install -y samba samba-client samba-common net-tools

