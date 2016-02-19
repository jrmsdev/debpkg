FROM jrms/debpkg
MAINTAINER Jeremías Casteglione <debian@jrms.com.ar>

ENV INSTALL_EXTRA_PKGS python-stdeb python3-setuptools

RUN apt-get update -y \
    && apt-get install -y $INSTALL_EXTRA_PKGS \
    && apt-get clean \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*
