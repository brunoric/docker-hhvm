docker-hhvm
===========

Docker images to run PHP applications and scripts under HHVM. The intent of these images is to work *out-of-the-box* as an [HHVM-FastCGI][fastcgi] server. The default command is `start.sh` that execute Supervisor to spawn HHVM as a server, but you can also use this image to run php scripts (or phar applications) as described in *How to use* section. If you notice any bug or typo, please let me know. This repository contains the follow images:

| Tag                   | Base image        |
| --------------------- | ----------------- |
| :latest               | ubuntu:trusty     |
| :deb-hhvm             | ubuntu:trusty     |
| :deb-hhvm-dbg         | ubuntu:trusty     |
| :deb-hhvm-dev         | ubuntu:trusty     |
| :deb-hhvm-nightly     | ubuntu:trusty     |
| :deb-hhvm-nightly-dbg | ubuntu:trusty     |
| :deb-hhvm-dev-nightly | ubuntu:trusty     |
| :git                  | ubuntu:trusty     |
| :tag-3.11.1           | brunoric/hhvm:git |
| :tag-X.Y.Z            | brunoric/hhvm:git |

You can build any X.Y.Z tag present at [HHVM Github repository][repository]. Please be aware that not all HHVM versions have support from HHVM project. To see the full information about versions support please see [HHVM release schedule][release-schedule].

How to get?
-----------

**1) Run a container**

The first method of get the images is directly run a container with the desired tag like the example below:

    docker run -it brunoric/hhvm:deb-hhvm hhvm -a

This command will pull the `:deb` image (if you do not have it already) and execute `hhvm -a` command (opening an interactive shell session).

**2) Pull the image**

You can also pull the desired image tag from the Docker Hub with:

    docker pull brunoric/hhvm:deb-hhvm

This command will pull the image (if you do not have it already) without creating any container like the first method does.

**3) Build it**

Finally, if you have time (yes, this can take a while if you not building the deb image), you can build the needed image from scratch. You will need to clone `brunoric/hhvm` from GitHub and use make at the pulled directory:

    # Make command format
    make build-deb HHVM_VERSION=<version>
    # Examples
    make build-deb HHVM_VERSION=hhvm
    make build-deb HHVM_VERSION=hhvm-dbg
    make build-deb HHVM_VERSION=hhvm-nightly

With this method you can also make changes on the Dockerfiles fitting the images to your runtime (eg.: you can change the CORE_NUMBER environment variable to compile faster if you have more than 4 CPU cores).

If you want to build an specific tag you will need to use the following:

    # Make command format
    make build-tag HHVM_VERSION=<version>
    # Examples
    make build-tag HHVM_VERSION=3.11.1
    make build-tag HHVM_VERSION=3.11.0
    make build-tag HHVM_VERSION=3.10.1

How to use?
-----------

**1) HHVM FastCGI server**

As mentioned before, the default command executed by the images is `start.sh` that execute Supervisor to spawn [HHVM as a FastCGI][fastcgi] server:

    docker run -p 9000:9000 brunoric/hhvm:deb-hhvm

After started, this container will have HHVM FastCGI server listen on the port 9000 (eg.: `localhost:9000`). If you have any problems with the `localhost` ServerName you can use `<CONTAINER_IP>:9000`. To get the `<CONTAINER_IP>` value just run the command below:

    docker inspect --format '{{ .NetworkSettings.IPAddress }}' <CONTAINER_ID>

**2) HHVM interactive shell**

You can start a HHVM interactive shell using:

    docker run -it brunoric/hhvm:deb-hhvm hhvm -a

**3) Executing PHP scripts**

There are a bunch of ways to do this task (like the others already described have too), but an interesting way is execute a script sharing the current folder to the container like the follow example:

    docker run --rm -v `pwd`:`pwd` -w `pwd` brunoric/hhvm:deb-hhvm hhvm script.php

Additional notes
----------------

- [Docker documentation][docker].
- [brunoric at Docker Hub][registry].
- [docker-hhvm at Docker Hub][registry-docker-hhvm]

[fastcgi]: https://github.com/facebook/hhvm/wiki/FastCGI
[repository]: https://github.com/facebook/hhvm
[docker]: https://docs.docker.com
[registry]: https://registry.hub.docker.com/u/brunoric
[registry-docker-hhvm]: https://hub.docker.com/r/brunoric/hhvm/
[release-schedule]: https://docs.hhvm.com/hhvm/installation/release-schedule
