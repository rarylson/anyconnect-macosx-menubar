# Makefile

PREFIX=/Applications
VERSION=black

APP="Cisco/Cisco AnyConnect Secure Mobility Client.app"
BUILD=build
BUILD_IMAGES=$(BUILD)/images
BUILD_RESOURCES=$(BUILD)/resources
IMAGES_PREFIX=cisco-anyconnect-toolbar.drawio
ZIP_SCRIPT=makefile-create-zip.sh

all: build

help:
	@echo 'Usage:'
	@echo
	@echo '    make              run `make build`'
	@echo '    make build        build `Resources.zip` and `Resources-White.zip` files'
	@echo '    make install      install assets in AnyConnect (default is `Resources.zip`,'
	@echo '                      but you can use `make install VERSION=white` to install'
	@echo '                      `Resources-White.zip`)'
	@echo '    make uninstall    remove assets from AnyConnect'

check-images:
ifeq ("$(wildcard $(BUILD_IMAGES)/$(RESOURCE_WHITE_PATTERN)*)","")
	$(error images in $(BUILD_IMAGES) are missing)
endif

Resources.zip:
	BUILD=$(BUILD) BUILD_IMAGES=$(BUILD_IMAGES) BUILD_RESOURCES=$(BUILD_RESOURCES) \
		IMAGES_PREFIX=$(IMAGES_PREFIX) \
		bash $(ZIP_SCRIPT) Resources.zip black

Resources-White.zip:
	BUILD=$(BUILD) BUILD_IMAGES=$(BUILD_IMAGES) BUILD_RESOURCES=$(BUILD_RESOURCES) \
		IMAGES_PREFIX=$(IMAGES_PREFIX) \
		bash $(ZIP_SCRIPT) Resources-White.zip white

build: check-images Resources.zip Resources-White.zip

.PHONY: all help check-images build
