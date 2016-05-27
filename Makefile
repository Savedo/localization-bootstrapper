CRYSTAL_BIN ?= $(shell which crystal)
LOCALIZER_BIN ?= $(shell which savedo-localizer)

build:
	$(CRYSTAL_BIN) build --release -o bin/savedo-localizer ./bin/savedo-localizer.cr $(CRFLAGS)
clean:
	rm -f ./bin/savedo-localizer
test: build
	$(CRYSTAL_BIN) spec
reinstall: build
	cp ./bin/savedo-localizer $(LOCALIZER_BIN) -rf

