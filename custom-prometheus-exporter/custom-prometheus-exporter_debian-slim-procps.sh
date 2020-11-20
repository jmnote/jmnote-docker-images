set -ax
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

git clone --depth=1 https://github.com/marckhouzam/custom-prometheus-exporter.git
cd custom-prometheus-exporter/

TAG=debian-procps-$(date +%Y-%m)

cat <<EOF > Dockerfile
FROM golang:1.9 as build

WORKDIR /go/src/github.com/marckhouzam/custom-prometheus-exporter
COPY . .

RUN go-wrapper download github.com/prometheus/client_golang/prometheus && \
    go-wrapper download gopkg.in/yaml.v2 && \
    go-wrapper install && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o custom-prometheus-exporter .

FROM debian:slim
RUN apt-get update && apt-get install -y \
  procps \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /root
COPY --from=build /go/src/github.com/marckhouzam/custom-prometheus-exporter/custom-prometheus-exporter .
ENTRYPOINT ["./custom-prometheus-exporter"]
EOF

docker build -t jmnote/custom-prometheus-exporter:$TAG .
docker push jmnote/custom-prometheus-exporter:$TAG

rm -rf /tmp/jmnote-docker-images

