
REPO = airdb/passport
IMAGE = airdb/jslint
all: fmt lint

fmt:
	gofmt -s -w .

exec:
	docker run -it -v $(shell pwd):/srv/${REPO}/ ${IMAGE} /bin/bash
lint:
	docker run -it -v $(shell pwd):/srv/ ${IMAGE} ${REPO}
