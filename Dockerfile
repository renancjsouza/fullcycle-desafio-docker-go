FROM golang:1.22.7-alpine AS builder

WORKDIR /go

COPY . .

RUN go build -o fullcycle hello/hello.go

FROM scratch

COPY --from=builder /go/fullcycle /fullcycle

ENTRYPOINT [ "/fullcycle" ]