all: clean build

.PHONY: clean
clean:
	rm -f output/*

.PHONY: build
build:
	./build.sh
