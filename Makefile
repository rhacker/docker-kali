NAME = nxqd/kali
VERSION = 0.1.0
CONTAINER = $(NAME):$(VERSION)

.PHONY: all build test tag_latest release ssh

all: build

build:
	docker build -t $(CONTAINER) .

debug: build
	docker run -t -i --rm $(CONTAINER) bash

tag_latest:
	docker tag -f $(CONTAINER) $(NAME):latest

release: tag_latest
	docker push $(NAME)
