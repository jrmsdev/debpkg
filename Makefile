include mk/env.mk

docker-images:
	make -C docker/ all

docker-run:
	docker run --rm -it --user $(DOCKER_USER) \
		--privileged=$(DOCKER_PRIV) \
		-e USER=$(shell id -un) \
		-e DOCKER_IMG=$(DOCKER_IMG) \
		-v $(PWD)/build:/build $(DOCKER_IMG) $(DOCKER_CMD)

# http://www.gnu.org/software/make/manual/make.html#Text-Functions
docker-run-%:
	@make docker-run DOCKER_IMG=$(DOCKER_IMG):$(@:docker-run-%=%)

docker-sulogin:
	@make docker-run DOCKER_USER=0:0 \
		DOCKER_PRIV=true \
		DOCKER_CMD='/bin/bash --rcfile /build/.sulogin'

docker-sulogin-%:
	@make docker-sulogin DOCKER_IMG=$(DOCKER_IMG):$(@:docker-sulogin-%=%)

.PHONY: docker-images docker-run docker-sulogin
