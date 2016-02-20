FROM jrms/debpkg
MAINTAINER Jeremías Casteglione <debian@jrms.com.ar>

RUN apt-get update -y \
    && apt-get install -y python-stdeb python3-setuptools \
    && apt-get clean \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*
