set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM alpine:3.11.3
RUN apk add --no-cache apache2-utils
EOF

docker build -t jmnote/alpine:3.11.3-apache2-utils .
docker push jmnote/alpine:3.11.3-apache2-utils

