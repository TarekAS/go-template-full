
# go-template-full

This is a comprehensive template for Go projects.

## Installation

1. [Install Go](https://go.dev/doc/install)
2. Add `export PATH=$PATH:$HOME/go/bin` into your shell startup script (e.g. `./zshenv`).
3. Install a Go IDE/plugin.
4. Install required tools:
    - [golangci-lint](https://github.com/golangci/golangci-lint): Bundles many Go linters in one. [Integrate it into your IDE](https://golangci-lint.run/usage/integrations/).
    - [sqlc](https://github.com/kyleconroy/sqlc): Converts SQL to Go (use instead of ORM).
    - [dbmate](https://github.com/amacneil/dbmate): Performs database migrations.
    - [trivy](https://github.com/aquasecurity/trivy): Dependency scanner for vulnerabilities.
    - [gotestsum](https://github.com/gotestyourself/gotestsum): Formatted test runner.
    - [k6](https://github.com/grafana/k6): For Load Testing.
    - [oapi-codegen](https://github.com/deepmap/oapi-codegen): Generates Go HTTP APIs from OpenAPI 3.0 spec.
5. Refer to [project-layout](https://github.com/golang-standards/project-layout) for how to organize your Go code.

## Libraries

These are the recommended libraries to choose from.

| Library                                                         | Description             |
|-----------------------------------------------------------------|-------------------------|
| [echo](https://github.com/labstack/echo)                        | HTTP API mini-framework |
| [grpc-go](https://github.com/grpc/grpc-go)                      | gRPC API                |
| [go-money](https://github.com/Rhymond/go-money)                 | Currency                |
| [zerolog](https://github.com/rs/zerolog)                        | Logging                 |
| [godotenv](https://github.com/joho/godotenv)                    | Dot Env Config          |
| [is](https://github.com/matryer/is)                             | Testing mini-framework  |
| [gomock](https://github.com/golang/mock)                        | Mocking                 |
| [testfixtures](https://github.com/go-testfixtures/testfixtures) | Fixtures                |

## To figure out

1. Open API Code Gen:   oapi-codegen vs. openapi-generator vs. swagger-go?
2. E2E API Testing:     open-api based E2E tool?
3. OpenTelemetry Integration
