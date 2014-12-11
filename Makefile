all: build

build: build-deb build-base build-dev

build-deb:
	sudo docker build -t brunoric/hhvm:deb deb

build-base:
	sudo docker build -t brunoric/hhvm:base base

build-dev:
	sudo docker build -t brunoric/hhvm:dev dev

build-3.4:
	sudo docker build -t brunoric/hhvm:3.4 3.4