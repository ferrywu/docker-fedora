FROM fedora:34

RUN \
    #
    # general tools
    #
    yum install -y unrar p7zip p7zip-plugins && \
    yum install -y samba samba-client samba-common net-tools && \
    yum install -y python2 python3 python-is-python3 && \
    #
    # build linux kernel requirements
    #
    yum -y groupinstall 'Development tools' && \
    yum install -y flex bison dwarves openssl-devel elfutils-libelf-devel bc ncurses-devel && \
    yum install -y kernel-devel && \
    #
    # clean up the yum/dnf cache
    #
    yum clean all && \
    rm -rf /var/cache/dnf/*
