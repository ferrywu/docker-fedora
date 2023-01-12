FROM fedora:37
MAINTAINER ferrywu

RUN yum install -y unrar p7zip p7zip-plugins
RUN yum install -y samba samba-client samba-common net-tools

# build linux kernel requirements
RUN yum -y groupinstall 'Development tools'
RUN yum install -y flex bison dwarves openssl-devel elfutils-libelf-devel bc ncurses-devel
RUN yum install -y kernel-devel

# build OpenWrt
RUN dnf --setopt install_weak_deps=False --skip-broken install -y \
bash-completion bzip2 gcc gcc-c++ git make ncurses-devel patch \
rsync tar unzip wget which diffutils python2 python3 perl-base \
perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin \
perl-Thread-Queue
# for generate .vdi file
RUN dnf install -y qemu-img

