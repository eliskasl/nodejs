.PHONY: build run test build-6 build-8 run-6 run-8 test-6 test-8

build: build-6 build-8

run: run-6 # run-8

test: test-6 test-8

build-6:
	cd ./6; make build

build-8:
	cd ./8; make build

run-6:
	cd ./6; make run

run-8: build-8
	cd ./8; make run

test-6:
	cd ./6; make test

test-8:
	cd ./8; make test
