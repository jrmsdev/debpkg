FROM debian:unstable
MAINTAINER Jeremías Casteglione <debian@jrms.com.ar>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get clean \
    && apt-get update -y \
    && apt-get dist-upgrade -y \
    && apt-get clean \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*

ENV INSTALL_PKGS devscripts git-buildpackage

RUN apt-get update -y \
    && apt-get install -y $INSTALL_PKGS \
    && apt-get clean \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*

ENV INSTALL_EXTRA_PKGS bash-completion vim git-dpm dh-make

RUN apt-get update -y \
    && apt-get install -y $INSTALL_EXTRA_PKGS \
    && apt-get clean \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
VOLUME ["/build"]

CMD ["/bin/bash", "--rcfile", "/build/.bashrc"]
