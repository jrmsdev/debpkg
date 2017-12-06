PKG ?= ERRNOPKG
BUILD_DIR != realpath ./build
PKG_DIR := $(BUILD_DIR)/$(PKG)

.PHONY: default
default: build

.PHONY: _checkpkg
_checkpkg:
	@test -d $(PKG_DIR) || \
			(echo '$(PKG): invalid package name - use PKG=name'; exit 1)

.PHONY: up
up:
	@vagrant up

.PHONY: halt
halt:
	@vagrant halt

.PHONY: st
st:
	@vagrant status

.PHONY: ssh
ssh:
	@vagrant ssh

.PHONY: check
check:
	@vagrant validate

.PHONY: build
build: _checkpkg
	@vagrant ssh -t -c 'cd /build/$(PKG) && sbuild -A'
