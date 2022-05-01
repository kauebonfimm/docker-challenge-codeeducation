FROM golang:1.17 as build

ENV HOME /app
ENV CGO_ENABLED 0
ENV GOOS linux

WORKDIR /app

COPY . .

RUN go build ./main.go

# Running stage deploy
FROM scratch as deploy

WORKDIR /root/

COPY --from=build /app/main .

ENTRYPOINT [ "/root/main" ]
