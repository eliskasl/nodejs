.PHONY: build build-6 build-8 build-test run default test

IMAGE_NAME = nodejs
CANDIDATE_IMAGE_NAME=nodejs-candidate


default: run

build: build-6 # build-8

build-6:
	docker build --tag=$(IMAGE_NAME):6 6/

build-8:
	docker build --tag=$(IMAGE_NAME):8 8/

build-test:
	docker build --tag=$(CANDIDATE_IMAGE_NAME) 6/

run: build
	docker run -d $(IMAGE_NAME)
#	docker run -d $(IMAGE_NAME):8

test: build-test
	./6/test/run
