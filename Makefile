.PHONY: check deploy docker-build run
ENVFILE?=.env
ifeq ($(shell test -e $(ENVFILE) && echo -n yes),yes)
	include ${ENVFILE}
	export
endif
VERSION=0.0.2

check:
	@kubectl kustomize deploy/env/integ

deploy:
	@kubectl kustomize deploy/env/integ | kubectl apply -f -

docker-build:
	@docker build -t registry.ftven.net/media-cloud-ai/testelixir:${VERSION} .

docker-push-registry:
	@docker push registry.ftven.net/media-cloud-ai/testelixir:${VERSION}

run:
	@mix run
