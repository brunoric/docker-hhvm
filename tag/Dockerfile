# brunoric/docker-hhvm:tag
FROM brunoric/hhvm:git
MAINTAINER brunoric <brunoric@gmail.com>

ENV CORE_NUMBER 8

# Building HHVM
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
