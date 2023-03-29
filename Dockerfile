FROM fedora:latest

RUN \
    #
    # general tools
    #
    yum install -y vim && \
    yum install -y unrar p7zip p7zip-plugins && \
    yum install -y samba samba-client samba-common net-tools iputils iproute && \
    yum install -y python2 python3 python-is-python3 && \
    #
    # build linux kernel requirements
    #
    yum -y groupinstall 'Development tools' && \
    yum install -y flex bison dwarves openssl-devel elfutils-libelf-devel bc ncurses-devel && \
    yum install -y kernel-devel && \
    #
    # build OpenWrt
    #
    yum --setopt install_weak_deps=False --skip-broken install -y \
        bash-completion bzip2 gcc gcc-c++ git make ncurses-devel patch \
        rsync tar unzip wget which diffutils python2 python3 perl-base \
        perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin \
        perl-Thread-Queue && \
    # for generate .vdi file
    yum install -y qemu-img && \
    #
    # clean up the yum/dnf cache
    #
    yum clean all && \
    rm -rf /var/cache/dnf/*
