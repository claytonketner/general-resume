all: clean build

.PHONY: clean
clean:
	rm output/*

.PHONY: build
build:
	./build.sh
