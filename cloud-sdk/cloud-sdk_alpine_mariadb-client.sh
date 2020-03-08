set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM google/cloud-sdk:282.0.0-alpine
RUN apk add --no-cache mariadb-client
EOF

docker build -t jmnote/cloud-sdk:282.0.0-alpine-mariadb-client .
docker push jmnote/cloud-sdk:282.0.0-alpine-mariadb-client
