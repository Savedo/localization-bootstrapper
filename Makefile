CRYSTAL_BIN ?= $(shell which crystal)
APP_BIN ?= $(shell which localization-bootstrapper)

build:
	$(CRYSTAL_BIN) build --release -o bin/localization-bootstrapper ./bin/localization-bootstrapper.cr $(CRFLAGS)
clean:
	rm -f ./bin/savedo-localizer
test: build
	$(CRYSTAL_BIN) spec
reinstall: build
	cp ./bin/savedo-localizer $(APP_BIN) -rf
