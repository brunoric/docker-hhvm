FROM ubuntu:trusty
MAINTAINER brunoric <brunoric@gmail.com>

ENV HHVM_VERSION HHVM-3.3
ENV CORE_NUMBER 4

# Installing packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install autoconf automake binutils-dev build-essential cmake g++ git \
	libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev \
	libboost-system-dev libboost-thread-dev libbz2-dev libc-client-dev libldap2-dev \
	libc-client2007e-dev libcap-dev libcurl4-openssl-dev libdwarf-dev libelf-dev \
	libexpat-dev libgd2-xpm-dev libgoogle-glog-dev libgoogle-perftools-dev libicu-dev \
	libjemalloc-dev libmcrypt-dev libmemcached-dev libmysqlclient-dev libncurses-dev \
	libonig-dev libpcre3-dev libreadline-dev libtbb-dev libtool libxml2-dev zlib1g-dev \
	libevent-dev libmagickwand-dev libinotifytools0-dev libiconv-hook-dev libedit-dev \
	libiberty-dev libxslt1-dev ocaml-native-compilers libsqlite3-dev libyaml-dev libgmp3-dev
RUN apt-get clean && apt-get autoremove -y

# Downloading HHVM from source-code
RUN git clone -b $HHVM_VERSION git@github.com:facebook/hhvm.git && cd hhvm && \
	git submodule update --init --recursive

# ONBUILD instructions: https://docs.docker.com/reference/builder/#onbuild

# Building HHVM
ONBUILD RUN cd hhvm && git checkout HHVM-3.3 && cmake . && make -j $CORE_NUMBER && make install

# Scripts
ONBUILD ADD supervisord-hhvm.conf /supervisord-hhvm.conf
ONBUILD ADD supervisord-hhvm.sh /supervisord-hhvm.sh
ONBUILD ADD start.sh /start.sh
ONBUILD RUN chmod 755 /start.sh

# Exposing HHVM-FastCGI port
ONBUILD EXPOSE 9000

# Default command
ONBUILD CMD ["/start.sh"]