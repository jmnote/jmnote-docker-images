set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

OS=alpine
VER=3.12.1
PKG=tini-dcron
cat <<EOF > Dockerfile
FROM $BASE
RUN apk add --no-cache \
  tini \
  dcron
EOF

docker build -t jmnote/$OS:$PKG .
docker push     jmnote/$OS:$PKG
docker tag      jmnote/$OS:$PKG jmnote/$OS:$VER-$PKG
docker push                     jmnote/$OS:$VER-$PKG

