default:

base-img:
	docker build -t jrms/debpkg base/

pydeb-img:
	docker build -t jrms/debpkg:pydeb pydeb/

all: base-img pydeb-img

.PHONY: default all base-img pydeb-img
