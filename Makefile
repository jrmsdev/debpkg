PKG ?= ERRNOPKG
BUILD_DIR != realpath ./build
PKG_DIR := $(BUILD_DIR)/$(PKG)

.PHONY: default
default: sbuild

.PHONY: _checkpkg
_checkpkg:
	@test -d $(PKG_DIR) || \
			(echo '$(PKG): invalid package name - use PKG=name'; exit 1)

.PHONY: up
up:
	vagrant up

.PHONY: halt
halt:
	vagrant halt

.PHONY: st
st:
	vagrant status

.PHONY: ssh
ssh:
	vagrant ssh

.PHONY: check
check:
	vagrant validate

.vagrant/ssh-config:
	vagrant ssh-config >.vagrant/ssh-config

.PHONY: pull
pull: _checkpkg .vagrant/ssh-config
	rsync -vax --delete-before -e 'ssh -F .vagrant/ssh-config' \
			default:/build/$(PKG)/ ./build/$(PKG)/

.PHONY: sync
sync:
	vagrant rsync

.PHONY: sbuild
sbuild: _checkpkg sync
	vagrant ssh -t -c 'cd /build/$(PKG) && sbuild -A --run-lintian'
	vagrant ssh -t -c 'cd /build/$(PKG) && lintian --display-info --display-experimental --pedantic `ls -tr ../*.dsc | tail -n 1`'
