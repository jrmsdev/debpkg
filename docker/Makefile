include ../mk/env.mk

default:

all: base-img pydeb-img

%-img:
	@if [ "$(@:%-img=%)" = 'base' ] ; \
	then \
		docker build -t $(DOCKER_IMG) $(@:%-img=%)/ ; \
	else \
		docker build -t $(DOCKER_IMG):$(@:%-img=%) $(@:%-img=%)/ ; \
	fi

.PHONY: default
