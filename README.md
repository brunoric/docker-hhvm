docker-hhvm
===========

| Tag       | Build Status             | Base image             | Release Date | End of Support     |
| --------- | ------------------------ | ---------------------- | ------------ | ------------------ |
| :latest   | ![Latest][build-passing] | ubuntu:trusty          | 28 Oct 2015  | 22 Dec 2015        |
| :deb      | ![Latest][build-passing] | ubuntu:trusty          | 28 Oct 2015  | 22 Dec 2015        |
| :base     | ![Latest][build-passing] | ubuntu:trusty          | 04 Nov 2015  | 22 Dec 2015        |
| :dev      | ![Latest][build-passing] | brunoric/hhvm:base     | ...          | ...                |
| :3.10     | ![Latest][build-passing] | brunoric/hhvm:base     | 28 Oct 2015  | 22 Dec 2015        |
| :3.9      | ![Latest][build-passing] | brunoric/hhvm:base     | 14 Aug 2015  | 15 Jul 2016 (LTS)  |
| :3.8      | ![Latest][build-passing] | brunoric/hhvm:base     | 13 Jul 2015  | 13 Aug 2015        |
| :3.7      | ![Latest][build-passing] | brunoric/hhvm:base     | 27 Apr 2015  | 12 Jul 2015        |
| :3.6      | ![Latest][build-passing] | brunoric/hhvm:base     | 11 Mar 2015  | 28 Jan 2016 (LTS)  |
| :3.5      | ![Latest][build-passing] | brunoric/hhvm:base     | 16 Jan 2015  | 10 Mar 2015        |
| :3.4      | ![Latest][build-passing] | brunoric/hhvm:base     | 13 Nov 2014  | 15 Jan 2015        |
| :3.3      | ![Latest][build-passing] | brunoric/hhvm:base     | 19 Sep 2014  | 13 Aug 2015 (LTS)  |
| :3.2      | ![Latest][build-passing] | brunoric/hhvm:base     | 17 Jul 2014  | 18 Sep 2014        |
| :3.1      | ![Latest][build-passing] | brunoric/hhvm:base     | 27 May 2014  | 16 Jul 2014        |
| :3.0      | ![Latest][build-passing] | brunoric/hhvm:base     | 27 Mar 2014  | 26 May 2014        |
| :2.4      | ![Latest][build-passing] | brunoric/hhvm:base     | 31 Jan 2014  | 26 Mar 2014        |
| :2.3      | ![Latest][build-failing] | brunoric/hhvm:base     | 12 Dec 2013  | 30 Jan 2014        |
| :2.2      | ![Latest][build-failing] | brunoric/hhvm:base     | 16 Oct 2013  | 11 Dec 2013        |

Docker images to run PHP applications and scripts under HHVM. The intent of these images is to work *out-of-the-box* as
an [HHVM-FastCGI][fastcgi] server. The default command is `start.sh` that execute Supervisor to spawn HHVM as a server,
but you can also use this image to run php scripts (or phar applications) as described in *How to use* section. If you
notice any bug or typo, please let me know. This repository contains the follow images:

- **`:latest`** - This image is an alias to `deb`.
- **`:deb`** - This image uses the official [deb package of HHVM for Ubuntu 14.04][deb-package].
- **`:base`** - This image is just the base for the compiled images (i.e. all of them but `:deb`).
- **`:dev`** - This image contains the development version from [HHVM GitHub repository][repository].
- **`:2.2`** **`:2.3`** **`:2.4`** **`:3.0`** to **`:3.10`** - These images contains all specific version tags from [HHVM GitHub repository][repository].

How to get?
-----------

**1) Run a container**

The first method of get the images is directly run a container with the desired tag like the example below:

    docker run -it brunoric/hhvm:deb hhvm -a

This command will pull the :deb image (if you do not have it already) and execute `hhvm -a` command (opening an
interacte shell session).

**2) Pull the image**

You can also pull the desired image tag from the Docker Hub with:

    docker pull brunoric/hhvm:deb

This command will pull the image (if you do not have it already) without creating any container like the first method
does.

    docker pull brunoric/hhvm

You can also pull all the images from this repository just not adding a tag to the command like the above example.

**3) Build it**

Finally, if you have time (yes, this can take a while if you not building the deb image), you can build the needed image
from scratch. To do so you need to clone `brunoric/hhvm` from GitHub and use make at the pulled directory  

	make build-<version> # example: make build-deb

With this method you can also make changes on the Dockerfiles fitting the images to your runtime (eg.: you can change
the CORE_NUMBER enviroment variable to compile faster if you have more than 4 CPU cores).

How to use?
-----------

**1) HHVM FastCGI server**

As mentioned before, the default command executed by the images is `start.sh` that execute Supervisor to spawn [HHVM as
a FastCGI][fastcgi] server:

	docker run -p 9000:9000 brunoric/hhvm:deb

After started, this container will have HHVM FastCGI server listen on the port 9000 (eg.: `localhost:9000`). If you have
any problems with the `localhost` ServerName you can use `<CONTAINER_IP>:9000`. To get the `<CONTAINER_IP>` value just
run the command below:

    docker inspect --format '{{ .NetworkSettings.IPAddress }}' <CONTAINER_ID>

**2) HHVM interactive shell**

You can start a HHVM interactive shell using:

    docker run -it brunoric/hhvm:deb hhvm -a

**3) Executing PHP scripts**

There are a bunch of ways to do this task (like the others already described have too), but an interesting way is
execute a script sharing the current folder to the container like the follow example:

    docker run --rm -v `pwd`:`pwd` -w `pwd` brunoric/hhvm:deb hhvm script.php

Additional notes
----------------

- [Docker documentation][docker].
- [brunoric at Docker Hub][registry].
- The build statuses are inserted manually after my tests because since 3.7 version Docker Hub, Travis-CI and CircleCI are not able to compile HHVM due RAM memory limitations... :disappointed:.

[deb-package]: https://github.com/facebook/hhvm/wiki/Prebuilt-Packages-on-Ubuntu-14.04
[fastcgi]: https://github.com/facebook/hhvm/wiki/FastCGI
[repository]: https://github.com/facebook/hhvm
[docker]: https://docs.docker.com
[registry]: https://registry.hub.docker.com/u/brunoric
[build-passing]: http://img.shields.io/badge/build-passing-green.svg
[build-failing]: http://img.shields.io/badge/build-failing-red.svg
[repository-hub]: https://registry.hub.docker.com/u/brunoric/hhvm
[web-hooks]: http://docs.docker.com/userguide/dockerrepos/#webhooks
