FROM brunoric/hhvm:base
MAINTAINER brunoric <brunoric@gmail.com>

ENV HHVM_VERSION HHVM-3.3.5
ENV CORE_NUMBER 4

# Building HHVM
WORKDIR /hhvm-repo
RUN git checkout tags/${HHVM_VERSION}
RUN git submodule update --init --recursive
RUN cmake . && make -j ${CORE_NUMBER} && make install

# Removing the pulled repository
WORKDIR /
RUN rm -rf hhvm-repo

# Exposing HHVM-FastCGI port
EXPOSE 9000

# Default command
CMD ["/scripts/start.sh"]