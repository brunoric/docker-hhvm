all: hhvm

hhvm:
	sudo docker build -t brunoric/docker-php:hhvm .