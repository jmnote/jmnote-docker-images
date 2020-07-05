set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/golang:1.14.4-alpine-git-curl-dcron-openssh-supervisor

cat <<'EOF' > Dockerfile
FROM golang:1.14.4-alpine

RUN set -ax \
&& apk --no-cache add \
  git \
  curl \
  dcron \
  openssh \
  supervisor \
&& go get github.com/gin-gonic/gin
EOF

docker build -t $IMAGE . && docker push $IMAGE

