# syntax=docker/dockerfile:1
# Stage 1
FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY go.mod *.go ./

RUN CGO_ENABLED=0 go build -o ./homework1

# Stage 2
FROM scratch

COPY --from=builder /app/homework1 /go/bin/homework1

EXPOSE 8000

ENTRYPOINT ["/go/bin/homework1"]
