FROM brunoric/hhvm:base
MAINTAINER brunoric <brunoric@gmail.com>

ENV HHVM_VERSION HHVM-3.4.0
ENV CORE_NUMBER 4

# Building HHVM
RUN cd hhvm-repo && git checkout tags/${HHVM_VERSION} && cmake . && make -j ${CORE_NUMBER} && make install

# Removing the pulled repository
RUN rm -rf hhvm-repo

# Exposing HHVM-FastCGI port
EXPOSE 9000

# Default command
CMD ["/scripts/start.sh"]