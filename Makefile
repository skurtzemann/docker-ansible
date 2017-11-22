APP = $(shell basename `pwd` | cut -d "-" -f2-)
VERSION = $(shell cat VERSION)
NAME = skurtzemann/$(APP)


name:
	@echo "$(NAME):$(VERSION)"

build:
	docker build -t $(NAME):$(VERSION) .

login:
	docker run -it --rm --entrypoint=bash $(NAME):$(VERSION)

push:
	docker push $(NAME):$(VERSION)