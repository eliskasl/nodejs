.PHONY: build run test

IMAGE_NAME = nodejs
CANDIDATE_IMAGE_NAME=nodejs-candidate
VERSION=6

build:
	docker build --tag=$(IMAGE_NAME):$(VERSION) .

run: build
	docker run -d $(IMAGE_NAME):$(VERSION)

test-build:
	docker build --tag=$(CANDIDATE_IMAGE_NAME):$(VERSION) .

test: test-build
	./test/run
