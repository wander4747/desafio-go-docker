FROM golang:alpine AS build

WORKDIR /go/src/app

COPY . .

RUN go build -o /app main.go

#empty image
FROM scratch

COPY --from=build /app /app

CMD ["/app"]