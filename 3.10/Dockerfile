# brunoric/docker-hhvm:3.10
FROM brunoric/hhvm:base
MAINTAINER brunoric <brunoric@gmail.com>

ENV HHVM_VERSION HHVM-3.10.1
ENV CORE_NUMBER 4

# Building HHVM
WORKDIR /hhvm-repo
RUN git checkout tags/${HHVM_VERSION}
RUN git submodule update --init --recursive
RUN cmake -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock .
RUN make -j ${CORE_NUMBER}
RUN make install

# Removing the pulled repository
WORKDIR /
RUN rm -rf hhvm-repo

# Exposing HHVM-FastCGI port
EXPOSE 9000

# Default command
CMD ["/scripts/start.sh"]
