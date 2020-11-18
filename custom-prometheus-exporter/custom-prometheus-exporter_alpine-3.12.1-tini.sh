set -ax
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

git clone --depth=1 https://github.com/marckhouzam/custom-prometheus-exporter.git
cd custom-prometheus-exporter/

cat <<EOF > Dockerfile
FROM golang:1.9 as build
WORKDIR /go/src/github.com/marckhouzam/custom-prometheus-exporter
COPY . .
RUN go-wrapper download github.com/prometheus/client_golang/prometheus && \
    go-wrapper download gopkg.in/yaml.v2 && \
    go-wrapper install && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o custom-prometheus-exporter .
FROM alpine:3.12.1
RUN apk add --no-cache \
    tini
WORKDIR /root
COPY --from=build /go/src/github.com/marckhouzam/custom-prometheus-exporter/custom-prometheus-exporter .
ENTRYPOINT ["./custom-prometheus-exporter"]
EOF

docker build -t jmnote/custom-prometheus-exporter:2020-11-alpine-3.12.1-tini .
docker push jmnote/custom-prometheus-exporter:2020-11-alpine-3.12.1-tini

rm -rf /tmp/jmnote-docker-images