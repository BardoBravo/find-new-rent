FROM golang:1.12 as build

WORKDIR $GOPATH/src/github.com/BardoBravo/find-new-rent
COPY scraper scraper
COPY main.go .

RUN go get -d -v ./...
RUN go install

FROM gcr.io/distroless/base

COPY --from=build /go/bin/find-new-rent /
CMD ["/find-new-rent"]
