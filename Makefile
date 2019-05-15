# Makefile

PREFIX=/Applications
VERSION=normal

APP=$(PREFIX)/Cisco/Cisco AnyConnect Secure Mobility Client.app
APP_RESOURCES=$(APP)/Contents/Resources
BUILD=build
BUILD_IMAGES=$(BUILD)/images
BUILD_RESOURCES=$(BUILD)/resources
BUILD_TEMP=$(BUILD)/temp
IMAGES_PREFIX=cisco-anyconnect-toolbar.drawio
ZIP_SCRIPT=makefile-create-zip.sh


all: build


help:

	@echo 'Usage:'
	@echo
	@echo '    make              run `make build`'
	@echo '    make build        build `Resources.zip` and `Resources-Dark.zip` files'
	@echo '    make install      install assets in AnyConnect (default is `Resources.zip`,'
	@echo '                      but you can use `make install VERSION=dark` to install'
	@echo '                      `Resources-Dark.zip`)'
	@echo '    make uninstall    uninstall assets from AnyConnect'


check-images:

ifeq ("$(wildcard $(BUILD_IMAGES)/$(IMAGES_PREFIX)-*)","")
	$(error images in $(BUILD_IMAGES) are missing)
endif


Resources.zip:

	BUILD=$(BUILD) BUILD_IMAGES=$(BUILD_IMAGES) BUILD_RESOURCES=$(BUILD_RESOURCES) \
		IMAGES_PREFIX=$(IMAGES_PREFIX) \
		bash $(ZIP_SCRIPT) Resources.zip normal


Resources-Dark.zip:

	BUILD=$(BUILD) BUILD_IMAGES=$(BUILD_IMAGES) BUILD_RESOURCES=$(BUILD_RESOURCES) \
		IMAGES_PREFIX=$(IMAGES_PREFIX) \
		bash $(ZIP_SCRIPT) Resources-Dark.zip dark


build: check-images Resources.zip Resources-Dark.zip


check_app_find_app=$(shell [[ -d "$(APP_RESOURCES)" ]] && echo "yes")
check-app:

ifeq ("$(check_app_find_app)","")
	$(error app not found in $(APP_RESOURCES))
endif


install: check-app

ifeq ($(VERSION), normal)
	unzip -d "$(APP_RESOURCES)" Resources.zip
else ifeq ($(VERSION), dark)
	unzip -d "$(APP_RESOURCES)" Resources-Dark.zip
else
	$(error invalid version $(VERSION))
endif
	rm -Rf $(BUILD_TEMP)


uninstall: check-app

	zipinfo -l1 Resources.zip | while read i; do rm "$(APP_RESOURCES)/$$i"; done


.PHONY: all help check-images build check-app install uninstall
