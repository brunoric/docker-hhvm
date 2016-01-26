# docker-hhvm
# brunoric <brunoric@gmail.com>

ifndef HHVM_VERSION
	HHVM_VERSION=hhvm
endif

# For HHVM deb packages the HHVM_VERSION possible values are:
# hhvm, hhvm-dbg, hhvm-dev, hhvm-nightly, hhvm-nightly-dbg, hhvm-dev-nightly
# https://docs.hhvm.com/hhvm/installation/linux#ubuntu-14.04-trusty
build-deb:
	docker build --build-arg HHVM_VERSION=$(HHVM_VERSION) -t brunoric/hhvm:deb-$(HHVM_VERSION) deb

build-git:
	docker build -t brunoric/hhvm:git git

# For HHVM tag packages the HHVM_VERSION possible values are:
# 3.11.1, 3.11.0, 3.10.1 ... all tags on HHVM Github repository.
# https://github.com/facebook/hhvm

build-tag:
	docker build --build-arg HHVM_VERSION=$(HHVM_VERSION) -t brunoric/hhvm:tag-$(HHVM_VERSION) tag
