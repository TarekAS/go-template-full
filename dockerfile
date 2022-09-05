ARG go_version=1.18

FROM golang:$go_version AS base

# Download lint and test tools.
ARG golangcilint_version=1.45.2
ARG gotestsum_version=1.8.0
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sSfL "https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh" | sh -s -- -b "$(go env GOPATH)/bin" "v${golangcilint_version}"
RUN curl -sSfL "https://github.com/gotestyourself/gotestsum/releases/download/v${gotestsum_version}/gotestsum_${gotestsum_version}_linux_amd64.tar.gz" | tar -xz -C /usr/local/bin gotestsum

# Download Go modules.
WORKDIR /src
COPY go.mod .
COPY go.sum .
RUN go mod download && go mod verify
COPY . .

# Test
FROM base AS test
RUN gotestsum --junitfile test-results/unit-tests.xml

# Lint
FROM base AS lint
RUN golangci-lint run

# Build
FROM base AS build
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64
RUN go build -ldflags='-extldflags "-static"' -o /app ./cmd

# "latest" tag is ok for distroless.
# hadolint ignore=DL3007
FROM gcr.io/distroless/static:latest AS final
COPY --from=base /src/.env /
COPY --from=build /app /
ENTRYPOINT ["/app"]
