set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM google/cloud-sdk:alpine
RUN apk add --no-cache openssh
EOF

docker build -t jmnote/cloud-sdk:alpine-openssh .
docker push jmnote/cloud-sdk:alpine-openssh
