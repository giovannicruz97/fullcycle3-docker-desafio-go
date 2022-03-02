FROM golang:1.17-alpine AS builder

WORKDIR /usr/src/app
COPY . .
RUN go build main.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/main main
CMD [ "/usr/src/app/main" ]
