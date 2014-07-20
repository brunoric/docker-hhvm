FROM ubuntu:trusty
MAINTAINER brunoric <brunoric@gmail.com>

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
RUN git clone git://github.com/facebook/hhvm.git --depth=1 && cd hhvm && \
	git submodule update --init --recursive

# Building HHVM
RUN cd hhvm && cmake . && make && make install

# HHVM interactive shell
CMD ["/usr/local/bin/hhvm", "-a"]