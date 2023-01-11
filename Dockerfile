FROM fedora:latest
MAINTAINER ferrywu

RUN yum install -y unrar p7zip p7zip-plugins
RUN yum install -y samba samba-client samba-common net-tools

# build linux kernel requirements
RUN yum -y groupinstall 'Development tools'
RUN yum install -y flex bison dwarves openssl-devel elfutils-libelf-devel bc ncurses-devel
RUN yum install -y kernel-devel

