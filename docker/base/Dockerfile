FROM debian:unstable
MAINTAINER Jeremías Casteglione <debian@jrms.com.ar>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get clean \
    && apt-get update -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y devscripts \
    && apt-get clean \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y \
    && apt-get install -y bash-completion vim git-dpm dh-make dh-systemd \
       quilt \
    && apt-get clean \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
VOLUME ["/build"]

CMD ["/bin/bash", "--rcfile", "/build/.bashrc"]
