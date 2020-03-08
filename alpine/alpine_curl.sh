set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM alpine:3.11.3
RUN apk add --no-cache curl
EOF

docker build -t jmnote/alpine:3.11.3-curl .
docker push jmnote/alpine:3.11.3-curl

