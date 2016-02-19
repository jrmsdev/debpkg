DOCKER_USER ?= $(shell id -u):$(shell id -g)
DOCKER_IMG ?= jrms/debpkg

docker-images:
	make -C docker/ all

docker-run:
	docker run --rm -it --user $(DOCKER_USER) \
               -e USER=$(shell id -un) \
               -e DOCKER_IMG=$(DOCKER_IMG) \
               -v $(PWD)/build:/build $(DOCKER_IMG) $(DOCKER_CMD)

# http://www.gnu.org/software/make/manual/make.html#Text-Functions
docker-run-%:
	@make docker-run DOCKER_IMG=$(DOCKER_IMG):$(@:docker-run-%=%)

.PHONY: docker-images docker-run
