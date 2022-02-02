set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

ALPINE_VERSION=3.14.2
cat <<EOF > Dockerfile
FROM alpine:$ALPINE_VERSION
RUN apk add --no-cache dcron
EOF

docker build -t jmnote/alpine:$ALPINE_VERSION-dcron .
docker push jmnote/alpine:$ALPINE_VERSION-dcron

