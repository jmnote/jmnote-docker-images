set -ax
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images


git clone --depth=1 https://github.com/marckhouzam/custom-prometheus-exporter.git
cd custom-prometheus-exporter/

TAG=2020-12-11

cat <<EOF > Dockerfile
FROM golang:1.9 as builder1
WORKDIR /go/src/github.com/marckhouzam/custom-prometheus-exporter
COPY . .
RUN go-wrapper download github.com/prometheus/client_golang/prometheus && \
    go-wrapper download gopkg.in/yaml.v2 && \
    go-wrapper install && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o custom-prometheus-exporter .

FROM alpine as builder2
RUN apk add --no-cache \
  git \
  build-base \
&& git clone https://github.com/ChristopherSchultz/fast-file-count.git \
&& cd fast-file-count/ \
&& gcc dircnt.c -o /usr/local/bin/dircnt \
&& dircnt

FROM alpine
RUN apk add --no-cache \
    tini \
    curl \
&& curl -L https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
&& chmod +x /usr/local/bin/kubectl

WORKDIR /root
COPY --from=builder1 /go/src/github.com/marckhouzam/custom-prometheus-exporter/custom-prometheus-exporter .
COPY --from=builder2 /usr/local/bin/dircnt /usr/local/bin/
ENTRYPOINT ["./custom-prometheus-exporter"]
EOF

docker build -t jmnote/custom-prometheus-exporter:$TAG .
docker push jmnote/custom-prometheus-exporter:$TAG

rm -rf /tmp/jmnote-docker-images
