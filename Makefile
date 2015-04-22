all: build

build: build-deb build-base build-dev

build-deb:
	sudo docker build -t brunoric/hhvm:deb deb

build-base:
	sudo docker build -t brunoric/hhvm:base base

build-dev:
	sudo docker build -t brunoric/hhvm:dev dev

build-3.4:
	sudo docker build -t brunoric/hhvm:3.6 3.6

build-3.4:
	sudo docker build -t brunoric/hhvm:3.5 3.5

build-3.4:
	sudo docker build -t brunoric/hhvm:3.4 3.4

build-3.3:
	sudo docker build -t brunoric/hhvm:3.3 3.3

build-3.2:
	sudo docker build -t brunoric/hhvm:3.2 3.2

build-3.1:
	sudo docker build -t brunoric/hhvm:3.1 3.1

build-3.0:
	sudo docker build -t brunoric/hhvm:3.0 3.0

build-2.4:
	sudo docker build -t brunoric/hhvm:2.4 2.4

build-2.3:
	sudo docker build -t brunoric/hhvm:2.3 2.3

build-2.2:
	sudo docker build -t brunoric/hhvm:2.2 2.2