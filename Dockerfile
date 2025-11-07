FROM golang:1.25.3-alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -mod=vendor -o /main cmd/api/main.go

FROM alpine:latest

WORKDIR /app

COPY --from=builder /main .

EXPOSE 3000

CMD ["./main"]
