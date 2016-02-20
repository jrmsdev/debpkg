include mk/env.mk

default:

docker-images:
	make -C docker/ all

docker-run:
	docker run --rm -it --user $(DOCKER_USER) \
		-e LOGNAME=$(shell id -un) \
		-e USER=$(shell id -un) \
		-e DOCKER_IMG=$(DOCKER_IMG) \
		-v $(PWD)/build:/build $(DOCKER_IMG) $(DOCKER_CMD)

# http://www.gnu.org/software/make/manual/make.html#Text-Functions
docker-run-%:
	@make docker-run DOCKER_IMG=$(DOCKER_IMG):$(@:docker-run-%=%)

docker-sulogin:
	@make docker-run DOCKER_USER=0:0 \
		DOCKER_CMD='/bin/bash --rcfile /build/.sulogin'

docker-sulogin-%:
	@make docker-sulogin DOCKER_IMG=$(DOCKER_IMG):$(@:docker-sulogin-%=%)

.PHONY: default docker-images docker-run docker-sulogin
