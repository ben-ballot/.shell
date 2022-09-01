PROJECTPATH = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

BLACK := $(VENV_PYTHON) -m black
FLAKE8 := $(VENV_PYTHON) -m flake8

PROJECT := CHANGEME
PKG_NAME := python3-$(PROJECT)

all: lint test

clean: clean-python clean-tox

clean-python:
	@find $(PROJECTPATH) -name "__pycache__" -type d -exec rm -rf {} +
	@find $(PROJECTPATH) -name "pytest_cache" -type d -exec rm -rf {} +

clean-tox:
	rm -rf $(PROJECTPATH)/.tox

dch:
	gbp dch --debian-tag='%(version)s' -D bionic --git-log --first-parent

deb-src:
	debuild -S -sa -I.git -I.tox

deb:
	debuild -us -uc -sa -I.git -I.tox

/var/cache/pbuilder/base-bionic-amd64.cow:
	ARCH=amd64 DIST=bionic git-pbuilder create

pbuilder-deb-src: /var/cache/pbuilder/base-bionic-amd64.cow
	GIT_PBUILDER_OPTIONS='--source-only-changes' \
		ARCH=amd64 DIST=bionic git-pbuilder -sa -I.git -I.tox
	@echo "Now use debsign on $(PROJECTPATH)../$(PKG_NAME)_x.y_source.changes"

install-build-depends:
	sudo apt install \
	    debhelper \
	    git-buildpackage \
	    virtualenv

lint: lint-python

# See .flake8 for config options.
lint-python:
	cd $(PROJECTPATH) && tox -e black && tox -e lint

test: test-python

test-python:
	cd $(PROJECTPATH) && tox -e unit

.PHONY: test lint lint-python test-python all lint lint-python clean clean-python clean-tox clean-venv deb-src dch
