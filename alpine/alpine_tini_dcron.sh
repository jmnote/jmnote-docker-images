set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

BASE=alpine:3.12.1
cat <<EOF > Dockerfile
FROM $BASE
RUN apk add --no-cache \
  tini \
  dcron
EOF

docker build -t jmnote/$BASE-init-dcron .
docker push jmnote/$BASE-init-dcron

