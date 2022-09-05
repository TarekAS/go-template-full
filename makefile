.PHONY: hadolint
hadolint:
	hadolint *dockerfile*

.PHONY: scan
scan:
	go list -json -deps | docker run --rm -i sonatypecommunity/nancy:latest sleuth

.PHONY: lint
lint:
	go mod tidy
	golangci-lint run --fix

.PHONY: build
build:
	DOCKER_CONTENT_TRUST=1 docker build -t gosample:latest .

.PHONY: run
run:
	docker run gosample:latest .

.PHONY: test
test:
	gotestsum

.PHONY: test.integration
test.integration:
	docker compose up --abort-on-container-exit --build
	gotestsum -- -tags=integration ./...
	docker compose down --remove-orphans --volumes
