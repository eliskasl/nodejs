.PHONY: build build-6 run default test

IMAGE_NAME = nodejs


default: run

build: build-6 # build-8

build-6:
	docker build --tag=$(IMAGE_NAME):6 6/

build-8:
	docker build --tag=$(IMAGE_NAME):8 8/

run: build
	docker run -d $(IMAGE_NAME)
#	docker run -d $(IMAGE_NAME):8

test:
	run_test.sh
