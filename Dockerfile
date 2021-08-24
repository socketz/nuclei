FROM golang:1.17-alpine as build-env
RUN go get -v github.com/socketz/nuclei/v2/cmd/nuclei

FROM alpine:latest
RUN apk add --no-cache bind-tools ca-certificates
COPY --from=build-env /go/bin/nuclei /usr/local/bin/nuclei
ENTRYPOINT ["nuclei"]
