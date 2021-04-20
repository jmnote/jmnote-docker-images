set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/openssl:1.1.1b-debian-10

cat <<'EOF' > Dockerfile
FROM debian:10

RUN set -ax \

EOF

docker build -t $IMAGE . && docker push $IMAGE

