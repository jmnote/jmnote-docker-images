set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

ALPINE_VERSION=3.14
cat <<EOF > Dockerfile
FROM alpine:$ALPINE_VERSION
RUN apk add --no-cache dcron curl \
&& curl -L https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
&& chmod +x /usr/local/bin/kubectl \
&& apk del curl
EOF

docker build -t jmnote/alpine:$ALPINE_VERSION-dcron-kubectl .
docker push jmnote/alpine:$ALPINE_VERSION-dcron-kubectl

