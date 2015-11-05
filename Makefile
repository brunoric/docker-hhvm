all: build

build: build-deb build-base build-dev

build-deb:
	docker build -t brunoric/hhvm:deb deb

build-base:
	docker build -t brunoric/hhvm:base base

build-dev:
	docker build -t brunoric/hhvm:dev dev

build-3.10:
	docker build -t brunoric/hhvm:3.10 3.10

build-3.9:
	docker build -t brunoric/hhvm:3.9 3.9

build-3.8:
	docker build -t brunoric/hhvm:3.8 3.8

build-3.7:
	docker build -t brunoric/hhvm:3.7 3.7

build-3.6:
	docker build -t brunoric/hhvm:3.6 3.6

build-3.5:
	docker build -t brunoric/hhvm:3.5 3.5

build-3.4:
	docker build -t brunoric/hhvm:3.4 3.4

build-3.3:
	docker build -t brunoric/hhvm:3.3 3.3

build-3.2:
	docker build -t brunoric/hhvm:3.2 3.2

build-3.1:
	docker build -t brunoric/hhvm:3.1 3.1

build-3.0:
	docker build -t brunoric/hhvm:3.0 3.0

build-2.4:
	docker build -t brunoric/hhvm:2.4 2.4

build-2.3:
	docker build -t brunoric/hhvm:2.3 2.3

build-2.2:
	docker build -t brunoric/hhvm:2.2 2.2
