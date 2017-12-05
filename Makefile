PKG ?= ERRNOPKG
BUILD_DIR != realpath ./build
PKG_DIR := $(BUILD_DIR)/$(PKG)

.PHONY: default
default: build

.PHONY: _checkpkg
_checkpkg:
	@test -d $(PKG_DIR) || \
			(echo '$(PKG): invalid package name - use PKG=name'; exit 1)

.PHONY: vmup
vmup:
	@vagrant up

.PHONY: vmhalt
vmhalt:
	@vagrant halt

.PHONY: vmst
vmst:
	@vagrant status

.PHONY: check
check:
	@vagrant validate

.PHONY: build
build: _checkpkg
	@vagrant ssh -t -c 'cd /build/$(PKG) && sbuild -A'
