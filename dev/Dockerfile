FROM brunoric/hhvm:base
MAINTAINER brunoric <brunoric@gmail.com>

ENV HHVM_VERSION master
ENV CORE_NUMBER 4

# Downloading HHVM from source-code
RUN git clone git://github.com/facebook/hhvm.git hhvm-repo && cd hhvm-repo && \
	git submodule update --init --recursive

# Building HHVM
RUN cd hhvm-repo && git checkout ${HHVM_VERSION} && cmake . && make -j ${CORE_NUMBER} && make install

# Removing the pulled repository
RUN rm -rf hhvm-repo

# Exposing HHVM-FastCGI port
EXPOSE 9000

# Default command
CMD ["/start.sh"]